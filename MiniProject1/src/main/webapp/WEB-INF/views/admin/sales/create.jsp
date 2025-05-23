<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/layout/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>매출 조회</title>
	<jsp:include page="/WEB-INF/views/layout/link.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<%-- [Contents] ######################################################### --%>
<body>
	<div class="container mt-5 mb-5">
	    <h2 class="mb-4 text-center">매출 등록</h2>
	    <div class="mb-4 text-end">
        <a href="list" class="btn btn-outline-primary">매출 리스트로</a>
   	 	</div>
	    <form action="create" method="post" class="border p-4 rounded bg-light">
	        <div class="mb-3">
	            <label class="form-label">트레이너</label>
	            <select name="trainerid" class="form-select">
	                <c:forEach var="trainer" items="${trainerList}">
	                    <option value="${trainer.trainerId}">${trainer.name}</option>
	                </c:forEach>
	            </select>
	        </div>
	        <div class="mb-3">
	            <label class="form-label">금액</label>
	            <input type="number" name="amount" class="form-control" required />
	        </div>
	        <div class="mb-3">
	            <label class="form-label">비고</label>
	            <input type="text" name="note" class="form-control" />
	        </div>
	        <button type="submit" class="btn btn-success w-100">등록</button>
	    </form>
	</div>
	
<%-- [Contents] ######################################################### --%>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
<jsp:include page="/WEB-INF/views/layout/script.jsp" />
	

</body>
</html>