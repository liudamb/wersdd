<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>统计数据</title>
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
  <style>
      #container,#container2{
          height: 300px;
          width: 500px;
          color:#F8F8FF;
          float: left;
      }

      #container2{
          margin-left: 230px;
      }




  </style>



</head>

<body class="layui-layout-body kit-theme-default">
<div id="container" ></div>
<div id="container2" ></div>

<script type="text/javascript">

    var data1=[];
    var data2=[];
    var data3=[];


    $(function(){
        $.ajax({
            url:"getTimesAndTime",
            type:"post",
            success:function (data) {

                for(var i=0;i<data.length;i++){
                    var json={};
                data1.push(data[i].visittime);
                data2.push(data[i].visittimes);
                    json.value=data[i].visittimes;
                    json.name=data[i].visittime;
                    data3.push(json);//把json放到data3数组中
            }



                var dom = document.getElementById("container");
                var myChart = echarts.init(dom);
                var app = {};
                option = null;



                option = {
                    title:{
                        text:"网站访问量",
                        subtext: '折线图',
                        textStyle: {
                            fontWeight: 'normal',              //标题颜色
                            color: "#fff"
                        },
                    },
                    xAxis: {
                        type: 'category',
                        boundaryGap: false,
                        data: data1,
                        axisLine: {
                            lineStyle: {
                                color: "#fff",
                            }
                        },
                        axisLabel:{
                            interval:0,
                            rotate:45,//倾斜度 -90 至 90 默认为0
                            margin:10,
                            textStyle:{
                                color:"#fff"
                            }
                        }


                    },
                    yAxis: {
                        type: 'value',
                        axisLine: {
                            lineStyle: {
                                color: "#fff",
                            }
                        }

                    },
                    series: [{
                        data: data2,
                        type: 'line',
                        areaStyle: {}
                    }]
                };

                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }






                var dom2 = document.getElementById("container2");
                var myChart2 = echarts.init(dom2);
                var app2 = {};
                option2 = null;
                option2 = {

                    title: {
                        text: '网站访问量',
                        subtext: '饼状图',

                        textStyle: {
                            color: '#fff'
                        }
                    },

                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },

                    visualMap: {
                        show: false,
                        min: 80,
                        max: 600,
                        inRange: {
                            colorLightness: [0, 1]
                        }
                    },
                    series : [
                        {
                            name:'访问来源',
                            type:'pie',
                            radius : '55%',
                            center: ['50%', '50%'],
                            data:data3.sort(function (a, b) { return a.value - b.value; }),
                            roseType: 'radius',
                            label: {
                                normal: {
                                    textStyle: {
                                        color: 'rgba(255, 255, 255, 0.3)'
                                    }
                                }
                            },
                            labelLine: {
                                normal: {
                                    lineStyle: {
                                        color: 'rgba(255, 255, 255, 0.3)'
                                    },
                                    smooth: 0.2,
                                    length: 10,
                                    length2: 20
                                }
                            },
                            itemStyle: {
                                normal: {
                                    color: '#c23531',
                                    shadowBlur: 200,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            },

                            animationType: 'scale',
                            animationEasing: 'elasticOut',
                            animationDelay: function (idx) {
                                return Math.random() * 200;
                            }
                        }
                    ]
                };;
                if (option2 && typeof option2 === "object") {
                    myChart2.setOption(option2, true);
                }








            }


        });
    })

</script>
</body>


</html>
