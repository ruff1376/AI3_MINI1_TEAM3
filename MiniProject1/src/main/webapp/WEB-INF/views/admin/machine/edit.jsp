<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/layout/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>운동기구 현황 리스트</title>
	<jsp:include page="/WEB-INF/views/layout/link.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	
<div class="container mt-5 mb-5">
  <h2>기구 정보 수정</h2>
  <form id="form" action="<c:url value='/admin/machine/edit'/>" method="post">
    <input type="hidden" name="id" value="${machine.id}" />
    <div class="mb-3">
      <label class="form-label">장비 번호</label>
      <input type="text" name="id" value="${machine.id}" class="form-control" readonly />
    </div>
    <div class="mb-3">
      <label class="form-label">기구명</label>
      <input type="text" name="name" value="${machine.name}" class="form-control" required />
    </div>
    <div class="mb-3">
      <label class="form-label">브랜드</label>
      <input type="text" name="brand" value="${machine.brand}" class="form-control" required />
    </div>
    <div class="mb-3">
      <label class="form-label">카테고리</label>
      <select name="category" class="form-select">
        <option ${machine.category == 'CARDIO' ? 'selected' : ''}>CARDIO</option>
        <option ${machine.category == 'CABLE' ? 'selected' : ''}>CABLE</option>
        <option ${machine.category == 'PLATE' ? 'selected' : ''}>PLATE</option>
        <option ${machine.category == 'ETC' ? 'selected' : ''}>ETC</option>
      </select>
    </div>
    <div class="mb-3">
      <label class="form-label">상태</label>
      <input type="text" name="status" value="${machine.status}" class="form-control" required />
    </div>
    <div class="mb-3 d-flex justify-content-between align-items-center">
    	<div>
    		<a href="<%=request.getContextPath()%>/admin/machine/list?category=${machine.category}" class="btn btn-primary ms-2">목록</a>
    	</div>
    	<div>
	    	<button type="submit" class="btn btn-primary ms-2">수정</button>
	    	<button type="button" class="btn btn-danger ms-2" onclick="remove()">삭제</button>
    	</div>
    </div>
  </form>
<%--   <form action="<c:url value='/admin/machine/delete'/>" method="post" style="display:inline;"> --%>
<%--     <input type="hidden" name="id" value="${machine.id}"> --%>
<!-- </form> -->
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
			const url = root + "/admin/machine/delete"
			form.attr("action", url)
			form.submit()
		}
	</script>
</body>
</html>