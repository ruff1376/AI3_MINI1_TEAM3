<%@ include file="../../layout/jstl.jsp"%>
<%@ include file="../../layout/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원관리</title>
	<jsp:include page="../../layout/link.jsp" />
	<link rel="stylesheet" href="<%=root%>/static/css/member.css" />
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
		rel="stylesheet">
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />

</head>
<body>
	<jsp:include page="../../layout/header.jsp" />
	
	<%-- [Contents] ######################################################### --%>

	<main>
		<div class="container mt-5 mb-5">
			<div class="text-center border-bottom pb-4">
				<h1 class="display-5 fw-bold">회원관리</h1>
			</div>

			<div class="search-box">
				<i class="bi bi-search search-icon"></i> <input type="text"
					id="memberSearch" class="form-control" placeholder="회원명 입력"
					oninput="filterMembers()" />
			</div>

			<div class="table-box">
				<table class="table table-hover">
					<thead class="table-dark text-center">
						<tr>
							<th scope="col">#</th>
							<th scope="col" class="w-50">이름</th>
							<th scope="col">전화번호</th>
							<th scope="col">등록일자</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${memberList.isEmpty()}">
								<tr style="height: 100px;" class="text-center member-row custom-row">
									<td colspan="4"
										style="background-color: #f9f9f9; border-radius: 12px;">
										조회된 데이터가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="member" items="${memberList}">
									<tr class="text-center member-row custom-row"
										onclick="goToDetail(${member.memberNo})">
										<td>${member.memberNo}</td>
										<td class="member-name">${member.name}</td>
										<td>${member.phone}</td>
										<td><fmt:formatDate value="${member.joinDate}"
												pattern="yyyy.MM.dd" /></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
		
		<!-- Member Detail Modal -->
		<div class="modal fade" id="memberModal" tabindex="-1" aria-labelledby="memberModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="memberModalLabel">회원 정보</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
		      </div>
		      <div class="modal-body">
		        <p><strong>회원 번호:</strong> <span id="modalMemberNo"></span></p>
		        <p><strong>이름:</strong> <span id="modalName"></span></p>
		        <p><strong>전화번호:</strong> <span id="modalPhone"></span></p>
		        <p><strong>등록일자:</strong> <span id="modalJoinDate"></span></p>
		        <p><strong>PT 횟수:</strong> <span id="modalPtCount"></span></p>
		      </div>
		    </div>
		  </div>
		</div>
		
	</main>

	<%-- [Contents] ######################################################### --%>

	<jsp:include page="../../layout/script.jsp" />
	<jsp:include page="../../layout/footer.jsp" />
</body>
</html>