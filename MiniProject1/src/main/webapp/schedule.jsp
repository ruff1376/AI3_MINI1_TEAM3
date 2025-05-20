<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<%
  String selectedDate = request.getParameter("date");
  if (selectedDate == null || selectedDate.trim().isEmpty()) {
    selectedDate = "";
  }

  List<String> jsonList = new ArrayList<>();

  if (!selectedDate.isEmpty()) {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/health", "aloha", "123456");

      String sql = "SELECT trainer_name, time_range, memo, is_checked FROM trainer_schedule WHERE schedule_date = ?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, selectedDate);
      ResultSet rs = pstmt.executeQuery();

      while (rs.next()) {
        String trainer = rs.getString("trainer_name");
        String time = rs.getString("time_range");
        String memo = rs.getString("memo") == null ? "" : rs.getString("memo").replace("\"", "\\\"");
        boolean checked = rs.getBoolean("is_checked");

        String json = String.format(
          "{\"trainer\":\"%s\", \"time\":\"%s\", \"memo\":\"%s\", \"checked\":%s}",
          trainer, time, memo, checked
        );
        jsonList.add(json);
      }

      rs.close();
      pstmt.close();
      conn.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  String jsonSavedData = "[" + String.join(",", jsonList) + "]";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>트레이너 시간표 - 최종본</title>
  <jsp:include page="/WEB-INF/views/layout/link.jsp" />
</head>
<body>

	<jsp:include page="/WEB-INF/views/layout/header.jsp" />

	<main>
		<div class="container-fluid d-flex gap-3 px-4 mt-4">
	  	<!-- 달력 영역 -->
	  		<div class="calendar border rounded bg-light p-3" id="calendar" style="width: 630px; height: 1000px;">
	    <!-- 달력 콘텐츠는 JS로 생성 -->
	 	 </div>
	  	<!-- 스케줄 영역 -->
	  		<div class="schedule flex-grow-1">
	   			<h3 id="selected-date-title" class="mb-3 d-flex justify-content-center" >
		     	<%= selectedDate.isEmpty() ? "날짜를 선택하세요" : selectedDate + " 예약 스케줄" %></h3>
		    	<form action="ScheduleSaveServlet" method="post">
		      		<input type="hidden" name="date" id="selected-date-value" value="<%= selectedDate %>">
		     		 <!-- 버튼 영역 -->
		     		 <div class="d-flex justify-content-end gap-3 mb-2">
		        	<button type="submit" class="btn btn-outline-success px-4">예약</button></div>
		
		      		<!-- 테이블 -->
		     		 <div class="table-responsive">
		       			 <table class="table table-bordered text-center align-middle">
		          			<thead class="table-light">
					            <tr>
					              <th style="width: 110px;">시간</th>
					              <th>김계란</th>
					              <th>손흥민</th>
					              <th>이강인</th>
					              <th>기성용</th>
					              <th>박지성</th>
					            </tr>
		          			</thead>
				          <tbody id="schedule-body">
				            <!-- 자바스크립트로 시간대별 셀 생성 -->
				          </tbody>
		        		</table>
		      		</div>
		    	</form>
		  	</div>
		</div>
	  	<div id="preview-box" style="display:none">
	    	<pre id="preview-content"></pre>
	  	</div>
	</main>
  <jsp:include page="/WEB-INF/views/layout/footer.jsp" />	
  <script>
    const initialSelectedDate = "<%= selectedDate %>";
    const savedEntries = <%= jsonSavedData %>;
  </script>
  <script src="static/js/schedule.js"></script>
</body>
</html>
