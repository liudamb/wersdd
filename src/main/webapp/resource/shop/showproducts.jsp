<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>My JSP 'shopping.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>


    <style>
        body {
            font-size:62.5%;
            /*10 ÷ 16 × 100% = 62.5%*/
            font-weight:lighter;
        }
        h1 {
            font-size:2.4rem;
            /*2.4em × 10 = 24px */
        }
        p {
            font-size:0.88rem;
            /*1.4em × 10 = 14px */
        }
        li {
            font-size:0.88rem;
            /*1.4 × ? = 14px ? */
        }
        .proRow {
            display:flex;
            flex-wrap:wrap;
        }
        .proBig{
            float:left;
            margin-left: 75px;
            margin-top: 30px;
        }

        .pro {
            border:1px solid #ccc;
            height:380px;
        }

        .proImg img {
            width:310px;
            height:302px;
            text-align:center;
            border: 1px;

        }
        .proText {
            margin:10px 10px;
            height:120px;
        }
        h5 {
            font-size:1rem;
            margin:0 auto;
            font-weight:initial;
        }
        .proSize {
            font-size:0.6rem;
            color:#95989A;
            margin:3px auto;
        }
        .proPrice span {
            font-size:1.2rem;
            font-weight:initial;
            font-style:italic;
        }
        .proFrom {
            text-align:right;
            margin-right:10px;
        }
        .proBtn {
            width:235px;
            height:362px;
            background-color:#fff;
            background-color:rgba(255,255,255,0.5);
            position:absolute;
            box-sizing:border-box;
            padding-top:80px;
            margin-top:-362px;
            margin-left: 50px;
            display:none;
        }
        .proBig:hover .proBtn {
            display:block;
        }
        .btn {
            width:167px;
            height:50px;
            margin:10px auto;
            background-color:#FCDD00;
            display:flex;
            justify-content:center;
            align-items:center;
            box-sizing:border-box;
        }
        .btn:hover {
            border:1px solid #66503B;
        }


    </style>
</head>

<body>

<div class="content">
    <div class="proRow">



    </div>
</div>


</body>
<script type="text/javascript">
    $(function () {

        $.ajax({
            url:"getFirstShow",
            type:"post",
            success:function(data){
                for(var i=0;i<data.length;i++){
                    var pid=data[i].pId;
                    var proBig = '<div class="proBig">' +
                        '            <div class="pro">' +
                        "                <div class='proImg'><img src='<%=basePath%>"+data[i].pic+"'/></div>" +
                        '                <div class="proText">' +
                        "                    <h5>"+data[i].pName+"</h5>" +
                        '                   <p class="proSize"></p>' +
                        '                    <p class="proPrice">RMB<span>'+data[i].price+'</span></p>' +
                        "                </div>" +
                        "            </div>" +
                        '                <div class="proBtn">' +
                        "               <a href='resource/shop/productdetail.jsp?p_id=" +pid+"'target='_blank'>"+
                        '                   <div class="btn">' +
                        "                        <p>查看详情</p>" +
                        "                    </div>" +
                        "               </a>"+
                        '                   <div class="btn">' +
                        "                        <p>立即购买</p>" +
                        "                    </div>" +
                        '                    <div class="btn car" pid="'+data[i].pId+'">' +
                        "                        <p>加入购物车</p>" +
                        "                    </div>" +
                        "                </div>" +

                        "        </div>"
                    $(".proRow").append(proBig);
                }


            }
        })

//点击加入购物车事件
   $(".proRow").on("click",".car p",function(){

       checkLogin();
       alert("已加入购物车");
       $.ajax({
          url:"addCar",
          type:"post",
          data:{
              "pid":$(this).parent().attr("pid"),
              "pNum":"1"
          }

       });

   });





    });





    function checkLogin(){
        var loginStatus="${sessionScope.user}";

        if(loginStatus==''||loginStatus==null){
            window.open("<%=basePath%>resource/login/login.jsp");
            return;
        }

    }

</script>
</body>
</html>
