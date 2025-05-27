<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>할건해야짐</title>
	<jsp:include page="/WEB-INF/views/layout/link.jsp" />
</head>
<body class="d-flex flex-column min-vh-100">
	<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<%-- [Contents] ######################################################### --%>

	<div class="flex-grow-1 container text-center mt-5 mb-5">
		<h2>환영합니다</h2>
		<div class="btn mt-4">
			<a href="<%=root%>/admin" class="btn btn-outline-primary">관리자페이지로</a>
		</div>
	</div>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />

</body>
</html>