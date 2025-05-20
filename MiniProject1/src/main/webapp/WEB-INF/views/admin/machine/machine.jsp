<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>운동기구 현황 리스트</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/machine.css">
</head>
<body>
	<%-- [Contents] ######################################################### --%>
	
	<div class="container">
      <div class="category">
         <ul>
            <li><a href="">CARDIO</a></li>
            <li><a href="">CABLE</a></li>
            <li><a href="">PLATE</a></li>
            <li><a href="">ETC.</a></li>
         </ul>
      </div>
      <div class="machine-1">
         <div class="machine-name">
            <span>NEW TECH</span>
            <span>Chest Press</span>
         </div>
         <div class="check-list">
            <div class="check">
            	<span>점검 여부</span>
               <div class="day">
                  <label for="mon">월</label>
                  <input type="checkbox" id="mon">
               </div>
               <div class="day">
                  <label for="tuesday">화</label>
                  <input type="checkbox" id="tuesday">
               </div>
               <div class="day">
                  <label for="wednesday">수</label>
                  <input type="checkbox" id="wednesday">
               </div>
               <div class="day">
                  <label for="thursday">목</label>
                  <input type="checkbox" id="thursday">
               </div>
               <div class="day">
                  <label for="friday">금</label>
                  <input type="checkbox" id="friday">
               </div>
               <div class="day">
                  <label for="saturday">토</label>
                  <input type="checkbox" id="saturday">
               </div>
               <div class="day">
                  <label for="sunday">일</label>
                  <input type="checkbox" id="sunday">
               </div>
            </div>
            <div class="comment">
               <input type="text" name="" id="" placeholder="특이사항" size="100">
               <button type="submit">변경내용 저장</button>
            </div>
         </div>
      </div>
   </div>
	
	<%-- [Contents] ######################################################### --%>
</body>
</html>