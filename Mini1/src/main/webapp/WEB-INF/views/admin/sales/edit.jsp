<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/layout/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>매출 수정</title>
	<jsp:include page="/WEB-INF/views/layout/link.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<%-- [Contents] ######################################################### --%>
<body class="d-flex flex-column min-vh-100">
	<div class="flex-grow-1 container mt-5 mb-5">
	    <h2 class="mb-4 text-center">매출 수정</h2>
	    <form id="form" action="<c:url value='/admin/sales/edit'/>" method="post" class="border p-4 rounded bg-light">
	        <input type="hidden" name="salesid" value="${sales.salesId}" />
<%-- 	        <input type="hidden" name="trainerid" value="${sales.trainerId}" /> --%>
	        <div class="mb-3">
	            <label class="form-label">트레이너</label>
	            <select name="trainerid" class="form-select">
                    <option>트레이너 선택</option>
	                <c:forEach var="trainer" items="${trainerList}">
	                	<c:if test="${ trainer.trainerId == sales.trainerId }">
	                		<option value="${trainer.trainerId}" selected>${trainer.name}</option>	
	                	</c:if>
	                	<c:if test="${ trainer.trainerId != sales.trainerId }">
	           				<option value="${trainer.trainerId}">${trainer.name}</option>
	                	</c:if>
                	</c:forEach>
	            </select>
	        </div>
	        <div class="mb-3">
	            <label class="form-label">매출번호</label>
	            <input type="number" name="salesid" class="form-control" value="${sales.salesId}" readonly />
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
		        <div class="d-flex">
		            <button type="submit" class="btn btn-primary">수정완료</button>
		            <button type="button" class="btn btn-danger ms-2" onclick="remove()">삭제하기</button>
		        </div>
		        <div>
		            <a href="list" class="btn btn-secondary">취소</a>
		        </div>
	        </div>
	    </form>
	</div>
	
<%-- [Contents] ######################################################### --%>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
<jsp:include page="/WEB-INF/views/layout/script.jsp" />
<script type="text/javascript">
		const root = "${ root }"
		const form = $('#form')
		function remove() {
			const check = confirm("정말로 삭제하시겠습니까?") 
			if( !check ) return
			const url = root + "/admin/sales/delete"
			form.attr("action", url)
			form.submit()
		}
</script>
	

</body>
</html>