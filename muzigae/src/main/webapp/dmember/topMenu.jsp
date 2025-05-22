<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <% 
 String session_userid = (String)session.getAttribute("SESSION_USERID"); 
 %>
  
 <div class="div_menu">
   <ul>
   	<li><a href="/nboardList">게시판</a></li>
    <li><a href="/myboardList">댓글게시판</a></li>
    <li><a href="/dataList">자료게시판</a></li>
 <%
 if(   session_userid == null 
    || session_userid.equals("")
    || session_userid.equals("null") ) 
 {
 %>
    <li><a href="/loginWrite">회원등록</a></li>
    <li><a href="/memberWrite">로그인</a></li>
<%
 } else {
%>
    <li><a href="/memberModify">회원정보</a></li>
    <li><a href="javascript:fn_logout();">로그아웃</a></li>
<%
 }
%>
   </ul>
 </div>
 <script>
 function fn_logout() { 
	  $.ajax({
		  url  : "/logout",
		  type : "post",
		  data : "",
		  dataType:"text",
		  success :function(data){
			  alert("로그아웃 되었습니다.");
			  location = "/dataList";
		  },
		  error:function(){ }
	  }); 
  }
 </script>
 