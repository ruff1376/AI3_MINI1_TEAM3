<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>운동기구 현황 리스트</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/machine.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
</head>
<body>
	<%-- [Contents] ######################################################### --%>
	
<div class="container mt-5">
    <h2>${param.category} 기구 목록</h2>
    <a href="create" class="btn btn-success mb-3">기구 등록</a>
    <table class="table table-hover">
        <thead class="table-dark">
            <tr>
                <th>#</th>
                <th>브랜드</th>
                <th>기구명</th>
                <th>상태</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="machine" items="${list}">
                <tr onclick="location.href='edit?id=${machines.gymMachineId}'" style="cursor:pointer;">
                    <td>${machine.gymMachineId}</td>
                    <td>${machine.brand}</td>
                    <td>${machine.name}</td>
                    <td>${machine.status}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
	
	<%-- [Contents] ######################################################### --%>
	
</body>
</html>