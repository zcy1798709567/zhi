<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/09/11
  Time: 下午 2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.oa.com/core" prefix="s" %>
<jsp:include page="/common/var.jsp"></jsp:include>
<html>
<head>
    <title>我的主页</title>
    <jsp:include page="/common/css.jsp"></jsp:include>
    <link rel="stylesheet" href="/resources/css/homepage.css" type="text/css"/>
    <jsp:include page="/common/js.jsp"></jsp:include>
    <script type="text/javascript" src="/resources/js/system/system.js"></script>
</head>
<body>

<div class="layui-body-right" id="container">
    <div class="layui-row homepage-space homepage-background">
        <div class="layui-col-md12">
            <div class="layui-card" style="height: 17.5%;">
                <div class="layui-card-header">
                    <i class="layui-icon layui-icon-note"></i> 今日工作安排
                    <div class="homepage-more"
                         onclick="parent.addtab('/schedule/gotoScheduleList.do?type=list','scheduleList','日程管理')">更多
                    </div>
                </div>
                <div class="layui-card-body">
                    <div class="layui-row layui-col-space10">
                        <c:if test="${!empty scheduleList}">
                            <c:forEach items="${scheduleList}" var="schedule" varStatus="status">
                                <div class="layui-col-md3" onclick="contentInfo(this)" data-value="${schedule.content}">
                                    <div class="homepage-plan" title="${schedule.scheduletTitle}">${schedule.scheduletTitle}</div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-row homepage-space" style="height: 40%;">
        <div class="layui-col-md6 homepage-background">
            <div class="layui-card" style="height: 100%;">
                <div class="layui-card-header">
                    <i class="layui-icon layui-icon-template-1"></i> 我的任务
                    <div class="homepage-more"
                         onclick="parent.addtab('/task/gototasksender.do','tasksender','我的任务')">更多
                    </div>
                </div>
                <div class="layui-card-body">
                    <dl>
                        <c:if test="${!empty taskSenderList}">
                            <c:forEach items="${taskSenderList}" var="task" varStatus="status">
                                <dd onclick="parent.addtab('${task.refLinkUrl}','${task.workOrderNO}','任务处理')">
                                    <div class="homepage-title">${task.taskTitle}</div>
                                    <div class="homepage-name"><s:dic type="user" value="${task.recordName}"></s:dic></div>
                                    <div class="homepage-time"><s:dic type="date" value="${task.recordTime}"></s:dic></div>
                                </dd>
                            </c:forEach>
                        </c:if>
                    </dl>
                </div>
            </div>
        </div>
        <div class="layui-col-md6 homepage-background">
            <div class="layui-card" style="height: 100%;">
                <div class="layui-card-header">
                    <i class="layui-icon layui-icon-notice"></i> 我的消息
                    <div class="homepage-more" onclick="parent.addtab('/message/seeMessagepage.do', 'msgSendUser', '我的消息')">更多</div>
                </div>
                <div class="layui-card-body">
                    <dl>
                        <c:if test="${!empty messageList}">
                            <c:forEach items="${messageList}" var="msg" varStatus="status">
                                <dd onclick="checkmymsg('${msg.msgId}',0,'')">
                                    <div class="homepage-title">${msg.msgTitle}</div>
                                    <div class="homepage-time"><s:dic type="date" value="${msg.msgSendTime}"></s:dic></div>
                                </dd>
                            </c:forEach>
                        </c:if>
                    </dl>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-row homepage-space" style="height: 40%;">
        <div class="layui-col-md6 homepage-background">
            <div class="layui-card" style="height: 100%;">
                <div class="layui-card-header">
                    <i class="layui-icon layui-icon-read"></i> 通知
                    <div class="homepage-more" onclick="parent.addtab('/seeTzggpage.do?type=1', 'tzgg', '通知公告')">更多</div>
                </div>
                <div class="layui-card-body">
                    <dl>
                        <c:if test="${!empty tzList}">
                            <c:forEach items="${tzList}" var="msg" varStatus="status">
                                <dd onclick="seeTzggInfo('${msg.recorderNO}','${msg.tzggl18111002}')">
                                    <div class="homepage-title">${msg.bt18111000001}</div>
                                    <div class="homepage-time"><s:dic type="date" value="${msg.recordTime}"></s:dic></div>
                                </dd>
                            </c:forEach>
                        </c:if>
                    </dl>
                </div>
            </div>
        </div>
        <div class="layui-col-md6 homepage-background">
            <div class="layui-card" style="height: 100%;">
                <div class="layui-card-header">
                    <i class="layui-icon layui-icon-release"></i> 公告
                    <div class="homepage-more" onclick="parent.addtab('/seeTzggpage.do?type=2', 'tzgg', '通知公告')">更多</div>
                </div>
                <div class="layui-card-body">
                    <dl>
                        <c:if test="${!empty ggList}">
                            <c:forEach items="${ggList}" var="msg" varStatus="status">
                                <dd onclick="seeTzggInfo('${msg.recorderNO}','${msg.tzggl18111002}')">
                                    <div class="homepage-title">${msg.bt18111000001}</div>
                                    <div class="homepage-time"><s:dic type="date" value="${msg.recordTime}"></s:dic></div>
                                </dd>
                            </c:forEach>
                        </c:if>
                    </dl>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="layui-side-right">
    <div class="layui-row homepage-card" style="height: 30%;">
        <div class="layui-col-md12">
            <div class="layui-card" style="height: 100%;">
                <div class="layui-card-header">常用链接</div>
                <div class="layui-card-body">
                    <div class="layui-row layui-col-space5">
                        <div class="layui-col-md4">
                            <div class="layui-card oa-system-link"
                                 onclick="parent.addtab('/file/gotofileList.do','fileList','常用文档')">
                                <span>常用文档</span>
                            </div>
                        </div>
                        <div class="layui-col-md4">
                            <div class="layui-card oa-system-link"
                                 onclick="parent.addtab('/schedule/gotoCheckList.do','workingcalendar','考勤记录')">
                                <span>考勤记录</span>
                            </div>
                            <%--<div class="layui-card oa-system-link"
                                 onclick="parent.addtab('/schedule/gotoworkingcalendar.do','workingcalendar','考勤纪录')">
                                <span>考勤纪录</span>
                            </div>--%>
                        </div>
                        <div class="layui-col-md4">
                            <div class="layui-card oa-system-link"
                                 onclick="parent.addtab('/schedule/gotoworkingcalendar.do','workingcalendar','日程管理')">
                                <span>日程管理</span>
                            </div>
                        </div>
                    </div>
                    <div class="layui-row layui-col-space5">
                        <div class="layui-col-md4">
                            <div class="layui-card oa-system-link"
                                 onclick="parent.addtab('/joblog/gotoJoblogList.do?type=list','joblogList','工作日志')">
                                <span>工作日志</span>
                            </div>
                        </div>
                        <div class="layui-col-md4">
                            <div class="layui-card oa-system-link"
                                 onclick="parent.addtab('/examination/getuservalue.do','examination','个人评分')">
                                <span>个人评分</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-row homepage-card" style="height: 50%;">
        <div class="layui-col-md12">
            <div class="layui-card" style="height: 100%;">
                <div class="layui-card-header">
                    我的链接
                    <div class="homepage-more" onclick="parent.addtab('/myurl/custommenu.do','custommenu','常用链接')">设置</div>
                </div>
                <div class="layui-card-body">
                    <div class="layui-row layui-col-space5" id="usermenu">
                        <c:if test="${!empty usermenu}">
                            <c:forEach items="${usermenu}" var="um" varStatus="status">
                                <div class="layui-col-md6">
                                    <div class="layui-card oa-system-link"
                                         onclick="parent.addtab('${um.cddz181210001}','${um.cdzj181210001}','${um.cdmc181210001}')">
                                        <span>${um.cdmc181210001}</span>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-row homepage-card" style="height: 20%;">
        <div class="layui-col-md12">
            <div class="layui-card" style="height: 98%;">
                <div class="layui-card-header">系统信息</div>
                <div class="layui-card-body" style="cursor:default;">
                    <div>在线人数：<span id="online">0</span></div>
                    <div>生&emsp;&emsp;日：<s:page type="birthday"></s:page></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var dag = window.parent;
    var layer = null;
    layui.use(['layer'], function () {
        layer = layui.layer;
    });
    function contentInfo(obj) {
        var content = $(obj).attr("data-value");
        var left = parseInt($(obj).offset().left);
        var top = parseInt($(obj).offset().top);
        layer.open({
            title: false
            , offset: [(top + 30) + "px", (left + 10) + "px"]
            , shade: 0
            , scrollbar: false
            , btn: []
            , content: '<pre>' + content + '</pre>'
        });
    }
    dag.setOnline = function(text){
        $("#online").text(text);
    }
</script>
</body>
</html>
