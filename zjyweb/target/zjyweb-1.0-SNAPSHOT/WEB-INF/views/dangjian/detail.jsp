<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.springframework.util.Base64Utils" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.oa.com/core" prefix="s" %>
<jsp:include page="/common/var.jsp"></jsp:include>
<%
  String decodeUrl = request.getParameter("url");
  if (decodeUrl != null) {
    String url = new String(Base64Utils.decode(decodeUrl.getBytes()));
    request.setAttribute("url", url);
  }
%>
<html>
<head>
  <meta charset="utf-8">
  <title>质检院详情</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="/resources/layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="/resources/layuiadmin/style/admin.css" media="all">
  <link rel="stylesheet" href="/resources/home/css/font/iconfont.css" media="all">
  <link rel="stylesheet" href="/resources/home/css/home.css" media="all">
  <script src="/resources/home/js/jquery.min.js"></script>
</head>
<body>
<div class="out-main-fluid">
  <div class="main-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-row layui-col-space15">
          <!--logo-->
          <div class="layui-col-md12">
            <img class="img-logo" src="/resources/home/images/logo1.png">
          </div>
          <!--导航-->
          <div class="layui-col-md12">
            <ul class="nav-bar">
              <li class="nav-li on"><a href="javascript:;" class="nav-a">党务资讯</a></li>
              <li class="nav-li"><a href="javascript:;" class="nav-a">精神文明建设</a></li>
              <li class="nav-li"><a href="javascript:;" class="nav-a">道德讲堂</a></li>
              <li class="nav-li"><a href="javascript:;" class="nav-a">职工之家</a></li>
            </ul>
          </div>
        </div>
      </div>
      
    </div>
    <!--主體內容begin-->
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card list-wrap">
          <!--面包屑-->
          <div class="layui-card-body">
            <div class="layui-col-md12 crumbs-bar">
              <span>当前位置 : </span><a href="javascript:;" class="">党务资讯</a><span> > </span><a href="javascript:;" class="">三会一课</a>
            </div>
          </div>
          <!--左右两部分内容-->
          <div class="layui-card-body main-view-container">
            <!--左侧-->
            <div class="left-part-wrap">
              <h3 class="left-part-hd">党务资讯</h3>
              <ul class="left-part-bd">
                <li class="left-part-li on"><a href="javascript:;" class="">三会一课</a></li>
                <li class="left-part-li"><a href="javascript:;" class="">两学一做</a></li>
                <li class="left-part-li"><a href="javascript:;" class="">学习园地</a></li>
                <li class="left-part-li"><a href="javascript:;" class="">知识交流</a></li>
                
              </ul>
            </div>
            <!--右侧-->
            <div class="right-part-wrap">
               <div class="detail-wrap">
                  <div class="detail-hd">
                    <div class="detail-title">关于印发《河北省国有资本投资、运营公司改革试点实施方案》的通知</div>
                    <div class="detail-data">2019-04-11</div>
                  </div>
                  <div class="detail-bd">
                    <p>
                      <br />
                    </p>
                    <p class="Custom_UnionStyle" align="justify" style="color:#444444;font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;">
                      <span style="font-size:14px;color:#666666;">【学习进行时】仲春三月，习近平总书记格外忙碌：出席全国两会，访问欧洲三国，主持中央深改委会议、中央政治局会议，同思政课教师座谈……新华社《学习进行时》原创品牌栏目“讲习所”今天推出文章，为您梳理回顾习近平总书记三月份的活动。</span>
                    </p>
                    <p class="Custom_UnionStyle" align="justify" style="color:#444444;font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;">
                      <span style="font-size:14px;color:#666666;">&emsp;&emsp;俗话说：“一年之计在于春。”一年能有多少收获，开始打下什么基础至关重要。国家亦然。</span>
                    </p>
                    <p class="Custom_UnionStyle" align="justify" style="color:#444444;font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;">
                      <span style="font-size:14px;color:#666666;">&emsp;&emsp;2019年是新中国成立70周年，是决胜全面建成小康社会关键之年。仲春时节，习近平总书记格外忙碌。</span>
                    </p>
                    <p class="Custom_UnionStyle" align="justify" style="color:#444444;font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;">
                      <span style="font-size:14px;color:#666666;">&emsp;&emsp;这个月，习近平出席全国两会，访问欧洲三国，主持中央深改委会议、中央政治局会议，同思政课教师座谈……从内政到外交，方方面面工作扎实推进。</span>
                    </p>
                    <p class="Custom_UnionStyle" align="justify" style="color:#444444;font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;">
                      <span style="font-size:14px;color:#666666;">&nbsp;</span>
                    </p>
                    <p class="Custom_UnionStyle" align="justify" style="color:#444444;font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;">
                      <span style="font-size:14px;color:#666666;">&emsp;&emsp;</span><strong><span style="font-size:14px;color:#666666;">两会6到团组，统筹推进各方面工作</span></strong>
                    </p>
                    <p class="Custom_UnionStyle" align="justify" style="color:#444444;font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;">
                      <span style="font-size:14px;color:#666666;">&emsp;&emsp;出席全国两会是习近平3月份工作安排的重头。13天会期内，除了一场场开幕会、闭幕会、全体会，习近平还6次深入人大政协团组。</span>
                    </p>
                    <p class="Custom_UnionStyle" align="justify" style="color:#444444;font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;">
                      <span style="font-size:14px;color:#666666;">&emsp;&emsp;3月4日，习近平看望文化艺术界、社会科学界委员，并参加联组会；5日，参加他所在的内蒙古代表团审议；7日、8日、10日，分别在甘肃、河南、福建3个代表团参加审议；12日，出席解放军和武警部队代表团全体会议。</span>
                    </p>
                    <p class="Custom_UnionStyle" align="justify" style="color:#444444;font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;">
                      <span style="font-size:14px;color:#666666;">&emsp;&emsp;两会之于党和国家工作全局，意义不言而喻。</span>
                    </p>
                    <p class="Custom_UnionStyle" align="justify" style="color:#444444;font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;">
                      <span style="font-size:14px;color:#666666;">&emsp;&emsp;今年是新中国成立70周年，保持经济持续健康发展和社会大局稳定的任务十分繁重。到团组时，习近平多次提到一个重要要求——坚持稳中求进工作总基调，统筹推进稳增长、促改革、调结构、惠民生、防风险、保稳定各项工作。</span>
                    </p>
                    <p class="Custom_UnionStyle" align="justify" style="color:#444444;font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;">
                      <span style="font-size:14px;color:#666666;">&emsp;&emsp;针对重点任务、关键环节、突出短板，习近平一一作出部署。</span>
                    </p>
                    <p class="Custom_UnionStyle" align="justify" style="color:#444444;font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;">
                      <span style="font-size:14px;color:#666666;">&emsp;&emsp;在内蒙古代表团突出强调生态文明建设，在甘肃代表团对脱贫攻坚“响鼓重锤”，在河南代表团为乡村振兴解题支招，在福建代表团部署推进创新创业创造、两岸融合发展、革命老区和中央苏区奔小康……</span>
                    </p>
                    <span style="font-size:14px;color:#666666;"></span>
                    <p>
                      <br />
                    </p>
                  </div>
               </div>
               <div class="first-last-page">
                 <div class="layui-col-md6"><a href="javascript:;" class="first-last-a">上一篇：石家庄海关建冰雪货物“绿色通道”服务冬奥</a></div>
                 <div class="layui-col-md6"><a href="javascript:;" class="first-last-a">下一篇：  我省民营经济今年将新增50万家以上</a></div>
               </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--主體內容結束-->
    <!--友情链接-->
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card friend-link-wrap">
          <div class="friend-link-title">友情</br>链接</div>
          <div class="friend-link-view">

              <div class="apply_nav">
                <div class="apply_w">
                  <a class="apply_array" href="javascript:;"><img src="/resources/home/images/link1.png"></a>
                  <a class="apply_array" href="javascript:;"><img src="/resources/home/images/link1.png"></a>
                  <a class="apply_array" href="javascript:;"><img src="/resources/home/images/link1.png"></a>
                  <a class="apply_array" href="javascript:;"><img src="/resources/home/images/link1.png"></a>
                  <a class="apply_array" href="javascript:;"><img src="/resources/home/images/link1.png"></a>
                </div>
              </div>

          </div>
          <div class="friend-link-jt">
            <div class="img_l"><img src="/resources/home/images/left.png" /></div>
            <div class="img_r"><img src="/resources/home/images/right.png" /></div>
          </div>
        </div>
      </div>
    </div>
    <!--底部信息-->
    <div class="layui-row layui-col-space15" style="height: 70px;">
      <div class="layui-col-md12 foot-bar">
        <p class="">主办：河北省产品和质量监督检验院主办    版权所有 冀ICP备字0000000-1号   冀公网安备 13010200000000000号   网站标识码：0000000000</p>
        <div class="footer-imgbox">
          <img src="/resources/home/images/f1.png">
          <img src="/resources/home/images/f2.png">
        </div>
      </div>
    </div>
  </div>
