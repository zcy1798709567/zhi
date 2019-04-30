<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/09/13
  Time: 下午 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.oa.com/core" prefix="s" %>
<jsp:include page="/common/var.jsp"></jsp:include>
<html>
<head>
    <meta charset="utf-8">
    <title>${title}</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <jsp:include page="/common/css.jsp"></jsp:include>
    <jsp:include page="/common/js.jsp"></jsp:include>
</head>
<body>
<c:if test="${type!='form' and type!='forms'}">
    <div class="layui-btn-group">
        <button class="layui-btn layui-btn-xs" data-type="select">选择</button>
    </div>
    <c:if test="${type!='workflow' and type!='formcm'}">
    <div class="layui-side" style="margin-top: 30px">
        <div class="layui-side-scroll">
            <ul id="formtree"></ul>
        </div>
    </div>
    </c:if>
    <div class="<c:if test="${type!='workflow' and type!='formcm'}">layui-body</c:if>" id="rigthPage">
        <div style="height:95%">
            <table class="layui-hide" lay-filter="tableselect"
                   lay-data="{id:'tableselect',height: 'full-40',cellMinWidth: 100}">
                <thead>
                <tr>
                        ${thead}
                </tr>
                </thead>
            </table>
        </div>
    </div>
    <script>
        var dag = window.parent;
        layui.use(['layer', 'table', 'tree'], function () {
            var layer = layui.layer;
            var table = layui.table;
            var type = "${type}";
            table.init('tableselect', {
                url: '${url}',
                method: 'POST',
                id: 'tableselect',
                page: true,
                limit: 10,
            });
            if(type!="workflow" && type!="formcm" ) {
                var createTree = function () {
                    var node = "";
                    $.ajax({
                        type: "POST",
                        url: "/department/depttree.do?spread=false",
                        contentType: "application/json; charset=utf-8",
                        dataType: "html",
                        async: false,
                        success: function (data) {
                            node = eval(data);
                        },
                        error: function (message) {
                            layer.msg("组织结构获取失败！");
                        }
                    });
                    return node;
                };
                layui.tree({
                    elem: '#formtree'
                    , target: '_blank'
                    , nodes: createTree()
                    , click: function (item) {
                        var id = item.id;
                        table.reload('tableselect', {
                            where: {
                                option: "deptId",
                                inputval: id,
                            }
                            ,page: {
                                curr: 1
                            }
                        });
                    }
                });
            }
            $('.layui-btn-group .layui-btn').on('click', function () {
                var checkStatus = table.checkStatus('tableselect');
                var data = checkStatus.data;
                var inputId = "${inputId}";
                if (data.length === 0) {
                    layer.msg('请选择需要引入的条目');
                } else {
                    if (inputId != null && inputId != "") {
                        if (type == "user" || type == "dept") {
                            dag.updateValInput(inputId, data[0]["${id}"], data[0]["${name}"]);
                        } else if (type == "users" || type == "depts") {
                            dag.updateValsInput(inputId, data, '${id}', '${name}');
                        }
                    } else {
                        dag.updateinput(data[0]["${id}"], data[0]["${name}"]);
                    }
                }
            });
            if (type == 'user' || type == 'dept') {
                table.on('rowDouble(tableselect)', function (obj) {
                    console.log(obj.data.userName)
                    var data = obj.data;
                    var inputId = "${inputId}";
                    if (data.length === 0) {
                        layer.msg('请选择需要引入的条目');
                    } else {
                        dag.updateValInput(inputId, data["${id}"], data["${name}"]);
                    }
                });
            }
        });
    </script>
</c:if>
<c:if test="${type=='form' or type=='forms'}">
    <div class="layui-btn-group">
        <button class="layui-btn layui-btn-xs" data-type="select">选择</button>
    </div>
    <table class="layui-hide" lay-filter="tableselect" lay-data="{id:'tableselect',height: 'full-40',cellMinWidth: 100}">
        <thead>
        <tr>
            ${thead}
        </tr>
        </thead>
    </table>
    <script>
        var dag = window.parent;
        layui.use(['layer', 'table', 'tree'], function () {
            var layer = layui.layer;
            var table = layui.table;
            var type = "${type}";
            table.init('tableselect', {
                url: '${url}',
                method: 'POST',
                id: 'tableselect',
                page: true,
                limit: 10,
            });

            $('.layui-btn-group .layui-btn').on('click', function () {
                var checkStatus = table.checkStatus('tableselect');
                var data = checkStatus.data;
                var inputId = "${inputId}";
                if (data.length === 0) {
                    layer.msg('请选择需要引入的条目');
                } else {
                    if (type == "form") {
                        console.log(data[0]["recorderNO"])
                        dag.updateValInput(inputId, data[0]["${id}"], data[0]["${name}"]);
                    } else if (type == "forms") {
                        console.log(data)
                        dag.updateValsInput(inputId, data, '${id}', '${name}');
                    }
                }
            });
            if (type == 'form') {
                table.on('rowDouble(tableselect)', function (obj) {
                    console.log(obj.data.userName)
                    var data = obj.data;
                    var inputId = "${inputId}";
                    if (data.length === 0) {
                        layer.msg('请选择需要引入的条目');
                    } else {
                        dag.updateValInput(inputId, data["${id}"], data["${name}"]);
                    }
                });
            }
        });
    </script>
</c:if>
</body>
</html>
