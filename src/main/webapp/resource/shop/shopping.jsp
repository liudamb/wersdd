<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page  isELIgnored="false"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%--商品首页--%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>商城</title>
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="<%=basePath%>resource/js/zturn.js"></script>
    <link rel="stylesheet" href="<%=basePath%>resource/css/shop1.css" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>resource/css/shop2.css" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>resource/css/reset.min.css">
    <link rel="stylesheet" href="<%=basePath%>resource/css/reset.css">
    <style>

        body{
            width: 100%;
            height:2800px;
            overflow:visible;
        }

        .lb_gl{
            height:610px;
        }

        .hList li:hover{
            background-color: rgb(211,211,211);
        }


        #myframe{
            width: 100%;
            height: 1300px;
            border:0;
            scrolling: no;
            margin-top: 50px;
        }

        #myimg{
            width:40px;
            height:40px;
            position: fixed;
            right:0;
            bottom:150px;
        }


    </style>
</head>
<body>
<!--轮播-->
<div class="lb_gl">
    <div class="container">
        <h1 class="turn_3d">听听这些老前辈的分享，你会获得信心</h1>
        <div class="pictureSlider poster-main">
            <div class="poster-btn poster-prev-btn"></div>
            <ul id="zturn" class="poster-list">
                <li class="poster-item  zturn-item" >
                    <p class="xxgy">学员感言1</p>
                    <p class="say">明月几时有</p>
                    <div class="for_btn">
                        <img src="resource/images/a1.png" width="100%">
                        <a href="#" class="in_page"><img src="resource/images/iconin.png" /></a>
                    </div>

                    <div class="students_star">
                        <p class="cell_list"><span class="lf">姓名：<span class="darks">小明</span></span> <span class="rt">薪资 ：<span class="darks">15k</span></span>
                        </p>
                        <p class="cell_list"><span>入职：<span class="darks">把酒问青天</span></span>
                        </p>
                        <div class="zwjs">
                            自我介绍是向别人展示你自我介绍好不好,甚至直接关系到你给别人的第一印象的好坏及以后自我介绍是向别人展示你自我介绍好不好
                        </div>
                    </div>
                </li>

                <li class="poster-item zturn-item">
                    <p class="xxgy">学员感言2</p>
                    <p class="say">明月几时有</p>
                    <div class="for_btn">
                        <img src="resource/images/a2.png" width="100%">
                        <a href="#" class="in_page"><img src="resource/images/iconin.png" /></a>
                    </div>
                    <div class="students_star">
                        <p class="cell_list"><span class="lf">姓名：<span class="darks">小明</span></span> <span class="rt">薪资 ：<span class="darks">15k</span></span>
                        </p>
                        <p class="cell_list"><span>入职：<span class="darks">把酒问青天</span></span>
                        </p>
                        <div class="zwjs">
                            自我介绍是向别人展示你自我介绍好不好,甚至直接关系到你给别人的第一印象的好坏及以后自我介绍是向别人展示你自我介绍好不好
                        </div>
                    </div>
                </li>

                <li class="poster-item zturn-item">
                    <p class="xxgy">学员感言3</p>
                    <p class="say">明月几时有</p>
                    <div class="for_btn">
                        <img src="resource/images/a3.png" width="100%">
                        <a href="#" class="in_page"><img src="resource/images/iconin.png" /></a>
                    </div>
                    <div class="students_star">
                        <p class="cell_list"><span class="lf">姓名：<span class="darks">小明</span></span> <span class="rt">薪资 ：<span class="darks">15k</span></span>
                        </p>
                        <p class="cell_list"><span>入职：<span class="darks">把酒问青天</span></span>
                        </p>
                        <div class="zwjs">
                            自我介绍是向别人展示你自我介绍好不好,甚至直接关系到你给别人的第一印象的好坏及以后自我介绍是向别人展示你自我介绍好不好
                        </div>
                    </div>
                </li>

                <li class="poster-item zturn-item" >
                    <p class="xxgy">学员感言4</p>
                    <p class="say">明月几时有</p>
                    <div class="for_btn">
                        <img src="resource/images/a4.png" width="100%">
                        <a href="#" class="in_page"><img src="resource/images/iconin.png" /></a>
                    </div>
                    <div class="students_star">
                        <p class="cell_list"><span class="lf">姓名：<span class="darks">小明</span></span> <span class="rt">薪资 ：<span class="darks">15k</span></span>
                        </p>
                        <p class="cell_list"><span>入职：<span class="darks">把酒问青天</span></span>
                        </p>
                        <div class="zwjs">
                            自我介绍是向别人展示你自我介绍好不好,甚至直接关系到你给别人的第一印象的好坏及以后自我介绍是向别人展示你自我介绍好不好
                        </div>
                    </div>
                </li>

                <li class="poster-item zturn-item">
                    <p class="xxgy">学员感言</p>
                    <p class="say">明月几时有</p>
                    <div class="for_btn">
                        <img src="resource/images/a5.png" width="100%">
                        <a href="#" class="in_page"><img src="resource/images/iconin.png" /></a>
                    </div>
                    <div class="students_star">
                        <p class="cell_list"><span class="lf">姓名：<span class="darks">小明</span></span> <span class="rt">薪资 ：<span class="darks">15k</span></span>
                        </p>
                        <p class="cell_list"><span>入职：<span class="darks">把酒问青天</span></span>
                        </p>
                        <div class="zwjs">
                            自我介绍是向别人展示你自我介绍好不好,甚至直接关系到你给别人的第一印象的好坏及以后自我介绍是向别人展示你自我介绍好不好
                        </div>
                    </div>
                </li>
                <li class="poster-item  zturn-item">
                    <p class="xxgy">学员感言</p>
                    <p class="say">明月几时有</p>
                    <div class="for_btn">
                        <img src="resource/images/a1.png" width="100%">
                        <a href="#" class="in_page"><img src="resource/images/iconin.png" /></a>
                    </div>
                    <div class="students_star">
                        <p class="cell_list"><span class="lf">姓名：<span class="darks">小明</span></span> <span class="rt">薪资 ：<span class="darks">15k</span></span>
                        </p>
                        <p class="cell_list"><span>入职：<span class="darks">把酒问青天</span></span>
                        </p>
                        <div class="zwjs">
                            自我介绍是向别人展示你自我介绍好不好,甚至直接关系到你给别人的第一印象的好坏及以后自我介绍是向别人展示你自我介绍好不好
                        </div>
                    </div>
                </li>

                <li class="poster-item zturn-item">
                    <p class="xxgy">学员感言</p>
                    <p class="say">明月几时有</p>
                    <div class="for_btn">
                        <img src="resource/images/a2.png" width="100%">
                        <a href="#" class="in_page"><img src="resource/images/iconin.png" /></a>
                    </div>
                    <div class="students_star">
                        <p class="cell_list"><span class="lf">姓名：<span class="darks">小明</span></span> <span class="rt">薪资 ：<span class="darks">15k</span></span>
                        </p>
                        <p class="cell_list"><span>入职：<span class="darks">把酒问青天</span></span>
                        </p>
                        <div class="zwjs">
                            自我介绍是向别人展示你自我介绍好不好,甚至直接关系到你给别人的第一印象的好坏及以后自我介绍是向别人展示你自我介绍好不好
                        </div>
                    </div>
                </li>

                <li class="poster-item zturn-item">
                    <p class="xxgy">学员感言</p>
                    <p class="say">明月几时有</p>
                    <div class="for_btn">
                        <img src="resource/images/a3.png" width="100%">
                        <a href="#" class="in_page"><img src="resource/images/iconin.png" /></a>
                    </div>
                    <div class="students_star">
                        <p class="cell_list"><span class="lf">姓名：<span class="darks">小明</span></span> <span class="rt">薪资 ：<span class="darks">15k</span></span>
                        </p>
                        <p class="cell_list"><span>入职：<span class="darks">把酒问青天</span></span>
                        </p>
                        <div class="zwjs">
                            自我介绍是向别人展示你自我介绍好不好,甚至直接关系到你给别人的第一印象的好坏及以后自我介绍是向别人展示你自我介绍好不好
                        </div>
                    </div>
                </li>

                <li class="poster-item zturn-item">
                    <p class="xxgy">学员感言</p>
                    <p class="say">明月几时有</p>
                    <div class="for_btn">
                        <img src="resource/images/a4.png" width="100%">
                        <a href="#" class="in_page"><img src="resource/images/iconin.png" /></a>
                    </div>
                    <div class="students_star">
                        <p class="cell_list"><span class="lf">姓名：<span class="darks">小明</span></span> <span class="rt">薪资 ：<span class="darks">15k</span></span>
                        </p>
                        <p class="cell_list"><span>入职：<span class="darks">把酒问青天</span></span>
                        </p>
                        <div class="zwjs">
                            自我介绍是向别人展示你自我介绍好不好,甚至直接关系到你给别人的第一印象的好坏及以后自我介绍是向别人展示你自我介绍好不好
                        </div>
                    </div>
                </li>

                <li class="poster-item zturn-item">
                    <p class="xxgy">学员感言</p>
                    <p class="say">明月几时有</p>
                    <div class="for_btn">
                        <img src="resource/images/xueyuan.png" width="100%">
                        <a href="#" class="in_page"><img src="resource/images/iconin.png" /></a>
                    </div>
                    <div class="students_star">
                        <p class="cell_list"><span class="lf">姓名：<span class="darks">小明</span></span> <span class="rt">薪资 ：<span class="darks">15k</span></span>
                        </p>
                        <p class="cell_list"><span>入职：<span class="darks">把酒问青天</span></span>
                        </p>
                        <div class="zwjs">
                            自我介绍是向别人展示你自我介绍好不好,甚至直接关系到你给别人的第一印象的好坏及以后自我介绍是向别人展示你自我介绍好不好
                        </div>
                    </div>
                </li>

                <li class="poster-item zturn-item">
                    <p class="xxgy">学员感言</p>
                    <p class="say">明月几时有</p>
                    <div class="for_btn">
                        <img src="resource/images/a5.png" width="100%">
                        <a href="#" class="in_page"><img src="resource/images/iconin.png" /></a>
                    </div>
                    <div class="students_star">
                        <p class="cell_list"><span class="lf">姓名：<span class="darks">小明</span></span> <span class="rt">薪资 ：<span class="darks">15k</span></span>
                        </p>
                        <p class="cell_list"><span>入职：<span class="darks">把酒问青天</span></span>
                        </p>
                        <div class="zwjs">
                            自我介绍是向别人展示你自我介绍好不好,甚至直接关系到你给别人的第一印象的好坏及以后自我介绍是向别人展示你自我介绍好不好
                        </div>
                    </div>
                </li>

            </ul>

        </div>
    </div>


