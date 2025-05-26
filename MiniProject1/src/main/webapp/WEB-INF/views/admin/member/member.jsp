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
		<!-- 1 -->
		<!-- 		<div class="container"> -->
		<!-- 			<div class="px-4 pt-5 my-5 text-center border-bottom"> -->
		<!-- 				<h1 class="display-4 fw-bold">회원관리</h1> -->
		<!-- 			</div> -->

		<!-- 			<div class="search-box mb-3"> -->
		<!-- 				<input type="text" id="memberSearch" class="form-control" placeholder="회원명 입력" /> -->
		<!-- 			</div> -->

		<!-- 			<div class="table-box mb-10"> -->
		<!-- 				<table class="table table-hover" id="memberTable"> -->
		<!-- 					<thead class="table-dark"> -->
		<!-- 						<tr class="text-center"> -->
		<!-- 							<th scope="col">#</th> -->
		<!-- 							<th class="text-left w-50" scope="col">이름</th> -->
		<!-- 							<th scope="col">전화번호</th> -->
		<!-- 							<th scope="col">등록일자</th> -->
		<!-- 						</tr> -->
		<!-- 					</thead> -->
		<!-- 					<tbody> -->
		<%-- 						<c:if test="${ memberList.isEmpty() }"> --%>
		<!-- 							<tr> -->
		<!-- 								<td align="center" colspan="4">조회된 데이터가 없습니다.</td> -->
		<!-- 							</tr> -->
		<%-- 						</c:if> --%>
		<%-- 						<c:forEach var="member" items="${memberList}"> --%>
		<!-- 							<tr class="text-center member-row"> -->
		<%-- 								<td>${member.memberNo}</td> --%>
		<!-- 								<td class="text-center member-name"> -->
		<%-- 									<a href="<%= root %>/memberlist/info.jsp?id=${ member.memberNo }"> --%>
		<%-- 										${member.name} --%>
		<!-- 									</a> -->
		<!-- 								</td> -->
		<%-- 								<td>${member.phone}</td> --%>
		<!-- 								<td> -->
		<%-- 									<fmt:formatDate value="${member.joinDate}" pattern="yyyy.MM.dd"/> --%>
		<!-- 								</td> -->
		<!-- 							</tr> -->
		<%-- 						</c:forEach> --%>
		<!-- 					</tbody> -->
		<!-- 				</table> -->
		<!-- 			</div> -->
		<!-- 		</div> -->

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

		<!-- 3 -->
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
		<!-- 			// 1 -->
		<!-- 			// 실시간 검색 기능 (Vanilla JS) -->
		<!-- // 			document.getElementById('memberSearch').addEventListener('input', function () { -->
		<!-- // 				const keyword = this.value.toLowerCase(); -->
		<!-- // 				const rows = document.querySelectorAll('.member-row'); -->
		<!-- // 				let anyVisible = false; -->

		<!-- // 				rows.forEach(row => { -->
		<!-- // 					const nameCell = row.querySelector('.member-name').textContent.toLowerCase(); -->
		<!-- // 					if (nameCell.includes(keyword)) { -->
		<!-- // 						row.style.display = ''; -->
		<!-- // 						anyVisible = true; -->
		<!-- // 					} else { -->
		<!-- // 						row.style.display = 'none'; -->
		<!-- // 					} -->
		<!-- // 				}); -->

		<!-- // 				// "조회된 데이터가 없습니다" 메시지 처리 -->
		<!-- // 				const emptyRow = document.querySelector('#memberTable tbody .empty-row'); -->
		<!-- // 				if (emptyRow) emptyRow.remove(); -->

		<!-- // 				if (!anyVisible) { -->
		<!-- // 					const tbody = document.querySelector('#memberTable tbody'); -->
		<!-- // 					const tr = document.createElement('tr'); -->
		<!-- // 					tr.classList.add('empty-row'); -->
		<!-- // 					tr.innerHTML = `<td colspan="4" class="text-center">조회된 데이터가 없습니다.</td>`; -->
		<!-- // 					tbody.appendChild(tr); -->
		<!-- // 				} -->
		<!-- // 			}); -->

		<!-- 			// 2 -->
		<!-- // 			function filterMembers() { -->
		<!-- // 		      const keyword = document.getElementById("searchInput").value.toLowerCase(); -->
		<!-- // 		      const rows = document.querySelectorAll(".member-row"); -->
		<!-- // 		      let visible = false; -->

		<!-- // 		      rows.forEach(row => { -->
		<!-- // 		        const name = row.querySelector(".member-name").textContent.toLowerCase(); -->
		<!-- // 		        if (name.includes(keyword)) { -->
		<!-- // 		          row.style.display = ""; -->
		<!-- // 		          visible = true; -->
		<!-- // 		        } else { -->
		<!-- // 		          row.style.display = "none"; -->
		<!-- // 		        } -->
		<!-- // 		      }); -->

		<!-- // 		      const emptyRow = document.querySelector("#emptyRow"); -->
		<!-- // 		      if (emptyRow) emptyRow.remove(); -->

		<!-- // 		      if (!visible) { -->
		<!-- // 		        const tbody = document.querySelector("tbody"); -->
		<!-- // 		        const tr = document.createElement("tr"); -->
		<!-- // 		        tr.id = "emptyRow"; -->
		<!-- // 		        tr.innerHTML = `<td colspan="4" class="text-center py-3">조회된 데이터가 없습니다.</td>`; -->
		<!-- // 		        tbody.appendChild(tr); -->
		<!-- // 		      } -->
		<!-- // 		    } -->

		<!-- 			// 3. -->
		<!-- // 			function filterMembers() { -->
		<!-- // 		      const keyword = document.getElementById("memberSearch").value.toLowerCase(); -->
		<!-- // 		      const rows = document.querySelectorAll(".member-row"); -->
		<!-- // 		      let found = false; -->

		<!-- // 		      rows.forEach(row => { -->
		<!-- // 		        const name = row.querySelector(".member-name").textContent.toLowerCase(); -->
		<!-- // 		        if (name.includes(keyword)) { -->
		<!-- // 		          row.style.display = ""; -->
		<!-- // 		          found = true; -->
		<!-- // 		        } else { -->
		<!-- // 		          row.style.display = "none"; -->
		<!-- // 		        } -->
		<!-- // 		      }); -->

		<!-- // 		      const emptyRow = document.querySelector("#emptyRow"); -->
		<!-- // 		      if (emptyRow) emptyRow.remove(); -->

		<!-- // 		      if (!found) { -->
		<!-- // 		        const tbody = document.querySelector("tbody"); -->
		<!-- // 		        const tr = document.createElement("tr"); -->
		<!-- // 		        tr.id = "emptyRow"; -->
		<!-- // 		        tr.innerHTML = `<td colspan="4" class="text-center py-3">조회된 데이터가 없습니다.</td>`; -->
		<!-- // 		        tbody.appendChild(tr); -->
		<!-- // 		      } -->
		<!-- // 		    } -->

		<!-- // 		    function goToDetail(memberNo) { -->
		<%-- 		      window.location.href = `<%= request.getContextPath() %>/memberlist/info.jsp?id=` + memberNo; --%>
		<!-- // 		    } -->
	</main>

	<%-- [Contents] ######################################################### --%>

	<jsp:include page="../../layout/script.jsp" />
	<jsp:include page="../../layout/footer.jsp" />
</body>
</html>