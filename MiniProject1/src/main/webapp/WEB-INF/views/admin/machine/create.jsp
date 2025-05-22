<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/layout/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>운동기구 등록</title>
	<jsp:include page="/WEB-INF/views/layout/link.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	
<div class="container mt-5 mb-5">
  <div class="card shadow-lg">
    <div class="card-header bg-primary text-white">
      <h4 class="mb-0">운동기구 등록</h4>
    </div>
    <div class="card-body">
      <form action="<%=request.getContextPath()%>/admin/machine/create" method="post">
        <div class="mb-3">
          <label for="name" class="form-label">기구명</label>
          <input type="text" class="form-control" id="name" name="name" placeholder="기구명 입력" required>
        </div>
        
        <div class="mb-3">
          <label for="brand" class="form-label">브랜드</label>
          <input type="text" class="form-control" id="brand" name="brand" placeholder="브랜드 입력" required>
        </div>
        
        <div class="mb-3">
          <label for="category" class="form-label">카테고리</label>
          <select class="form-select" id="category" name="category" required>
            <option value="">카테고리 선택</option>
            <option value="CARDIO">CARDIO</option>
            <option value="CABLE">CABLE</option>
            <option value="PLATE">PLATE</option>
            <option value="ETC">ETC</option>
          </select>
        </div>
        
        <div class="mb-3">
          <label for="status" class="form-label">상태</label>
          <input type="text" class="form-control" id="status" name="status" placeholder="상태 입력" required>
        </div>
        
        <div class="d-grid">
          <button type="submit" class="btn btn-success btn-lg">등록</button>
        </div>
      </form>
    </div>
  </div>
</div>
	
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>