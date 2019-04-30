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
	<meta charset="UTF-8">
	<title>河北质检业务管理办公系统</title>
	<link rel="stylesheet" type="text/css" href="/resources/tophome/css/myindex.css"/>
</head>
<body>
<div class="xwarp">
	<div class="content">
		<header>
			<div class="logo"><img src="/resources/tophome/images/xlogo.png" alt=""/></div>
			<div class="headrt">
				<img class="tou" src="/resources/tophome/images/tou.png" alt="" />
				<div class="signout" onclick="window.location.href='/logout.do'">
					<img  src="/resources/tophome/images/signout.png" alt=""/>
				</div>
			</div>
		</header>
		<div class="main">
			<div class="mainlt">
				<ul class="ltnav">
					<li class="limax" onclick="window.location.href='/oahome.do'">
						<div class="maxtxt">综合办公平台</div>
						<div class="maxpic"><img src="/resources/tophome/images/cont1.png" alt="" /></div>
					</li>
					<li class="limin">
						<div class="mintxt">公共服务平台</div>
						<div class="minpic"><img src="/resources/tophome/images/cont2.png" alt="" /></div>
					</li>
					<li class="limin">
						<div class="mintxt">业务发展平台</div>
						<div class="minpic"><img src="/resources/tophome/images/cont3.png" alt="" /></div>
					</li>
					<li class="limax">
						<div class="maxtxt">核心业务平台</div>
						<div class="maxpic"><img src="/resources/tophome/images/cont4.png" alt="" /></div>
					</li>
					<li class="limax">
						<div class="maxtxt">决策支持平台</div>
						<div class="maxpic"><img src="/resources/tophome/images/cont5.png" alt="" /></div>
					</li>
				</ul>
				<div class="btm">
					<div class="masstit">
						消息
					</div>
					<ul class="massage">
						<li>
							<span class="dian"></span>
							华为突然宣布大消息P30销量额10秒12亿震惊全球P30销量额10秒12亿震惊全球
						</li>
						<li>
							<span class="dian"></span>
							华为突然宣布大消息P30销量额10秒12亿震惊全球P30销量额10秒12亿震惊全球
						</li>
					</ul>
				</div>
				<div class="btm">
					<div class="masstit">
						任务
					</div>
					<ul class="massage">
						<li>
							<span class="dian"></span>
							华为突然宣布大消息P30销量额10秒12亿震惊全球P30销量额10秒12亿震惊全球
						</li>
						<li>
							<span class="dian"></span>
							华为突然宣布大消息P30销量额10秒12亿震惊全球P30销量额10秒12亿震惊全球
						</li>
					</ul>
				</div>
			</div>
			<div class="mainrt">
				<img src="/resources/tophome/images/contrt.png"/>
			</div>
		</div>
	</div>
</div>		
</body>
</html>
