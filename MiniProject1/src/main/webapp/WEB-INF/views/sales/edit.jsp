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
	    <h2 class="mb-4 text-center">매출 수정</h2>
	    <form id="form" action="<c:url value='/admin/sales/edit'/>" method="post" class="border p-4 rounded bg-light">
	        <input type="hidden" name="salesid" value="${sales.salesId}" />
	        <input type="hidden" name="trainerid" value="${sales.trainerId}" />
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
	            <input type="number" name="amount" class="form-control" value="${sales.amount}" required />
	        </div>
	        <div class="mb-3">
	            <label class="form-label">비고</label>
	            <input type="text" name="note" class="form-control" value="${sales.note}" />
	        </div>
	        <div class="d-flex justify-content-between">
	            <button type="submit" class="btn btn-primary">수정</button>
	            <a href="list" class="btn btn-secondary">취소</a>
	        </div>
	    </form>
	</div>
	
<%-- [Contents] ######################################################### --%>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
<jsp:include page="/WEB-INF/views/layout/script.jsp" />
	

</body>
</html>