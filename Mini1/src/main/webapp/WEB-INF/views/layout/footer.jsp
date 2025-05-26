<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>

<footer class="text-light border-top">
	<div class="footer-container d-flex flex-column px-5 py-2">
	    <!-- 로고 및 메뉴 -->
	    <div class="d-flex justify-content-between align-items-center w-100">
	        <!-- 로고 -->
	        <a href="<%= root %>/admin">
	            <img src="<%= root %>/static/img/logo.png" alt="할건해야짐" class="footer-logo" style="width: 80px; height: 80px;">
	        </a>
	        <!-- 메뉴 -->
	        <ul class="footer-menu d-flex list-unstyled fw-semibold my-0 mx-auto">
	            <li><a class="text-light text-decoration-none footer-link" href="<%= root %>/admin/memberlist">회원관리</a></li>
	            <li><a class="text-light text-decoration-none footer-link" href="<%= root %>/admin/memberlist">식단관리</a></li>
	            <li><a class="text-light text-decoration-none footer-link" href="<%= root %>/admin/schedule">예약관리</a></li>
	            <li><a class="text-light text-decoration-none footer-link" href="<%= root %>/admin/machine">기구현황</a></li>
	            <li><a class="text-light text-decoration-none footer-link" href="<%= root %>/admin/sales">매출현황</a></li>
	            <li><a class="text-light text-decoration-none footer-link" href="#">문의사항</a></li>
	        </ul>
	    </div>

	    <!-- 카피라이트 -->
	    <div class="text-center small text-light mt-2 pe-1 w-100">
	        &copy; 2025 할건해야짐. All rights reserved.
	    </div>
	</div>
</footer>