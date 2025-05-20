<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/common.jsp" %>

<footer class="text-light border-top pt-3">
  <div class="footer-con d-flex justify-content-between align-items-center">
    
    <!-- 로고 -->
    <img src="<%= root %>/static/img/logo.png" alt="할건해야짐" class="footer-logo" style="height: 80px;">
    
    <!-- 메뉴 -->
    <ul class="footer-menu d-flex list-unstyled gap-5 mb-0 fs-6 fw-semibold">
      <li><a href="#" class="text-light text-decoration-none footer-link">회원관리</a></li>
      <li><a href="#" class="text-light text-decoration-none footer-link">기구현황</a></li>
      <li><a href="#" class="text-light text-decoration-none footer-link">매출관리</a></li>
      <li><a href="#" class="text-light text-decoration-none footer-link">문의사항</a></li>
    </ul>
  </div>

  <div class="text-center border-top py-2 small text-muted">
    &copy; 할건해야짐 - 카피라이트 어쩌고
  </div>
</footer>
