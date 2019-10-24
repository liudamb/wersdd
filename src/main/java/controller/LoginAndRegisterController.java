package controller;

import entity.Userinfo;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import serviceimpl.UserinfoServiceImpl;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;


@RestController
public class LoginAndRegisterController {
    @Autowired
    UserinfoServiceImpl usi;

    @RequestMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, @RequestParam String check, HttpServletRequest req){
    HttpSession s=req.getSession();
    s.setAttribute("user",username);

//记住密码
    if(check.equals("true")){
        Userinfo ui=new Userinfo();
        ui.setUsername(username);
        ui.setPassword(password);
        HttpSession session=req.getSession();
        session.setAttribute("info",ui);

        Userinfo ui2=usi.selectByUsername(username);
        if(ui2!=null){
        if(DigestUtils.md5Hex(password.getBytes()).equals(ui2.getPassword())){
            return "yes";
        }else{
            return "no";//密码错误
        }

        }else{
            return "nothing";//用户不存在
        }

    }else{
        HttpSession session=req.getSession();
        session.removeAttribute("info");
        Userinfo ui2=usi.selectByUsername(username);
        if(ui2!= null){
            if(DigestUtils.md5Hex(password.getBytes()).equals(ui2.getPassword())){
                return "yes";
            }else{
                return "no";//密码错误
            }
        }else{
            return "nothing";//用户不存在
        }

    }

    }






    @RequestMapping("/selectByUsername")
    public String register(@RequestParam String username,@RequestParam String password,@RequestParam String email){
    Userinfo ui=usi.selectByUsername(username);
    if(ui!=null){
        return "no";
    }else{
        Userinfo u=new Userinfo();
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        String time=sdf.format(date);

        u.setUsername(username);
        u.setPassword(DigestUtils.md5Hex(password.getBytes()));
        u.setEmail(email);
        u.setRegisterTime(time);

        if(usi.insertSelective(u)>0){
            return "yes";
        }else{
            return "error";
        }

    }

    }

    /*验证码*/
    public  void sendEmail(String emailCount, int randomNum, HttpServletRequest req, HttpServletResponse resp) throws IOException, MessagingException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        String from="452008551@qq.com";//你自己的邮箱
        String host="smtp.qq.com";//本机地址
        //Properties可以确定系统的属性,就是为了寻找我们的host
        Properties properties=System.getProperties();
        properties.setProperty("mail.smtp.host", host);
        properties.setProperty("mail.smtp.port", "25");
        properties.put("mail.smtp.auth","true");//开启代理

        Authenticator aut=new Authenticator() {//创建Authenticator内部类来填入代理的用户名前缀和密码

            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication("452008551","dvesoupiziiabgdg");//填用户名和代理密码

            }

        };

        //创建Session会话,Session是java.mail API最高入口
        Session session=Session.getDefaultInstance(properties,aut);
        //MimeMessage获取session对象,就可以创建要发送的邮箱内容和标题
        MimeMessage message=new MimeMessage(session);
        try {
            message.setFrom(new InternetAddress(from));//设置你自己的邮箱
            message.addRecipients(Message.RecipientType.TO, emailCount);//设置接受邮箱
            message.setSubject("验证码");//设置邮箱标题
            message.setText("您本次的验证码是:"+randomNum);//邮箱内容
            Transport.send(message);//发送邮箱

        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    /*获取验证码*/
    @RequestMapping("/getUser")
    public String getUser(@RequestParam String username, HttpServletRequest req,HttpServletResponse resp) throws IOException, MessagingException {
        Userinfo ui=usi.selectByUsername(username);
        int randomNum=(int)((Math.random()*9+1)*100000);
        if(ui!=null){
            sendEmail(ui.getEmail(),randomNum,req,resp);
            return String.valueOf(randomNum);
        }else{
            return "no";
        }

    }

    /*忘记密码中的修改密码*/
    @RequestMapping("/updatePWD")
    public String  updatePWD(@RequestParam String username,@RequestParam String password,@RequestParam String code,@RequestParam String randNum){
        Userinfo ui=usi.selectByUsername(username);

        if(ui!=null){
            /*获取修改日期，将Data类型转为String类型*/
            Date data=new Date();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            String time=sdf.format(data);
            ui.setRegisterTime(time);

            //获取密码
            ui.setPassword(DigestUtils.md5Hex(password.getBytes()));
            if(code.equals(randNum)){
                int line=usi.updateByPrimaryKeySelective(ui);
                if(line>0){
                    System.out.println("密码修改成功");
                    return "ok";
                }else {
                    return "no";
                }
            }else {
                return "errorcode";
            }
        }else {
            return "false";
        }
    }

}
