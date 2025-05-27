<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>할건해야짐</title>
	<jsp:include page="/WEB-INF/views/layout/link.jsp" />
</head>
<body class="d-flex flex-column min-vh-100" style="background-image: url('<%= root %>/static/img/mlogo.png');">
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	
<div class="flex-grow-1">

  <div class="position-relative text-white text-center h-100">

    <!-- 어두운 반투명 오버레이 -->
    <div class="position-absolute top-0 start-0 w-100 h-100 bg-dark opacity-50"></div>

    <!-- 콘텐츠 -->
    <div class="position-relative d-flex flex-column align-items-center justify-content-center h-100">
      <h2 class="display-4 fw-bold text-white mb-4">환영합니다</h2>
      <a href="<%= root %>/admin" class="btn btn-outline-light">관리자페이지로</a>
    </div>

  </div>

</div>

	
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>

