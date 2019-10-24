`<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>登录注册</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script  src="<%=basePath%>resource/js/login.js"></script>
    <link rel="stylesheet" href="<%=basePath%>resource/css/login.css" type="text/css" media="all">

</head>

<body>
<h1>登录注册</h1>
<div class="container w3layouts agileits">
  <div class="login w3layouts agileits">
    <h2>登 录</h2>
   
      <input type="text"      id="username1"  placeholder="用户名" >
      <input type="password"  id="password1" placeholder="密码"   >
    
    <ul class="tick w3layouts agileits">
      <li>
        <input type="checkbox" id="brand1" value="" >
        <label for="brand1"><span></span>记住我</label>
      </li>
    </ul>
	
    <div class="send-button w3layouts agileits">    
        <input type="button" value="登 录" id="btnLogin">
           <div id="msg"></div>
    </div>


	 
    <a href="<%=path%>/resource/login/forgetPwd.jsp" target="_blank">忘记密码?</a>	
    <div class="social-icons w3layouts agileits">
      <p>- 其他方式登录 -</p>
      <ul>
        <li class="qq"><a href="#"> <span class="icons w3layouts agileits"></span> <span class="text w3layouts agileits">QQ</span></a></li>
        <li class="weixin w3ls"><a href="#"> <span class="icons w3layouts"></span> <span class="text w3layouts agileits">微信</span></a></li>
        <li class="weibo aits"><a href="#"> <span class="icons agileits"></span> <span class="text w3layouts agileits">微博</span></a></li>
      </ul>
    </div>
	
	
  </div>
  
  <div class="register w3layouts agileits" id="registerDiv">
    <h2>注 册</h2>
      <input type="text"       id="username2"         placeholder="用户名"   >
      <input type="password"   id="password2"     placeholder="密码"     >
      <input type="text"       id="email"        placeholder="邮箱"     >

    <div class="send-button w3layouts agileits">
        <input type="button" value="免费注册" id="btnRegister">
        <div id="msg2"></div>
    
    </div>
	 
	 
    <div class="clear"></div>
	
  </div>
  
  <div class="clear"></div>
</div>

<div class="footer w3layouts agileits">
  <p>Copyright &copy; More Templates</p>
</div>


<script type="text/javascript">
 $(function () {
   var username="${sessionScope.info.username}";
   var password="${sessionScope.info.password}";
   if(username&&password){
     $("#username1").val(username);
     $("#password1").val(password);
     $("#brand1").attr("checked","checked");
   }else{
     $("#username1").val('');
     $("#password1").val('');
   }



   $("#btnLogin").click(function(){
   var username=$("#username1").val();
   var password=$("#password1").val();
   if(username&&password){
     if($('input[type="checkbox"]').is(':checked')){
       $.ajax({
         url:"login",
         type:"post",
         data:{
           "username":username,
           "password":password,
           "check":"true"
         },
         success:function(data){

           if(data=='yes'){
         window.location.href="<%=basePath%>resource/shop/shopping.jsp";
           }
         }
       });
     }else{
       $.ajax({
         url:"login",
         type:"post",
         data:{
           "username":username,
           "password":password,
           "check":"false"
         },
         success:function(data){
           if(data=='yes') {
             window.location.href="<%=basePath%>resource/shop/shopping.jsp";
           }
         }
       });
     }




   }else{
     $("#msg").html('用户名或密码不能为空');
   }

   });



   window.flag=true;
  $("#btnRegister").click(function(){
    var inputs=$(".register input");//
    /*遍历数组,目的是寻找数组中值为空的input*/
    for(var i=0;i<inputs.length;i++){
      if(!inputs.eq(i).val()){
       
            flag=false;//如果输入框有空的flag为false 不往controler层传值
            if(i==0){
              inputs.eq(i).attr("placeholder","用户名不能为空");
            }else if(i==1){
              inputs.eq(i).attr("placeholder","密码不能为空");
            }else{
              inputs.eq(i).attr("placeholder","邮箱不能为空");
            }

      }

      inputs.eq(i).focus(function(event){
        if($(this).val()){
          flag=true;
        }

      });


    }
    /*注册*/
    if(flag){
      $.ajax({
        url:"selectByUsername",
        type:"post",
        data:{
          "username":$("#username2").val(),//获取里面的值
          "password":$("#password2").val(),
          "email":$("#email").val()
        },
        success:function(data){
         if(data=='no'){
           $("#msg2").html('用户名已存在');
          window.setTimeout(clearMsg,3000);
         }else if(data=='yes'){
           $("#username2").val('');//有''就是用空的替换原来注册时写的 (相当于清空输入框)1
           $("#password2").val('');
           $("#email").val('');
           $("#msg2").html('注册成功');
           window.setTimeout(clearMsg,3000);

         }else{
           $("#msg2").html('注册失败');
           window.setTimeout(clearMsg,3000);
         }

        }

      });

    }

  });



   function clearMsg(){
     $("#msg2").html('');
   }


 });





</script>

</body>


</html>
