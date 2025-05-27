<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>

<footer class="text-light border-top bg-secondary">
	<div class="footer-container d-flex align-items-center justify-content-center px-5 border-bottom position-relative">
	    <!-- 로고 및 메뉴 -->
	    <div class="d-flex justify-content-between w-100">
	    	<!-- 로고 -->
  			<a href="<%= root %>/admin" class="me-5 logo">
    			<img src="<%= root %>/static/img/logo.png" alt="할건해야짐" style="width: 80px; height: auto;">
  			</a>
	       
	        <!-- 메뉴 -->
	        <ul class="footer-menu px-0 d-flex fw-semibold position-absolute top-50 start-50 translate-middle m-0" id="menu-border">
	            <li><a class="text-light text-decoration-none footer-link" href="<%= root %>/admin/memberlist">회원관리</a></li>
	            <li><a class="text-light text-decoration-none footer-link" href="<%= root %>/admin/schedule">예약관리</a></li>
	            <li><a class="text-light text-decoration-none footer-link" href="<%= root %>/admin/machine">기구현황</a></li>
	            <li><a class="text-light text-decoration-none footer-link" href="<%= root %>/admin/sales">매출현황</a></li>
	            <li><a class="text-light text-decoration-none footer-link" href="#">문의사항</a></li>
	        </ul>
	    </div>
	    
	    <!-- 카피라이트 -->
	</div>
		<div>
			<p class="text-center small mt-2 w-100">상호명 : (주)할건해야짐 / 주소 : 인천 부평구 경원대로 1366 7층 더조은컴퓨터아카데미 인천캠퍼스</p>
			<p class="text-center small w-100">상담전화 : 032-8989-8989 이메일 : Doitdoit89@aloha.com</p>
		</div>
	    <div class="text-center small mb-2 pe-1 w-100">
	        Copyright&copy; 2025 할건해야짐. All rights reserved.
	    </div>
</footer>