</div>

<div id="items">
    <ul class="hList">


    </ul>

</div>

<img id="myimg" src="<%=basePath%>resource/images/car.png">
<iframe src="<%=basePath%>resource/shop/showproducts.jsp" id="myframe" scrolling="no"></iframe>


<script type="text/javascript">
    var aa=new zturn({
        id:"zturn",
        opacity:0.9,
        width:382,
        Awidth:1024,
        scale:0.9,
        auto:true,//是否轮播 默认5000
        turning:1000//轮播时长
    })

    var ab=new zturn({
        id:"zturn2",
        opacity:0.8,
        width:382,
        Awidth:1024,
        scale:0.6,
        auto:true
    })

    var index;
    $(function(){

        $.ajax({
           url:"getp_type",
           type:"post",
            async:false,
            success:function(data){

            for(var i=0;i<data.length;i++){
                index=i;
                var tr = " <li>" +
                    "      <a  class='menu'>" +
                    "      <h2 class='menu-title'>"+data[i].pType+"</h2>" +
                    "      <ul class='menu-dropdown'>" +
                    "      </ul>" +
                    "      </a>" +
                    "      </li>";

                   $(".hList").append(tr);

                $.ajax({
                   url:"getBrand",
                    type:"post",
                    async:false,//同步
                    data:{
                       "ptype":data[i].pType
                    },
                    success:function(data){

                     for(var j=0;j<data.length;j++){
                         $(".menu-dropdown").eq(index).append("<li>"+data[j].brand+"</li>");
                     }

                    }

                });


            }
 

            }

        });



        $(".hList").on("click",".menu-dropdown li",function(){

            $("#myframe").attr("src","<%=basePath%>resource/shop/clickProducts.jsp?pType="+$(this).parent().prev().text()+"&pBrand="+$(this).text());

        });


        $("#myimg").click(function(){
            checkLogin();
            window.open("<%=basePath%>resource/shopcar/caritems.jsp");
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
