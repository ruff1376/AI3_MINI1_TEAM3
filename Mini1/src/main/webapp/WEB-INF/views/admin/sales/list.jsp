<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/layout/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>매출 조회</title>
	<jsp:include page="/WEB-INF/views/layout/link.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<%-- [Contents] ######################################################### --%>
<body class="d-flex flex-column min-vh-100">
	<div class="flex-grow-1 container mt-5">
	    <h2 class="mb-4 text-center">매출 리스트</h2>
	    <div class="mb-3 d-flex justify-content-between">
	        <a href="../sales" class="btn btn-outline-success">차트로 보기</a>
	        <a href="create" class="btn btn-outline-primary">매출 등록</a>
	    </div>
	    
<div class="accordion mb-5" id="trainerAccordion">


  <c:forEach var="trainer" items="${ trainerList }">
    <div class="accordion-item">
	  <h2 class="accordion-header" id="heading${ trainer.trainerId }">
	    <button class="accordion-button collapsed" type="button"
	            data-bs-toggle="collapse"
	            data-bs-target="#collapse${ trainer.trainerId }"
	            aria-expanded="false" aria-controls="collapse${ trainer.trainerId }">
	      트레이너 ${ trainer.name }
	    </button>
	  </h2>
	  <div id="collapse${ trainer.trainerId }" class="accordion-collapse collapse"
	       data-bs-parent="#trainerAccordion">
	    <div class="accordion-body">
	    
	    	<table class="table table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>날짜</th>
                        <th>금액</th>
                        <th>비고</th>
                    </tr>
                </thead>
                <tbody>
                	<c:if test="${ trainer.salesList == null || trainer.salesList.isEmpty() }">
                		<tr>
                			<td colspan="3" align="center"> 조회된 데이터가 없습니다.</td>
                		</tr>
                	</c:if>
                    <c:forEach var="sale" items="${trainer.salesList}">
                        <tr onclick="location.href='edit?id=${sale.salesId}'">
                           	<td>
					        	<fmt:formatDate value="${sale.date}" pattern="yyyy-MM-dd" />
					       	</td>
                            <td>${sale.amount}</td>
                            <td>${sale.note}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
	    
	      
	    </div>
	  </div>
	</div>

  </c:forEach>
  
</div>


			
			
			
			
	</div>	
<%-- [Contents] ######################################################### --%>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
<jsp:include page="/WEB-INF/views/layout/script.jsp" />
	

</body>
</html>