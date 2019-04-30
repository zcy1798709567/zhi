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
  <title>质检院首页</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="/resources/layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="/resources/layuiadmin/style/admin.css" media="all">
  <link rel="stylesheet" href="/resources/home/css/font/iconfont.css" media="all">
  <link rel="stylesheet" href="/resources/home/css/home.css" media="all">
  <script src="/resources/js/jquery/jquery-3.3.1.min.js"></script>
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
              <li class="nav-li on"><a href="/djhome.do" class="nav-a">党务资讯</a></li>
              <li class="nav-li"><a href="/detail.do" class="nav-a">精神文明建设</a></li>
              <li class="nav-li"><a href="/detail.do" class="nav-a">道德讲堂</a></li>
              <li class="nav-li"><a href="/detail.do" class="nav-a">职工之家</a></li>
            </ul>
          </div>
          <!--轮播-->
          <div class="layui-col-md12">
            <div class="layui-card">
              <div class="layui-carousel" id="test-carousel-normal-2">
                <div carousel-item="">
                  <div class="slide-wrap">
                    <div class="slide-imgbox"><img src="/resources/home/images/pic3.png"></div>
                  </div>
                  <div class="slide-wrap">
                    <div class="slide-imgbox"><img src="/resources/home/images/pic3.png"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!--菜单left-->
          <div class="layui-col-md6">
            <div class="layui-row layui-col-space15">
              <div class="layui-col-md3">
                <div class="layui-card out-col8">
                  <a class="col8-span spa1" href="/detail.do">三会一课</a>
                </div>
              </div>
              <div class="layui-col-md3">
                <div class="layui-card out-col8">
                  <a class="col8-span spa2" href="/detail.do">两学一做</a>
                </div>
              </div>
              <div class="layui-col-md3">
                <div class="layui-card out-col8">
                  <a class="col8-span spa3" href="/detail.do">学习园地</a>
                </div>
              </div>
              <div class="layui-col-md3">
                <div class="layui-card out-col8">
                  <a class="col8-span spa4" href="/detail.do">知识交流</a>
                </div>
              </div>
            </div>
          </div>
          <!--菜单right-->
          <div class="layui-col-md6">
            <div class="layui-row layui-col-space15">
              <div class="layui-col-md3">
                <div class="layui-card out-col8">
                  <a class="col8-span spa5" href="javascript:;">党员管理</a>
                </div>
              </div>
              <div class="layui-col-md3">
                <div class="layui-card out-col8">
                  <a class="col8-span spa6" href="javascript:;">主题活动日</a>
                </div>
              </div>
              <div class="layui-col-md3">
                <div class="layui-card out-col8">
                  <a class="col8-span spa7" href="javascript:;">党建心得</a>
                </div>
              </div>
              <div class="layui-col-md3">
                <div class="layui-card out-col8">
                  <a class="col8-span spa8" href="javascript:;">十九大会议</a>
                </div>
              </div>
            </div>
          </div>
          <!--三会一课-->
          <div class="layui-col-md6">
            <div class="layui-card">
              <div class="layui-card-header hd-header orenge">三会一课<a class="layui-icon index-more">更多</a></div>
              <div class="layui-card-body">
                <ul>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">办公厅关于印发河北省政务服务大厅建设</div>
                      <div class="cell">2019-04-09</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">印发《关于推进工程建设项目审批...</div>
                      <div class="cell">2019-04-08</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">公厅关于加强城市生活垃圾分类工作的...</div>
                      <div class="cell">2019-04-07</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">政府办公厅关于印发河北省用煤投资项目煤炭...</div>
                      <div class="cell">2019-04-06</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">人民政府关于改革国有企业工资决定机制的实施意...</div>
                      <div class="cell">2019-04-05</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">关于印发《河北省国有资本投资、运营公...</div>
                      <div class="cell">2019-04-05</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">府办公厅关于进一步压缩不动产登记办理时...</div>
                      <div class="cell">2019-04-05</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">人民政府办公厅关于衔接落实国务院取消和下放一...</div>
                      <div class="cell">2019-04-05</div>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <!--两学一做-->
          <div class="layui-col-md6">
            <div class="layui-card">
              <div class="layui-card-header hd-header">两学一做<a class="layui-icon index-more">更多</a></div>
              <div class="layui-card-body">
                <ul>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">办公厅关于印发河北省政务服务大厅建设</div>
                      <div class="cell">2019-04-09</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">印发《关于推进工程建设项目审批...</div>
                      <div class="cell">2019-04-08</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">公厅关于加强城市生活垃圾分类工作的...</div>
                      <div class="cell">2019-04-07</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">政府办公厅关于印发河北省用煤投资项目煤炭...</div>
                      <div class="cell">2019-04-06</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">人民政府关于改革国有企业工资决定机制的实施意...</div>
                      <div class="cell">2019-04-05</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">关于印发《河北省国有资本投资、运营公...</div>
                      <div class="cell">2019-04-05</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">府办公厅关于进一步压缩不动产登记办理时...</div>
                      <div class="cell">2019-04-05</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">人民政府办公厅关于衔接落实国务院取消和下放一...</div>
                      <div class="cell">2019-04-05</div>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <!--学习园地-->
          <div class="layui-col-md6">
            <div class="layui-card">
              <div class="layui-card-header hd-header">学习园地<a class="layui-icon index-more">更多</a></div>
              <div class="layui-card-body">
                <a class="tu-wen-panel" href="javascript:;">
                  <div class="tu-imgbox"><img src="/resources/home/images/pic4.png"></div>
                  <div class="wen-panel">
                    <h3 class="wen-panel-hd">国务院办公厅关于调整中国人民银行币政策委员会组成人员的通知</h3>
                    <div class="wen-panel-bd">你行《关于任免货币政策委员会委员的请示》（银发〔2019〕77号）收悉经国务院同意，现就调整货币政策委员会组成人员通知如下：</div>
                  </div>
                </a>
                <ul>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">政府办公厅关于印发河北省用煤投资项目煤炭</div>
                      <div class="cell">2019-04-09</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">人民政府关于改革国有企业工资决定机制的实施意</div>
                      <div class="cell">2019-04-08</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">关于印发《河北省国有资本投资、运营公</div>
                      <div class="cell">2019-04-07</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">府办公厅关于进一步压缩不动产登记办理时...</div>
                      <div class="cell">2019-04-07</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">人民政府办公厅关于衔接落实国务院取消和下放一...</div>
                      <div class="cell">2019-04-07</div>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <!--知识交流-->
          <div class="layui-col-md6">
            <div class="layui-card">
              <div class="layui-card-header hd-header orenge">知识交流<a class="layui-icon index-more">更多</a></div>
              <div class="layui-card-body">
                <a class="tu-wen-panel" href="javascript:;">
                  <div class="tu-imgbox"><img src="/resources/home/images/pic5.png"></div>
                  <div class="wen-panel">
                    <h3 class="wen-panel-hd">国务院办公厅关于调整中国人民银行币政策委员会组成人员的通知</h3>
                    <div class="wen-panel-bd">你行《关于任免货币政策委员会委员的请示》（银发〔2019〕77号）收悉经国务院同意，现就调整货币政策委员会组成人员通知如下：</div>
                  </div>
                </a>
                <ul>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">政府办公厅关于印发河北省用煤投资项目煤炭</div>
                      <div class="cell">2019-04-09</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">人民政府关于改革国有企业工资决定机制的实施意</div>
                      <div class="cell">2019-04-08</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">关于印发《河北省国有资本投资、运营公</div>
                      <div class="cell">2019-04-07</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">府办公厅关于进一步压缩不动产登记办理时</div>
                      <div class="cell">2019-04-08</div>
                    </a>
                  </li>
                  <li class="">
                    <a href="javasrcipt:;" class="list-bar box-bar">
                      <div class="box-bar-list">人民政府办公厅关于衔接落实国务院取消和下放一</div>
                      <div class="cell">2019-04-07</div>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      
    </div>
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
  }).use(['index', 'carousel', 'form'], function() {
      var carousel = layui.carousel
          , form = layui.form;
      //改变下时间间隔、动画类型、高度
      carousel.render({
          elem: '#test-carousel-normal-2'
          , interval: 1800
          , anim: 'fade'
          , height: '402px'
          ,width:'100%'
      });
  });
  </script>
<script type="text/javascript">
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

