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
    <title>首页</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <jsp:include page="/common/css.jsp"></jsp:include>
    <link rel="stylesheet" href="/resources/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/resources/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="/resources/home/css/font/iconfont.css" media="all">
    <link rel="stylesheet" href="/resources/home/css/custom.css" media="all">
    <jsp:include page="/common/js.jsp"></jsp:include>
    <script type="text/javascript" src="/resources/js/system/system.js"></script>
    <style>
        .layadmin-pagetabs .layui-tab-title {
            line-height: 40px;
        }
    </style>
</head>
<body class="layui-layout-body">

<div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
        <!-- 头部区域 -->
        <div class="layui-header">
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a  class="img-logo" href="javascript:;" target="_blank" title="">
                        <img src="/resources/home/images/logo.png" alt="">
                    </a>
                </li>
            </ul>
            <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">
                <li class="layui-nav-item" lay-unselect>
                    <a class="corb" lay-href="javascript:;" lay-text="">
                        <i class="iconfont">&#xe73c;</i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a class="corb" lay-href="javascript:;" lay-text="">
                        <i class="iconfont">&#xe646;</i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a class="corb" lay-href="javascript:;" lay-text="">
                        <i class="iconfont">&#xe645;</i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a class="corb" lay-href="javascript:;" lay-text="">
                        <i class="iconfont">&#xe693;</i>
                        <!-- 如果有新消息，则显示小圆点 -->
                        <span class="layui-badge-dot"></span>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a class="corb" lay-href="javascript:;" lay-text="">
                        <i class="iconfont">&#xe72a;</i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a class="corb" href="javascript:;" onclick="logoutpc();">
                        <i class="iconfont">&#xe644;</i>
                    </a>
                </li>
            </ul>
        </div>
        <!--顶部菜单-->
        <div class="menu-main-panel">
            <div class="inner-menu-panel">
                <ul id="menuTop-ul">
                </ul>
            </div>
        </div>
        <!-- 侧边菜单 -->
        <div class="layui-side layui-side-menu left-side-wrap">
            <div class="layui-side-scroll">
                <div class="user-tximgbox" lay-href="javascript:;">
                    <div class="user-imgbox-left"><img src="/resources/home/images/tx.png"></div>
                    <div class="user-infor-right">
                        <p class="font-18">${sessionScope.loginer.name}</p>
                        <p class="font-14">${sessionScope.loginer.dname}</p>
                    </div>
                </div>

                <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
                </ul>
            </div>
        </div>

        <!-- 页面标签 -->
        <div class="layadmin-pagetabs page-tab-bar" id="LAY_app_tabs">
            <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
                <div class="layui-icon layadmin-tabs-control layui-icon-prev tab-jt-left" layadmin-event="leftPage"></div>
                <div class="layui-icon layadmin-tabs-control layui-icon-next tab-jt-right" layadmin-event="rightPage"></div>
                <div class="layui-icon layadmin-tabs-control layui-icon-down tab-jt-down">
                    <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
                        <li class="layui-nav-item" lay-unselect>
                            <a href="javascript:;"></a>
                            <dl class="layui-nav-child layui-anim-fadein">
                                <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
                                <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
                                <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
                            </dl>
                        </li>
                    </ul>
                </div>
                <ul class="layui-tab-title" id="LAY_app_tabsheader">
                    <li lay-id="" lay-attr="" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
                </ul>
            </div>
        </div>
        <!-- 主体内容 -->
        <div class="layui-body main-body" id="LAY_app_body">
            <div class="layadmin-tabsbody-item layui-show">
                <iframe src="/home/homepage.do" frameborder="0" class="layadmin-iframe"></iframe>
            </div>
        </div>
    </div>
</div>

<!--不能删-->
<script>
    $(function () {
        var getData = "", menuTop = $("#menuTop-ul"), leftMenuFrame=$("#LAY-system-side-menu");
        $.ajax({
            type: "POST",
            url: "/menu/getmenudata.do",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                getData = data;
            },
            error: function (message) {
            }
        });
       if (getData && Array.isArray(getData) && getData.length){
            for (var i = 0; i< getData.length; i++) {
                if (getData[i].menus && Array.isArray(getData[i].menus)) {
                    var secondMenu = $(document.createElement('dl')).addClass('layui-nav-child');
                    for (var k=0;k<getData[i].menus.length;k++) {
                        $(document.createElement('dd')).data('name', 'console').append($(document.createElement('a')).attr('lay-href', getData[i].menus[k].url).text(getData[i].menus[k].title)).appendTo(secondMenu);
                    }
                } else {
                    console.log('Json：二级菜单数据错误');
                    return;
                }
                $(document.createElement('li')).addClass('inner-menu-list on').click(function () {
                    leftMenuFrame.children().addClass('hide').eq($(this).index()).removeClass('hide');
                }).append($(document.createElement('a')).attr({href: 'javascript:void(0)'}).text(getData[i].title)).appendTo(menuTop);
                var firstLi = $(document.createElement('li')).addClass('layui-nav-item layui-nav-itemed ' + (parseInt(i)?'hide':'')).append($(document.createElement('a')).attr({href: 'javascript:void(0)'}).append($(document.createElement('cite')).text(getData[i].title)));
                leftMenuFrame.append(firstLi.append(secondMenu));
            };
       } else {
           console.log('Json：一级菜单数据错误');
           return;
       }
    });

    layui.config({
        base: '/resources/layuiadmin/' //静态资源所在路径

    }).extend({
        index: 'lib/index' //主入口模块
    }).use('index');

    function  logoutpc(){
        if (confirm("您确定要退出系统吗？"))
            top.location = "/login.do";
        return false;
    }

</script>

</body>
</html>


