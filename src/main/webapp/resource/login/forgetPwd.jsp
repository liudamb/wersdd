<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>忘记密码</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>


<link rel="stylesheet" href="<%=basePath%>resource/css/login.css" type="text/css" media="all">
<style>


#msg{
  display: inline-block;
    color:#ffffff;

}
.container{
	height: 350px;
}


	#sendmsgDiv{
		display: inline-block;
	}

#sendmsg,#updatePwd{
	width: 140px;
}

</style>


</head>

<body>
<h1></h1>
<div class="container w3layouts agileits">
  <div class="login w3layouts agileits">
    <h2>忘记密码</h2>
   
      <input type="text"      id="username"  placeholder="输入用户名" >


     <div class="send-button w3layouts agileits" id="sendmsgDiv">    
        <input type="button" value="发送验证码" id="sendmsg">
     </div>

      <input type="text"      id="code"  placeholder="输入验证码" >

      <input type="password"  id="password" placeholder="输入新密码"  >
    

	
    <div class="send-button w3layouts agileits">    
        <input type="button" value="确定修改" id="updatePwd">
           <div id="msg"></div>

    </div>


	
	
  </div>
  

  
</div>

<div class="footer w3layouts agileits">
  <p id="copy">Copyright &copy; More Templates</p>
</div>


<script type="text/javascript">
$(function(){
    window.randNum;
 $("#sendmsg").click(function () {
   if($("#username").val()==''){
       $("#msg").html("用户名不能为空");
       return;
   }else{

       $.ajax({
        url:"getUser",
           type:"post",
           data:{
            "username":$("#username").val()
           },
           success:function(data){
            if(isNaN(data)){
                $("#msg").html("用户名不存在");

            }else{
                $("#msg").html("验证码已发送");
                 randNum=data;
                 alert(data);
            }

           }

       });
   }

 });



    $("#updatePwd").click(function () {
        if($("#username").val()==''||$("#code").val()==''||$("#password").val()==''){
            $("#msg").html("验证码或密码不能为空");
            return;
        }else{

            $.ajax({
                url:"updatePWD",
                type:"post",
                data:{
                    "username":$("#username").val(),
                    "password":$("#password").val(),
                    "code":$("#code").val(),
                    "randNum":randNum
                },
                success:function(data){
                    if(data=='ok'){
                        $("#msg").html("密码修改成功");
                        //修改成功自动跳转到登录页面
                        alert("修改成功");
                        window.location.href="<%=basePath%>resource/login/login.jsp";
                    }else if(data=='no'){
                        $("#msg").html("密码修改失败");
                    }else if(data=='errorcode'){
                        $("#msg").html("验证码错误");
                    }else{
                        $("#msg").html("用户不存在");
                    }

                }

            });
        }

    });






});

</script>

</body>


</html>
