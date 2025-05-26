<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>운동기구 현황 리스트</title>
<%-- 	<link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/machine.css"> --%>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
</head>
<body>
	<%-- [Contents] ######################################################### --%>
	
<div class="container mt-5">
  <h2>기구 정보 수정</h2>
  <form action="<c:url value='/admin/machine/edit'/>" method="post">
    <input type="hidden" name="gymMachineId" value="${machine.gymMachineId}" />
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
    <button type="submit" class="btn btn-primary">수정</button>
    <a href="<c:url value='/admin/machine/delete?id=${machine.gymMachineId}'/>" class="btn btn-danger ms-2">삭제</a>
  </form>
</div>
	
	<%-- [Contents] ######################################################### --%>
	
</body>
</html>