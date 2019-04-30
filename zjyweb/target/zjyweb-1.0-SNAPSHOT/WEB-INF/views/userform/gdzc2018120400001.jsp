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
    <script src="/resources/js/system/system.js" type="text/javascript" charset="utf-8"></script>
    <script src="/resources/js/system/manager.js" type="text/javascript" charset="utf-8"></script>
    <script src="/resources/js/system/form.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        function starscript(pageid, tableid, formid, field, value) {
            var type = '${type}';
            if(type == 'list'){
                tableLoading(pageid, tableid, formid, field, value);
            }
            formLoading(pageid, tableid, formid);
        }
    </script>
</head>
<body onload="starscript('${pageid}','${tableid}','${formid}','${field}','${value}')">
<c:if test="${type=='list'}">
    <div class="table-search" id="tablesearch">
        <div style="float: left">
            <label>检索：</label>
        </div>
        <div style="float: left">
            <select id="field" name="field">
                <s:page type="list_select" value="${tableid}"></s:page>
            </select>
        </div>
        <div style="float: left">
            <select id="term" name="term">
                <option value="等于">等于</option>
                <option value="包含">包含</option>
                <option value="不等于">不等于</option>
                <option value="大于">大于</option>
                <option value="大于等于">大于等于</option>
                <option value="小于">小于</option>
                <option value="小于等于">小于等于</option>
            </select>
        </div>
        <div style="float: left">
            <input class="" id="inputval" name="inputval" autocomplete="off">
        </div>
        <a onclick="tablesearch($('#field'),$('#term'),$('#inputval'),'${tableid}')">搜索</a>
    </div>
    <table lay-filter="${tableid}" id="${tableid}" class="layui-table"
           lay-data="{id:'${tableid}', height: 'full-60', cellMinWidth: 80, page: true, toolbar: '#toolbar', defaultToolbar: ['filter', 'exports']}">
        <thead>
        <tr>
            ${listTitle}
        </tr>
        </thead>
    </table>
    <script type="text/html" id="tableNum">
        <a class="layui-btn layui-btn-sm" style="text-decoration:none;" href="/userpage/pageform/{{d.${tableid}_recorderNO}}.do?type=info&pageid=${pageid}">{{d.${tableid}_num}}</a>
    </script>
    <script type="text/html" id="toolbar">
        <div class="layui-btn-container">
            <s:page type="list_button" value="${num}" form="${formid}"></s:page>
            <a class='layui-btn layui-btn-xs' href='/userpage/viewpage/${pageid}.do' title="刷新">刷新</a>
        </div>
    </script>
</c:if>
<c:if test="${type=='info'}">
    <c:if test="${contextmenu!=null and contextmenu!=''}">
        <div class="layui-row">
            <div class="layui-col-xs12">
                <span class="layui-breadcrumb" lay-separator="|">
                        ${contextmenu}
                </span>
            </div>
        </div>
    </c:if>
    <fieldset class="layui-elem-field">
        <legend>${title}</legend>
        <div class="layui-form layui-form-pane">
            <div class="layui-container">
                <c:if test="${!empty form}">
                    <c:forEach items="${form}" var="field" varStatus="status">
                        ${field}
                    </c:forEach>
                </c:if>
            </div>
        </div>
    </fieldset>
</c:if>
<c:if test="${type=='modi' || type=='add'}">
    <c:if test="${contextmenu!=null and contextmenu!=''}">
        <div class="layui-row">
            <div class="layui-col-xs12">
                <span class="layui-breadcrumb" lay-separator="|">
                        ${contextmenu}
                </span>
            </div>
        </div>
    </c:if>
    <fieldset class="layui-elem-field">
        <legend>${title}</legend>
        <form class="layui-form layui-form-pane" id="${formid}" action="/userpage/formsave/${pageid}.do?type=${type}&formid=${formid}" method='POST'>
            <div class="layui-container">
                <c:if test="${!empty form}">
                    <c:forEach items="${form}" var="field" varStatus="status">
                        ${field}
                    </c:forEach>
                </c:if>
            </div>
        </form>
    </fieldset>
</c:if>
</body>
</html>