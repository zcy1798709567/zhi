<%--
  Created by IntelliJ IDEA.
  User: zxd
  Date: 2018/08/31
  Time: 下午 3:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.oa.com/core" prefix="s" %>
<jsp:include page="/common/var.jsp"></jsp:include>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>腾智智慧办公系统</title>
    <jsp:include page="/common/css.jsp"></jsp:include>
    <link rel="stylesheet" href="/resources/css/home.css" type="text/css"/>
    <jsp:include page="/common/js.jsp"></jsp:include>
    <script type="text/javascript" src="/resources/js/system/system.js"></script>
    <script type="text/javascript" src="/resources/js/system/home.js"></script>
    <script type="text/javascript">
        var timeout = "";
        var websocket;

        function starscript() {
            $("#home-mymsg").bind("mouseleave", function () {
                $("#home-mymsg").fadeOut();
            });
            $("#openmymsg").bind("mouseleave", function () {
                timeout = setTimeout(function () {
                    $("#home-mymsg").fadeOut();
                }, 1500);
            });
            $("#home-mymsg").bind("mouseenter", function () {
                clearTimeout(timeout);
            });

            newwebsocket();
        }

    </script>
</head>
<body class="layui-layout-body" onload="starscript()">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="oa-logo" style="cursor: default;"><img src="/images/oalogo.png"/></div>
        <ul class="layui-nav layui-layout-left" style="margin-left: 45px;">
            <li class="layui-nav-item">
                <i class="layui-icon layui-icon-shrink-right oa-icon" id="animation-left-nav" title="收缩菜单"></i>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide-xs">
                <a href="javascript:void(0);"
                   onclick="addtab('/leaderSchedule/gotoLeaderSchedule.do','leaderSchedule','领导日程')" title="查看领导日程">
                    <i class="layui-icon layui-icon-flag oa-icon"></i>
                </a>
            </li>
            <li class="layui-nav-item layui-hide-xs">
                <a href="javascript:void(0);" id="addresslist" title="查看通讯录">
                    <i class="layui-icon layui-icon-cellphone oa-icon"></i>
                </a>
            </li>
            <li class="layui-nav-item layui-hide-xs">
                <a href="javascript:void(0)" onclick="addtab('/task/gototasksender.do','tasksender','我的任务')"
                   title="查看我的任务">
                    <i class="layui-icon layui-icon-template-1 oa-icon"></i>
                    <span class="oa-badge">${taskNum}</span>
                </a>
            </li>
            <li class="layui-nav-item layui-hide-xs">
                <a href="javascript:void(0)" id="openmymsg" onclick="openmymsg(this)" title="查看消息">
                    <i class="layui-icon layui-icon-notice oa-icon"></i>
                    <span class="oa-badge">${msgNum}</span>
                </a>
            </li>
            <div class="layui-layer" id="home-mymsg" style="width: 350px; height: 300px;" hidden>
                <div id="msg_window" class="layui-layer-content msg-window"></div>
                <span class="layui-layer-setwin"></span>
                <div class="layui-layer-btn layui-layer-btn-c" style="position:absolute;bottom:0;width: 100%">
                    <a class="layui-layer-btn0" href="javascript:void(0)"
                       onclick="addtab('/message/seeMessagepage.do', 'msgSendUser', '我的消息');" target="_blank">更多</a>
                </div>
            </div>
            <li class="layui-nav-item layui-hide-xs">
                <a href="/logout.do" title="退出"><i class="glyphicon glyphicon-off oa-icon" aria-hidden="true"></i></a>
            </li>
        </ul>
    </div>
    <div class="layui-side layui-bg-black" id="leftmenu">
        <div class="oa-side-user">
            <c:if test="${sessionScope.loginer!=null}">
                <c:if test="${sessionScope.loginer.user}">
                    <div class="oa-side-text">
                    </div>
                    <div class="oa-side-img">
                        <i class="layui-icon layui-icon-user"></i>
                    </div>
                    <div class="oa-side-text">
                        <span style="cursor: default;">${sessionScope.loginer.name}</span>
                    </div>
                    <div class="oa-side-text">
                        <a href="javascript:;" id="modimyemp">基本资料</a>
                        <a href="javascript:;" id="pwupdate">安全设置</a>
                    </div>

                </c:if>
            </c:if>
        </div>
        <div class="oa-side-scroll">
            <ul class='layui-nav layui-nav-tree oa-nav-tree' lay-shrink="all" lay-filter='leftmenu'>
                ${userMenu}
                <c:if test="${sessionScope.loginer!=null}">
                    <c:if test="${fn:contains(sessionScope.role,'admin;')}">
                        <li class='layui-nav-item'>
                            <a class='' href='javascript:;' data-id='admin'>系统管理</a>
                            <dl class='layui-nav-child'>
                                <dd><a href='/adminManage.do' data-title="系统管理" class='nav-active'>系统管理</a></dd>
                            </dl>
                        </li>
                    </c:if>
                </c:if>
            </ul>
        </div>
    </div>
    <%--<div class="oa-nav-sidebar">
        <div class="oa-sidebar">
            <i class="iconfont icon-zhankai3" id="animation-left-nav" style="font-size: 30px"></i>
        </div>
    </div>--%>
    <div class="layui-body" id="container">
        <div class="layui-tab layui-tab-card" lay-filter="homepage" style="margin: 0;">
            <ul class="layui-tab-title" style="background-color: #5bc0de;" id="tab_open_page">
                <li lay-id="home" class="layui-this">首页</li>
                <span class="layui-tab layui-layout-right" lay-stope="tabmore">
                    <i id="tab_sub_refresh" lay-stope="tabmore" class="layui-icon layui-icon-refresh"
                       title="刷新当前页面"></i>
                    <i id="tab_sub_close" lay-stope="tabmore" class="layui-icon layui-icon-close" title="关闭全部标签"></i>
                </span>
            </ul>
            <div class="layui-tab-content" style="padding: 5px 0 0 0;">
                <div class="layui-tab-item layui-show">
                    <iframe data-frameid="home" id="option" name="option" src="homepage.do" style="overflow: visible;"
                            scrolling="no" frameborder="no" width="100%" height="94%"></iframe>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-footer">
        底部
    </div>
</div>
<div class="msg-winpop" id="winpop">
    <div class="layui-layer-title">系统信息</div>
    <div class="layui-layer-content msg-winpop-title" id="winpoptitle">
        <div class="msg-winpop-text" id="winpoptext">系统消息</div>
    </div>
    <span class="layui-layer-setwin">
        <a class="layui-layer-ico layui-layer-close layui-layer-close1" href="javascript:;" onclick="tips_pop()"></a>
    </span>
    <span class="layui-layer-resize"></span>
</div>
</body>
</html>
