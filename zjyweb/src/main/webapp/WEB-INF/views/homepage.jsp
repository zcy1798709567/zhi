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
    <title>会议管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/resources/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/resources/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="/resources/home/css/font/iconfont.css" media="all">
    <link rel="stylesheet" href="/resources/home/css/meet.css" media="all">
</head>
<body>
<div class="layui-fluid" style="padding: 0px 10px;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8">
            <div class="layui-row layui-col-space15">
                <!--广告-->
                <div class="layui-col-md12">
                    <div class="layui-card pic-banner" style="width: 100%;" >
                        <img src="/resources/home/images/pic1.png">
                    </div>
                </div>
                <!--轮播-->
                <div class="layui-col-md6">
                    <div class="layui-card">
                        <div class="layui-carousel" id="test-carousel-normal-2">
                            <div carousel-item="">
                                <c:if test="${!empty xinwen}">
                                    <c:forEach items="${xinwen}" var="xw" varStatus="status" begin="0" end="4">
                                        <div class="slide-wrap">
                                            <div class="slide-imgbox"><img src="/resources/home/images/pic2.png"></div>
                                            <div class="slide-infor">${xw.get('xwbt190414001')}</div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <!--院内新闻-->
                <div class="layui-col-md6">
                    <div class="layui-card card-panel">
                        <div class="layui-card-header hd-header">院内新闻<a class="layui-icon index-more">更多</a></div>
                        <div class="layui-card-body">
                            <ul>
                                <c:if test="${!empty xinwen}">
                                    <c:forEach items="${xinwen}" var="xw" varStatus="status" begin="0" end="4">
                                        <li class="" onclick="seeTzggInfo('${xw.get('recorderNO')}','${xw.get('xwbt190414001')}')">
                                            <a href="javasrcipt:;" class="list-bar box-bar">
                                                <div class="box-bar-list">${xw.get('xwbt190414001')}</div>
                                                <div class="cell">${xw.get('rqxz190414001')}</div>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--我的任务-->
                <div class="layui-col-md6">
                    <div class="layui-card card-panel">
                        <div class="layui-card-header hd-header">我的任务</div>
                        <div class="layui-card-body" style="min-height: 175px;">
                            <ul>
                                <c:if test="${!empty taskSenderList}">
                                    <c:forEach items="${taskSenderList}" var="task" varStatus="status" begin="0" end="4">
                                        <li class="">
                                            <a lay-href="${task.refLinkUrl}" lay-text="任务处理" class="task-list-bar box-bar">
                                                <div class="box-bar-list">${task.taskTitle}</div>
                                                <div class="cell"><s:dic type="user" value="${task.recordName}"></s:dic></div>
                                                <div class="cell"><s:dic type="date" value="${task.recordTime}"></s:dic></div>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--党内资讯-->
                <div class="layui-col-md6">
                    <div class="layui-card card-panel">
                        <div class="layui-card-header hd-header">党务资讯<a class="layui-icon index-more">更多</a></div>
                        <div class="layui-card-body">
                            <ul>
                                <c:if test="${!empty dangqun}">
                                    <c:forEach items="${dangqun}" var="dq" varStatus="status" begin="0" end="4">
                                        <li class="" onclick="seeTzggInfo('${dq.get('recorderNO')}','${dq.get('zxbt190414001')}')">
                                            <a href="javasrcipt:;" class="list-bar box-bar">
                                                <div class="box-bar-list">${dq.get('zxbt190414001')}</div>
                                                <div class="cell">${dq.get('zxrq190414001')}</div>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--公告-->
                <div class="layui-col-md6">
                    <div class="layui-card card-panel">
                        <div class="layui-card-header hd-header">公告<a class="layui-icon index-more">更多</a></div>
                        <div class="layui-card-body" style="min-height: 104px;">
                            <ul>
                                <c:if test="${!empty ggList}">
                                    <c:forEach items="${ggList}" var="msg" varStatus="status" begin="0" end="2">
                                        <li class=""
                                            onclick="seeTzggInfo('${msg.get('recorderNO')}','${msg.get('tzggl18111002')}')">
                                            <a href="javasrcipt:;" class="list-bar box-bar">
                                                <div class="box-bar-list">${msg.get('bt18111000001')}</div>
                                                <div class="cell"><s:dic type="date"
                                                                         value="${msg.get('recordTime')}"></s:dic></div>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--我的消息-->
                <div class="layui-col-md6">
                    <div class="layui-card card-panel">
                        <div class="layui-card-header hd-header">我的消息<a class="layui-icon index-more">更多</a></div>
                        <div class="layui-card-body" style="min-height: 104px;">
                            <ul>
                                <c:if test="${!empty messageList}">
                                    <c:forEach items="${messageList}" var="msg" varStatus="status" begin="0" end="2">
                                        <li class="" onclick="checkmymsg('${msg.msgId}',0,'')">
                                            <a href="javasrcipt:;" class="list-bar box-bar">
                                                <div class="cell message-icon"><i class="iconfont">&#xe614;</i></div>
                                                <div class="box-bar-list">${msg.msgTitle}</div>
                                                <div class="cell"><s:dic type="date"
                                                                         value="${msg.msgSendTime}"></s:dic></div>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-col-md4">
            <div class="layui-card">
                <div class="layui-card-header box-bar affairs-hd">
                    <div class="cell mar-r"><i class="iconfont">&#xe6c7;</i></div>
                    <div class="box-bar-list">党务工作</div>
                </div>
                <div class="layui-card-body">
                    <ul class="menu-view top">
                        <li class="menu-list" onclick="window.open('/djhome.do')">
                            <a href="javascript:;" class="menu-list-a">
                                <div class="menu-imgbox"><img src="/resources/home/images/i1.png"></div>
                                <div class="menu-infor">党务资讯</div>
                            </a>
                        </li>
                        <li class="menu-list">
                            <a href="javascript:;" class="menu-list-a">
                                <div class="menu-imgbox"><img src="/resources/home/images/i2.png"></div>
                                <div class="menu-infor">精神文明建设</div>
                            </a>
                        </li>
                        <li class="menu-list">
                            <a href="javascript:;" class="menu-list-a">
                                <div class="menu-imgbox"><img src="/resources/home/images/i3.png"></div>
                                <div class="menu-infor">职工之家</div>
                            </a>
                        </li>
                        <li class="menu-list">
                            <a href="javascript:;" class="menu-list-a">
                                <div class="menu-imgbox"><img src="/resources/home/images/i4.png"></div>
                                <div class="menu-infor">意见信箱</div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="layui-card">
                <div class="layui-card-header hd-header"><a lay-href="/myurl/custommenu.do">常用链接</a></div>
                <div class="layui-card-body">
                    <ul class="menu-view middle">
                        <c:if test="${!empty usermenu}">
                            <c:forEach items="${usermenu}" var="um" varStatus="status">
                                <li class="menu-list">
                                    <a lay-href="${um.cddz181210001}" lay-text="${um.cdmc181210001}" class="menu-list-a">
                                        <div class="menu-imgbox">
                                            <img src="/resources/menuimg/${um.cdzj181210001}.png">
                                        </div>
                                        <div class="menu-infor">${um.cdmc181210001}</div>
                                    </a>
                                </li>
                            </c:forEach>
                        </c:if>
                    </ul>
                </div>
            </div>

            <div class="layui-card">
                <div class="layui-card-header hd-header">系统信息</div>
                <div class="layui-card-body system-body">
                    <div class="box-bar">
                        <div class="cell system-icon"></div>
                        <div class="box-bar-list">当前在线人数：<span class="corb" id="online">0</span></div>
                    </div>
                    <div class="box-bar">
                        <div class="cell system-icon bgg"></div>
                        <div class="box-bar-list">本月生日员工：<span class="corb"><s:page type="birthday"></s:page></span>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12 foot-bar">
            Copyright© 1980-2018 河北省产品质量监督检验研究院 All Rights Reserved. 河北省产品质量监督检验研究院
            电话：0311-83895666地址：河北省石家庄市鹿泉区上庄大街河北质监检验中心5栋 冀ICP备13017270号-1
        </div>
    </div>
</div>

<script src="/resources/layuiadmin/layui/layui.js?t=1"></script>
<script src="/resources/js/jquery/jquery-3.3.1.min.js"></script>

<script>
    var layer;
    layui.config({
        base: '/resources/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'carousel', 'form','layer'], function () {
        var carousel = layui.carousel
            , form = layui.form;
        layer = layui.layer;
        //改变下时间间隔、动画类型、高度
        carousel.render({
            elem: '#test-carousel-normal-2'
            , interval: 5000
            , anim: 'fade'
            , height: '242px'
            , width: '100%'
        });
    });

</script>
<script src="/resources/js/system/system.js"></script>

</body>
</html>

