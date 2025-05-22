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
	
<div class="container text-center mt-5 mb-5">
    <h2>${param.category} 기구 목록</h2>
    <div class="btn-group mt-4 mb-5" role="group">
   		<a href="create" class="btn btn-outline-success">기구 등록</a>
        <a href="list?category=CARDIO" class="btn btn-outline-primary">CARDIO</a>
        <a href="list?category=CABLE" class="btn btn-outline-secondary">CABLE</a>
        <a href="list?category=PLATE" class="btn btn-outline-success">PLATE</a>
        <a href="list?category=ETC" class="btn btn-outline-danger">ETC</a>
    </div>
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
                <tr onclick="location.href='edit?id=${machine.id}'" style="cursor:pointer;">
                    <td>${machine.id}</td>
                    <td>${machine.brand}</td>
                    <td>${machine.name}</td>
                    <td>${machine.status}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
	
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>