package controller;

import entity.Productinfo;
import entity.Userinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import serviceimpl.ProductinfoServiceImpl;
import serviceimpl.UserinfoServiceImpl;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

@RestController
public class
PayController {

    @Autowired
    JedisPool jedisPool;//redies里的缓存值


    @Autowired
    ProductinfoServiceImpl psi;

    @Autowired
    UserinfoServiceImpl usi;

        @RequestMapping("/getCarItems")
    public List<Productinfo> getCarItems(HttpServletRequest req){

      Jedis jedis=jedisPool.getResource();
      Map<String,String> map=jedis.hgetAll(req.getSession().getAttribute("user").toString());
     List<Productinfo> list=new ArrayList<Productinfo>();

       if(map.isEmpty()){
           return  null;
       }else{
         for(Map.Entry<String,String> entry:map.entrySet()){
             Productinfo pi=psi.selectByPrimaryKey(Integer.parseInt(entry.getKey()));
                          pi.setpNum(Integer.parseInt(entry.getValue()));
                          list.add(pi);

         }

         return list;

       }

        }


    @RequestMapping("/addItemsNum")
  public void addItemsNum(@RequestParam String pid,@RequestParam String pnum,HttpServletRequest req){
    Jedis jedis=jedisPool.getResource();
    Map<String,String> map=jedis.hgetAll(req.getSession().getAttribute("user").toString());
        map.put(pid,pnum);
        jedis.hmset(req.getSession().getAttribute("user").toString(),map);
    }


    @RequestMapping("/removeItems")
    public void removeItems(@RequestParam String pid,HttpServletRequest req){
        Jedis jedis=jedisPool.getResource();
        Map<String,String> map=jedis.hgetAll(req.getSession().getAttribute("user").toString());
        String username=req.getSession().getAttribute("user").toString();
        map.remove(pid);
        jedis.del(username);//先删除redis的用户数据
        jedis.hmset(username,map);

    }


    @RequestMapping("/sendEmail")
    public String sendCheckCode(HttpServletRequest req, HttpServletResponse resp) throws IOException, MessagingException {
          Userinfo ui=usi.selectByUsername(req.getSession().getAttribute("user").toString());

        int randomNum=(int)((Math.random()*9+1)*100000);
        sendEmail(ui.getEmail(),randomNum,req,resp);

        return String.valueOf(randomNum);

    }





    public  void sendEmail(String emailCount, int randomNum, HttpServletRequest req, HttpServletResponse resp) throws IOException, MessagingException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        String from="1024618602@qq.com";//你自己的邮箱
        String host="smtp.qq.com";//本机地址
        //Properties可以确定系统的属性,就是为了寻找我们的host
        Properties properties=System.getProperties();
        properties.setProperty("mail.smtp.host", host);
        properties.setProperty("mail.smtp.port", "25");
        properties.put("mail.smtp.auth","true");//开启代理

        Authenticator aut=new Authenticator() {//创建Authenticator内部类来填入代理的用户名前缀和密码

            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication("1024618602","aoooimxaburtbbji");//填用户名和代理密码

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


    @RequestMapping("/pay")
    public void pay(@RequestParam String pid,@RequestParam Integer pnum,HttpServletRequest req){
        Jedis jedis=jedisPool.getResource();
        Map<String,String> map=jedis.hgetAll(req.getSession().getAttribute("user").toString());
        System.out.println("删除前:"+map);
        String username=req.getSession().getAttribute("user").toString();
        map.remove(pid);
        System.out.println("删除后:"+map);

        jedis.del(username);//先删除redis的用户数据
        jedis.hmset(username,map);
        Productinfo pi=psi.selectByPrimaryKey(Integer.parseInt(pid));
        if(pi.getpNum()-pnum<0||pi.getpNum()-pnum==0){
            pi.setpNum(0);
        }else{
            pi.setpNum(pi.getpNum()-pnum);
        }

        psi.updateByPrimaryKeySelective(pi);



    }


}