</div>
<script src="/resources/layuiadmin/layui/layui.js?t=1"></script>
  <script>
      layui.config({
          base: '/resources/layuiadmin/' //静态资源所在路径
      }).extend({
          index: 'lib/index' //主入口模块
      }).use(['index', 'laypage'], function() {
          var laypage = layui.laypage;

          //完整功能
          laypage.render({
              elem: 'test-laypage-demo7'
              , count: 100
              , layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']
              , jump: function (obj) {
                  console.log(obj)
              }
          });
      });
      // 友情鏈接
      $(function(){

          $li1 = $(".apply_array");
          $window1 = $(".apply_w");
          $left1 = $(".img_l");
          $right1 = $(".img_r");

          $window1.css("width", $li1.length*206);

          var lc1 = 0;
          var rc1 = $li1.length-4;

          $left1.click(function(){
              if (lc1 < 1) {
                  alert("已经是第一张图片");
                  return;
              }
              lc1--;
              rc1++;
              $window1.animate({left:'+=206px'}, 1000);
          });

          $right1.click(function(){
              if (rc1 < 1){
                  alert("已经是最后一张图片");
                  return;
              }
              lc1++;
              rc1--;
              $window1.animate({left:'-=206px'}, 1000);
          });

      })
  </script>
</body>
</html>

