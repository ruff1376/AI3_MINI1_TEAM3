<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>

<footer class="text-light border-top">
	<div class="footer-con d-flex justify-content-between align-items-center px-5">
	    <!-- 로고 -->
	    <a href="<%= root %>/admin">
	    	<img src="<%= root %>/static/img/logo.png" alt="할건해야짐" class="footer-logo" style="width: 80px; height: 80px;">
	    </a>
	    <!-- 메뉴 -->
	    <ul class="footer-menu d-flex list-unstyled gap-5 mb-0 fs-6 fw-semibold">
	      <li><a href="<%= root %>/admin/memberlist" class="text-light text-decoration-none footer-link">회원관리</a></li>
	      <li><a href="<%= root %>/admin/schedule" class="text-light text-decoration-none footer-link">예약관리</a></li>
	      <li><a href="<%= root %>/admin/machine" class="text-light text-decoration-none footer-link">기구현황</a></li>
	      <li><a href="<%= root %>/admin/sales" class="text-light text-decoration-none footer-link">매출관리</a></li>
	      <li><a href="#" class="text-light text-decoration-none footer-link">문의사항</a></li>
	    </ul>
	</div>

	<div class="text-end border-top py-2 small text-muted pe-5">
	 	&copy; 2025 할건해야짐. All rights reserved.
	</div>
</footer>
