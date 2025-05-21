<%@ include file="../../layout/jstl.jsp" %>
<%@ include file="../../layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원관리</title>
	<jsp:include page="../../layout/link.jsp" />
</head>
<body>
	<jsp:include page="../../layout/header.jsp" />
	<%-- [Contents] ######################################################### --%>

	<main>
		<div class="container">
			<div class="px-4 pt-5 my-5 text-center border-bottom">
				<h1 class="display-4 fw-bold">회원관리</h1>
			</div>
	
			<div class="search-box mb-3">
				<input type="text" id="memberSearch" class="form-control" placeholder="회원명 입력" />
			</div>
	
			<table class="table table-hover" id="memberTable">
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
							<td align="center" colspan="4">조회된 데이터가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="member" items="${memberList}">
						<tr class="text-center member-row">
							<td>${member.memberNo}</td>
							<td class="text-start member-name">
								<a href="<%= root %>/member/info.jsp?id=${ member.memberNo }">
									${member.name}
								</a>
							</td>
							<td>${member.phone}</td>
							<td>
								<fmt:formatDate value="${member.joinDate}" pattern="yyyy.MM.dd"/>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	
		<script>
			// 실시간 검색 기능 (Vanilla JS)
			document.getElementById('memberSearch').addEventListener('input', function () {
				const keyword = this.value.toLowerCase();
				const rows = document.querySelectorAll('.member-row');
				let anyVisible = false;
	
				rows.forEach(row => {
					const nameCell = row.querySelector('.member-name').textContent.toLowerCase();
					if (nameCell.includes(keyword)) {
						row.style.display = '';
						anyVisible = true;
					} else {
						row.style.display = 'none';
					}
				});
	
				// "조회된 데이터가 없습니다" 메시지 처리
				const emptyRow = document.querySelector('#memberTable tbody .empty-row');
				if (emptyRow) emptyRow.remove();
	
				if (!anyVisible) {
					const tbody = document.querySelector('#memberTable tbody');
					const tr = document.createElement('tr');
					tr.classList.add('empty-row');
					tr.innerHTML = `<td colspan="4" class="text-center">조회된 데이터가 없습니다.</td>`;
					tbody.appendChild(tr);
				}
			});
		</script>
	</main>
	
	<%-- [Contents] ######################################################### --%>
	
	<jsp:include page="../../layout/footer.jsp" />
</body>
</html>