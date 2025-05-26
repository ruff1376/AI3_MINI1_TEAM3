<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>project💻 - ALOHA CLASS🌴</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
</head>
<body>
	<%-- [Contents] ######################################################### --%>
	
	<div class="container mt-5">
  <h2 class="mb-4">${param.category} 기구 목록</h2>
  <div class="mb-3">
    <a href="<c:url value='/admin/machine/register'/>" class="btn btn-primary">기구 등록</a>
  </div>
  <table class="table table-bordered text-center">
    <thead class="table-dark">
      <tr>
        <th>#</th>
        <th>기구명</th>
        <th>브랜드</th>
        <th>상태</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="machine" items="${machines}">
        <tr>
          <td>${machine.gymMachineId}</td>
          <td>
            <a href="<c:url value='/admin/machine/edit?id=${machine.gymMachineId}'/>">
              ${machine.name}
            </a>
          </td>
          <td>${machine.brand}</td>
          <td>${machine.status}</td>
        </tr>
      </c:forEach>
      <c:if test="${empty machines}">
        <tr>
          <td colspan="4">등록된 기구가 없습니다.</td>
        </tr>
      </c:if>
    </tbody>
  </table>
</div>
	
	<%-- [Contents] ######################################################### --%>
</body>
</html>