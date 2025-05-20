<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/common.jsp" %>
<nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="<%= root %>/">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="<%= root %>/board/list">Board</a>
        </li>
      </ul>
       <ul class="navbar-nav d-flex align-items-center px-3">
       
       	<%
			if( loginId == null || loginId.equals("") ) {
		%>
       	<!-- 비로그인 시 -->
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="<%= root %>/login.jsp">로그인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="<%= root %>/join.jsp">회원가입</a>
        </li>
        <li class="nav-item">
        </li>
        
        <%
			}
        	else {
        %>
        <!-- 로그인 시 -->
        <li class="nav-item">
        <div class="dropdown">
	      <a href="#" class="d-flex align-items-center link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
	        <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
<%-- 	        <strong><%= loginId %></strong> --%>
	      </a>
	      <ul class="dropdown-menu dropdown-menu-end text-small shadow">
	        <li><a class="dropdown-item" href="<%= root %>/users/my">마이 페이지</a></li>
	        <li><a class="dropdown-item" href="<%= root %>/users/update">회원정보 수정</a></li>
	        <li><hr class="dropdown-divider"></li>
	        <li><a class="dropdown-item" href="<%= root %>/users/logout">로그아웃</a></li>
	      </ul>
	    </div>
        </li>
        <%
        	}
        %>
      </ul>
    </div>
  </div>
</nav>