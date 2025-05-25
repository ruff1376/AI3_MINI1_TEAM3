<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/common.jsp" %>

<nav class="navbar navbar-expand-lg px-5 py-0">
	<div class="container-fluid">
    	<!-- 로고 / 홈 링크 -->
    	<a class="navbar-brand" href="<%= root %>/admin">
      		<img src="<%= root %>/static/img/logo.png" alt="할건해야짐" width="80" height="80" class="d-inline-block align-text-top">
    	</a>

   		<!-- 메뉴 -->
    	<div class="collapse navbar-collapse" id="navbarMain">
      	<!-- 왼쪽 메뉴 -->
   			<ul class="navbar-nav mb-2 mb-lg-0">
	        	<li class="nav-item"><a class="nav-link" href="<%= root %>/admin/memberlist">회원관리</a></li>
	        	<li class="nav-item"><a class="nav-link" href="<%= root %>/admin/schedule">예약관리</a></li>
	        	<li class="nav-item"><a class="nav-link" href="<%= root %>/admin/machine">기구현황</a></li>
	        	<li class="nav-item"><a class="nav-link" href="<%= root %>/admin/sales">매출현황</a></li>
		        <li class="nav-item"><a class="nav-link" href="#">문의사항</a></li>
	      	</ul>
      		<!-- 오른쪽 로그인/로그아웃 -->
      		<ul class="navbar-nav-login mb-lg-0 d-flex align-items-center">
	        	<%
	          		if (loginId == null || loginId.equals("")) {
	        	%>
	          	<!-- 비로그인 시 -->
	          	<li class="nav-item">
	            	<a class="nav-link" href="#">로그인</a>
	          	</li>
	        	<%
	          		} else {
	        	%>
	          	<!-- 로그인 시 -->
	          	<li class="nav-item dropdown">
	            	<a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	              		<img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
	              		<strong><%= loginId %></strong>
	            	</a>
	            	<ul class="dropdown-menu dropdown-menu-end text-small shadow">
	              		<li><a class="dropdown-item" href="<%= root %>/users/logout">로그아웃</a></li>
	            	</ul>
	          	</li>
	        	<%
	          		}
	        	%>
      		</ul>
   		</div>
	</div>
</nav>
