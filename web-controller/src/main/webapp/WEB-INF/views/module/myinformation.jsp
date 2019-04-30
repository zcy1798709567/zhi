<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/18
  Time: 下午 2:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.oa.com/core" prefix="s" %>
<jsp:include page="/common/var.jsp"></jsp:include>
<html>
<head>
    <meta charset="utf-8">
    <title>我的信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <jsp:include page="/common/css.jsp"></jsp:include>
    <jsp:include page="/common/js.jsp"></jsp:include>
    <script src="/resources/js/system/system.js" charset="utf-8"></script>
    <script src="/resources/js/system/manager.js" charset="utf-8"></script>
    <script type="text/javascript">
        function starscript() {

        }
    </script>
</head>
<body onload="starscript()">
<c:if test="${type=='emp'}">
    <div class="layui-container">
        <div class="layui-row">
            <div class="layui-col-xs12">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>我的信息维护</legend>
                </fieldset>
                <form class="layui-form layui-form-pane">
                    <div class="layui-form-item" hidden>
                        <label class="layui-form-label">员工编号</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="staffId" value="${emp.staffId}" readonly unselectable="on">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">员工姓名</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="staffName" value="${emp.staffName}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">籍贯</label>
                        <div class="layui-input-block">
                            <input type="text" name="nativePlace" autocomplete="off" placeholder="籍贯"
                                   class="layui-input" value="${emp.nativePlace}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">住址</label>
                        <div class="layui-input-block">
                            <input type="text" name="address" autocomplete="off" placeholder="住址" class="layui-input"
                                   value="${emp.address}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">联系电话</label>
                        <div class="layui-input-block">
                            <input type="text" name="phone" autocomplete="off" placeholder="联系电话" class="layui-input"
                                   value="${emp.phone}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">邮箱</label>
                        <div class="layui-input-block">
                            <input type="text" name="mailbox" autocomplete="off" placeholder="邮箱" class="layui-input"
                                   value="${emp.mailbox}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="formsubmit">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        layui.use('form', function () {
            var form = layui.form;
            form.render();
            form.on('submit(formsubmit)', function (data) {
                $.ajax({
                    type: "POST",
                    url: "/employees/update.do",
                    data: data.field,
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        layui.layer.closeAll();
                    },
                    error: function (message) {
                    }
                });
                parent.layer.msg("修改成功");
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            });
        });
    </script>
</c:if>
<c:if test="${type == 'user'}">
    <div class="layui-container">
        <div class="layui-row">
            <div class="layui-col-xs12">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>修改密码</legend>
                </fieldset>
                <form class="layui-form layui-form-pane">
                    <div class="layui-form-item" hidden>
                        <label class="layui-form-label">员工账号</label>
                        <div class="layui-input-inline">
                            <input type="hidden" class="layui-input" name="userName" value="${sessionScope.loginer.user}" readonly unselectable="on">
                            <input type="text" class="layui-input" name="name" value="${sessionScope.loginer.name}" readonly unselectable="on">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">旧密码：</label>
                        <div class="layui-input-inline">
                            <input type="password" id="used_password" name="used_password" lay-verify="used_pass" onblur="fieldcheck(this)" autocomplete="off" title="请输入旧的密码" class="layui-input" value="">
                            <p class="error-text" style="margin-top:10px;color: red"></p>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">新密码：</label>
                        <div class="layui-input-inline">
                            <input type="password" id="new_password" name="new_password" lay-verify="new_pass" autocomplete="off" title="请输入新的密码" class="layui-input" value="">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">确认新密码：</label>
                        <div class="layui-input-inline">
                            <input type="password" id="rep_password" name="rep_password" lay-verify="rep_pass" autocomplete="off" title="请重复输入新的密码" class="layui-input" value="">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" id="passwordsubmit" lay-submit lay-filter="passwordsubmit">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        layui.use('form', function () {
            var form = layui.form;
            form.render();
            form.verify({
                used_pass: function(value,item){
                    console.log(value)
                }
                ,new_pass: [/(.+){3,12}$/, '密码必须3到12位']
                ,rep_pass: function(value,item){
                    var repassvalue = $('#new_password').val();
                    console.log(value)
                    if(value != repassvalue){
                        return '两次输入的密码不一致!';
                    }
                }
            });
            form.on('submit(passwordsubmit)', function (data) {
                $.ajax({
                    type: "POST",
                    url: "/user/updatepw.do",
                    data: data.field,
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                    },
                    error: function (message) {
                    }
                });
                parent.layer.msg("密码修改成功");
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            });
        });
        function fieldcheck(obj){
            $.ajax({
                type: "POST",
                url: "/user/pw_validation.do",
                data: {'password':$(obj).val()},
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if(data=="0"){
                        $(".error-text").text("您输入的密码不正确!");
                        var div = document.getElementById('passwordsubmit');
                        var nclass = div.className;
                        div.className = nclass+' layui-btn-disabled';
                    }else{
                        $(".error-text").text("");
                        $(".error-text").height;
                        var div = document.getElementById('passwordsubmit').className = 'layui-btn';
                    }
                },
                error: function (message) {
                }
            });
        }
    </script>
</c:if>
</body>
</html>
