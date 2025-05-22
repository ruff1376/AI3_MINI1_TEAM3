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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<style>
/* 	    body { */
/* 	      font-family: 'Noto Sans KR', sans-serif; */
/* 	      background-color: #fff; */
/* 	    } */
	
/* 	    .search-box { */
/* 	      position: relative; */
/* 	      max-width: 500px; */
/* 	      margin: 30px auto; */
/* 	    } */
	
/* 	    .search-box input { */
/* 	      padding-left: 40px; */
/* 	    } */
	
/* 	    .search-icon { */
/* 	      position: absolute; */
/* 	      top: 50%; */
/* 	      left: 10px; */
/* 	      transform: translateY(-50%); */
/* 	      color: #999; */
/* 	    } */
	
/* 	    .custom-row { */
/* 	      background-color: #6ee7b7; */
/* 	      border-radius: 12px; */
/* 	      box-shadow: 2px 4px 8px rgba(0,0,0,0.1); */
/* 	      margin-bottom: 12px; */
/* 	      transition: all 0.2s ease; */
/* 	    } */
	
/* 	    .custom-row:hover { */
/* 	      background-color: #4dd2a0; */
/* 	    } */
	
/* 	    .custom-row td { */
/* 	      vertical-align: middle; */
/* 	      padding: 16px; */
/* 	    } */
	
/* 	    .table-header th { */
/* 	      background-color: #eee !important; */
/* 	      text-align: center; */
/* 	      vertical-align: middle; */
/* 	    } */
	
/* 	    .table-container { */
/* 	      max-width: 900px; */
/* 	      margin: 0 auto; */
/* 	    } */
	</style>
	
</head>
<body>
	<jsp:include page="../../layout/header.jsp" />
	<%-- [Contents] ######################################################### --%>

	<main>
		<!-- 1 -->
		<div class="container">
			<div class="px-4 pt-5 my-5 text-center border-bottom">
				<h1 class="display-4 fw-bold">회원관리</h1>
			</div>
	
			<div class="search-box mb-3">
				<input type="text" id="memberSearch" class="form-control" placeholder="회원명 입력" />
			</div>
	
			<div class="table-box mb-10">
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
								<td class="text-center member-name">
									<a href="<%= root %>/memberlist/info.jsp?id=${ member.memberNo }">
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
		</div>
	
		<!-- 2 -->
<!-- 		<div class="container py-5"> -->
<!-- 		    <h1 class="text-center fw-bold mb-4">회원관리</h1> -->
		
<!-- 		    검색창 -->
<!-- 		    <div class="search-box"> -->
<!-- 		      <i class="bi bi-search search-icon"></i> -->
<!-- 		      <input type="text" id="searchInput" oninput="filterMembers()" class="form-control" placeholder="회원명 입력" /> -->
<!-- 		    </div> -->
		
<!-- 		    회원 테이블 -->
<!-- 		    <div class="table-container"> -->
<!-- 		      <table class="table"> -->
<!-- 		        <thead class="table-header"> -->
<!-- 		          <tr> -->
<!-- 		            <th>#</th> -->
<!-- 		            <th>이름</th> -->
<!-- 		            <th>전화번호</th> -->
<!-- 		            <th>등록일자</th> -->
<!-- 		          </tr> -->
<!-- 		        </thead> -->
<!-- 		        <tbody> -->
<%-- 		          <c:forEach var="member" items="${memberList}"> --%>
<!-- 		            <tr class="member-row custom-row text-center"> -->
<%-- 		              <td>${member.memberNo}</td> --%>
<%-- 		              <td class="member-name">${member.name}</td> --%>
<%-- 		              <td>${member.phone}</td> --%>
<%-- 		              <td><fmt:formatDate value="${member.joinDate}" pattern="yyyy.MM.dd" /></td> --%>
<!-- 		            </tr> -->
<%-- 		          </c:forEach> --%>
<!-- 		        </tbody> -->
<!-- 		      </table> -->
<!-- 		    </div> -->
<!-- 		</div> -->
	
		<script>
			// 1
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

			// 2
// 			function filterMembers() {
// 		      const keyword = document.getElementById("searchInput").value.toLowerCase();
// 		      const rows = document.querySelectorAll(".member-row");
// 		      let visible = false;
		
// 		      rows.forEach(row => {
// 		        const name = row.querySelector(".member-name").textContent.toLowerCase();
// 		        if (name.includes(keyword)) {
// 		          row.style.display = "";
// 		          visible = true;
// 		        } else {
// 		          row.style.display = "none";
// 		        }
// 		      });
		
// 		      const emptyRow = document.querySelector("#emptyRow");
// 		      if (emptyRow) emptyRow.remove();
		
// 		      if (!visible) {
// 		        const tbody = document.querySelector("tbody");
// 		        const tr = document.createElement("tr");
// 		        tr.id = "emptyRow";
// 		        tr.innerHTML = `<td colspan="4" class="text-center py-3">조회된 데이터가 없습니다.</td>`;
// 		        tbody.appendChild(tr);
// 		      }
// 		    }

		</script>
	</main>
	
	<%-- [Contents] ######################################################### --%>
	
	<jsp:include page="../../layout/footer.jsp" />
</body>
</html>