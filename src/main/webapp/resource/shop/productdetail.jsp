<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%--商品详情--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>商品详情</title>
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script   src="resource/js/modernizr-custom-v2.7.1.min.js"></script>
    <link rel="stylesheet" href="resource/css/shouye.css"/>

<style>
    body{
        font-family: 微软雅黑;
        font-size: 12px;
    }
    #productImg{
        width:350px;
        height:350px;
    }

    #numDiv{
        font-family: 微软雅黑;
        font-size: 12px;
        margin-top: 30px;
        width: 100px;
        height:30px;
    }
</style>

</head>

<body>
<div class="Xcontent">
    <ul class="Xcontent01">

        <div class="Xcontent06"><img id="productImg"></div>


        <ol class="Xcontent13">
            <div class="Xcontent14"><a href="#"><p id="productName"></p></a></div>
            <div class="Xcontent15"><img src="resource/images/shangpinxiangqing/X11.png"></div>
            <div class="Xcontent16"><p id="productIntro"></p></div>
            <div class="Xcontent17">
                <p class="Xcontent18">售价</p>
                <p class="Xcontent19">￥<span id="price"></span>&emsp;<span id="saleprice"></span></p>
                <div class="Xcontent20">
                    <p class="Xcontent21">促销</p>
                    <img src="resource/images/shangpinxiangqing/X12.png">
                    <p class="Xcontent22">领610元新年礼券，满再赠好礼</p>
                </div>
                <div class="Xcontent23">
                    <p class="Xcontent24">服务</p>
                    <p class="Xcontent25">30天无忧退货&nbsp;&nbsp;&nbsp;&nbsp;       48小时快速退款 &nbsp;&nbsp;&nbsp;&nbsp;        满88元免邮</p>
                </div>

            </div>

            <div class="Xcontent30">
                <div id="numDiv"><p>库存&emsp;<span id="num"></span></p>
                </div>

                <p class="Xcontent31">数量</p>
                <div class="Xcontent32"><img src="resource/images/shangpinxiangqing/X15.png"></div>
                <form>
                    <input class="input" value="1"></form>
                <div class="Xcontent33"><img src="resource/images/shangpinxiangqing/16.png"></div>

            </div>
            <div class="Xcontent34"><a href="#"><img src="resource/images/shangpinxiangqing/X17.png"></a></div>
            <div class="Xcontent35"><a href="#"><img src="resource/images/shangpinxiangqing/X18.png"></a></div>


        </ol>



    </ul>

</div>

<input type="hidden" value="<%=basePath%>" id="hidd">


<script>
    $(document).ready(function(){
        var $miaobian=$('.Xcontent08>div');
        var $huantu=$('.Xcontent06>img');
        var $miaobian1=$('.Xcontent26>div');
        $miaobian.mousemove(function(){miaobian(this);});
        $miaobian1.click(function(){miaobian1(this);});
        function miaobian(thisMb){
            for(var i=0; i<$miaobian.length; i++){
                $miaobian[i].style.borderColor = '#dedede';
            }
            thisMb.style.borderColor = '#cd2426';

            $huantu[0].src = thisMb.children[0].src;
        }
        function miaobian1(thisMb1){
            for(var i=0; i<$miaobian1.length; i++){
                $miaobian1[i].style.borderColor = '#dedede';
            }
//		thisMb.style.borderColor = '#cd2426';
            $miaobian.css('border-color','#dedede');
            thisMb1.style.borderColor = '#cd2426';
            $huantu[0].src = thisMb1.children[0].src;
        }
        $(".Xcontent33").click(function(){
            var value=parseInt($('.input').val())+1;
            $('.input').val(value);
        })

        $(".Xcontent32").click(function(){
            var num = $(".input").val()
            if(num>0){
                $(".input").val(num-1);
            }

        })



        $.ajax({
           url:"getproductinfo",
            type:"post",
            data:{
             "pId":getQueryString("p_id")
            },
            success:function(data){
               var path=$("#hidd").val();
                $("#productName").html(data.pName);
                $("#productIntro").html(data.intro);
                $("#productImg").attr("src",path+data.pic);
                $("#price").html(data.price);
                $("#num").html(data.pNum);


                if(data.status==0||data.status==''||data.status==null){
                    $(".Xcontent20").hide();
                }else if(data.status==1){
                    $(".Xcontent20").show();
                    $("#price").css("text-decoration","line-through");
                    $("#saleprice").html(data.price*data.sale);

                }


            }
        });


    });


    function getQueryString(name){
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)
            return  unescape(r[2]);
        return null;
    }


</script>


</body>
</html>
