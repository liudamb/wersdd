package aspect;


import entity.Orderdetail;
import entity.Orderinfo;
import entity.Userinfo;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import serviceimpl.OrderdetailServiceImpl;
import serviceimpl.OrderinfoServiceImpl;
import serviceimpl.UserinfoServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Random;

public class OrderInfoAspect {
    @Autowired
    OrderinfoServiceImpl oisi;
    @Autowired
    UserinfoServiceImpl uisi;
    @Autowired
    OrderdetailServiceImpl odsi;
    public void before(JoinPoint jp) {
        //参数JoinPoint可以获取方法的信息(所在类,方法名,方法参数)
//		String methodName=jp.getSignature().getName();//获取Controller里被调用的方法名
//        List<Object> args = Arrays.asList(jp.getArgs());
//        System.out.println(args+"========");

    }

    public void after(JoinPoint jp) {


    }

    //Object res和配置文件里的returning="res"名字一致,用来获取Controller里方法的返回值
    public void afterReturning(JoinPoint jp,Object res) {

    }


    public void afterThrowing(JoinPoint jp,Exception ex) {
        System.out.println("我是afterThrowing");
        String methodName=jp.getSignature().getName();//获取Controller里被调用的方法名
        System.out.println(methodName+"方法发生了"+ex.getMessage()+"异常");

    }



    public Object aroundMethod(ProceedingJoinPoint point){
        Object result = null;

        String methodName = point.getSignature().getName();
        try {
            //前置通知
            System.out.println("执行的方法"+ methodName+"参数:"+ Arrays.asList(point.getArgs()));
            List<Object> args = Arrays.asList(point.getArgs());
            Orderinfo oi=new Orderinfo();
            Date date=new Date();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
            String orderTime=sdf.format(date);
            Random rand=new Random();
            int randNum=rand.nextInt()*100000;
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            HttpSession session=request.getSession();
            System.out.println("====="+session.getAttribute("user").toString());
            Userinfo ui=uisi.selectByUsername(session.getAttribute("user").toString());
            oi.setUserid(ui.getuId());
            oi.setStatus(0);
            oi.setOrdertime(orderTime);
            oi.setPid(orderTime+randNum);
            oisi.insertSelective(oi);
            Orderinfo oo=oisi.selectOidByPid(oi.getPid());
            System.out.println(oo.toString());
            Orderinfo oi2=oisi.selectByPrimaryKey(oo.getoId());
            Orderdetail od=new Orderdetail();
            od.setOdId(oi2.getoId());
            System.out.println("1111   "+args.get(0).toString());
            System.out.println("2222   "+args.get(1).toString());
            od.setpId(Integer.parseInt(args.get(0).toString()));
            od.setOdNum(Integer.parseInt(args.get(1).toString()));
            odsi.insert(od);
            //执行目标方法
            result = point.proceed();
            //后置通知
            System.out.println("The method "+ methodName+" end. result<"+ result+">");
        } catch (Throwable e) {
            //异常通知
            System.out.println("this method "+methodName+" end.ex message<"+e+">");
            throw new RuntimeException(e);
        }
        //返回通知
        System.out.println("The method "+ methodName+" end.");
        System.out.println("result===="+result);

        return result;
    }



}
