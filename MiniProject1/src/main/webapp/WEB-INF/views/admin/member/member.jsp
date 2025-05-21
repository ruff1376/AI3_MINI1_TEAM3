<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원관리</title>
</head>
<body>
	<%-- [Contents] ######################################################### --%>

	<main>
		<div class="container">
			<div class="px-4 pt-5 my-5 text-center border-bottom">
				<h1 class="display-4 fw-bold">회원관리</h1>
			</div>
			
			<div class="search-box">
		    	<input type="text" placeholder="회원명 입력" />
		    </div>
			
			<table class="table table-hover">
				<thead class="table-dark">
					<tr class="text-center">
						<th scope="col">#</th>
						<th class="text-left w-50" scope="col">이름</th>
						<th scope="col">전화번호</th>
						<th scope="col">등록일자</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${ memberList.isEmpty() }">
	            		<tr>
	            			<td align="center" colspan="5">조회된 데이터가 없습니다.</td>
	            		</tr>
	            	</c:if>
					<c:forEach var="member" items="${memberList}">
	                    <tr class="text-center">
	                        <td>${member.no}</td>
	                        <td class="text-start">
	                        	<a href="<%= root %>/member/read.jsp?id=${ member.id }">
		                        	${member.name}
	                        	</a>
	                        </td>
	                        <td>${member.phone}</td>
	                        <td>
	                            <fmt:formatDate value="${member.join_date}" pattern="yyyy.MM.dd"/>
	                        </td>
	                    </tr>
	                </c:forEach>
				</tbody>
			</table>
		</div>
	</main>
	
	<%-- [Contents] ######################################################### --%>
</body>
</html>