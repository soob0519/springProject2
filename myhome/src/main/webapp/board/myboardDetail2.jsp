<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>댓글게시판 상세화면</title>
	<link rel="stylesheet" href="../css/style.css" />
  	<script src="../js/jquery-3.7.1.js"></script>
	
</head>

<script>
$(function(){
	
	$("#btn_before").click(function(){
		if( ${dto.bseqid} > 0 ){
			location="/myboardDetail/${dto.bseqid}";
		} else {
			alert("이전 내용이 없습니다.");
		}
			
	});
	
	$("#btn_next").click(function(){
		if( ${dto.nseqid} > 0 ){
			location="/myboardDetail/${dto.nseqid}";
		} else {
			alert("다음 내용이 없습니다.");
		}
	});
	
	$("#btn_list").click(function(){
		location="/myboardList";
	});
	
	$("#btn_modify").click(function(){
		location="/myboardModify/${dto.seqid}";
	});
	
	$("#btn_delete").click(function(){
		location="/passWrite/${dto.seqid}";
	});
	
	$("#btn_submit").click(function(){
		let cmmt = $("#cmmt").val();
		let pass = $("#pass").val();
		let writer = $("#writer").val();
		
		if( cmmt == ""){
			alert("댓글을 입력해주세요.");
			cmmt.focus();
			return false;
		}
		if( pass == ""){
			alert("암호를 입력해주세요.");
			pass.focus();
			return false;
		}
		if( writer == ""){
			alert("이름을 입력해주세요.");
			writer.focus();
			return false;
		}
		
		let form = $("#frm2").serialize();
		$.ajax({
			type: "post",
			data: form,
			url: "/reboardInsert",
			dataType: "text",
			success:function(data){
				if(data == "ok"){
					alert("댓글 작성 완료");
					location.reload();
				} else {
					alert("댓글 작성 실패");
				}
			},
			error:function(){
				alert("오류 발생~~~~");
			}
		});
		
	});
	
});
</script>

<style>
.table1 td {
	text-align:left;
	padding-left:6px;
}
.div_content {
	width:98%;
	height:120px;
	overflow-x:auto;
	overflow-y:auto;
}
.div_comment {
	width:600px;
	margin-top:20px;
}

.textarea2 {
	width:98%;
}

.input2 {
 	width:20%;
 	font-size:12px;
 	padding:3px;
 }

</style>

<body>
 <div class="div_title">
    댓글게시판 상세화면
 </div>
 
<form id="frm" >

<table class="table1">
	<colgroup>
		<col width="20%" />
		<col width="*" />
	</colgroup>
	<tr>
		<th><label for="title">제목</label></th>
		<td>${dto.title }</td>
	</tr>
	<tr>
		<th><label for="writer">글쓴이</label></th>
		<td>${dto.writer }</td>
	</tr>
	<tr>
		<th><label for="content">내용</label></th>
		<td><div class="div_content">${dto.content }</div></td>
	</tr>	
	<tr>
		<th><label for="rdate">등록일</label></th>
		<td>${fn:substring(dto.rdate,0,10) }</td>
	</tr>
	<tr>
		<th><label for="udate">변경일</label></th>
		<td>${fn:substring(dto.udate,0,10) }</td>
	</tr>
		
</table>

 <div class="div_button_area">
 	<button type="button" id="btn_before">이전</button>
 	<button type="button" id="btn_next">다음</button>
 	&nbsp;
    <button type="button" id="btn_list">목록</button>
    <button type="button" id="btn_modify">수정</button>
    <button type="button" id="btn_delete">삭제</button>
 </div>
 
</form>

<div class="div_comment">
	<div style="margin-right:10px;" id="star_hap"></div>
	<div style="margin-right:10px;">
	<img src="/images/icon/star1.png">
	<img src="/images/icon/star1.png">
	<img src="/images/icon/star1.png">
	<img src="/images/icon/star2.png">
	<img src="/images/icon/star3.png">
	</div>
<form id="frm2">
<input type="hidden" id="pseqid" name="pseqid" value="${dto.seqid }">
	<div>
		<textarea id="cmmt" name="cmmt" class="textarea2"></textarea>
	</div>
	<div>
		<input type="password" id="pass" name="pass" class="input2" placeholder="암호 입력">
		<input type="text" id="writer" name="writer" class="input2 "placeholder="글쓴이 입력">
		<c:set var="j" value="6" />
		<select name="star">
			<c:forEach var="i" begin="1" end="5">
			<option value="${j-i }">${j-i }점</option>
			</c:forEach>
		</select>
		<button type="button" id="btn_submit">등록</button>
	</div>
</form>
</div>
	
	<div style="margin-top:10px;">
		<table class="table1">
			<colgroup>
				<col width="15%" />
				<col width="*" />
			</colgroup>
			
			<c:set var="hap" value="0"/>
			<c:set var="cnt" value="0"/>
			
			<c:forEach var="result" items="${list }">
			<tr>
				<td style="text-align:center;"></td>
				<td>
					<div>
						${result.CMMT }
					</div>
					<div style="text-align:right; margin-right:10px;">					
						${result.STAR }
					<c:forEach var="i" begin="1" end="${result.STAR }">
						<img src="/images/icon/star1.png">
					</c:forEach>
					<c:forEach var="i" begin="1" end="${5-result.STAR }">
						<img src="/images/icon/star3.png">
					</c:forEach>
						${result.WRITER } ${result.RDATE } [수정/삭제]
					</div>
				</td>
			</tr>
				<c:set var="hap" value="${hap + result.STAR }"/>
				<c:set var="cnt" value="${cnt+1 }"/>
			
			</c:forEach>
		</table>
		<fmt:formatNumber var="hap" value="${hap }" pattern="#.#"/>
		<fmt:formatNumber var="cnt" value="${cnt }" pattern="#.#"/>
		<fmt:formatNumber var="avg" value="${hap/cnt}" pattern="#.#"/>
		
		별점합계 : ${hap } 
		별점평균 : ${hap/cnt }
		으아앙 : ${avg }
	</div>
	
	<script>
		$(function(){
			$("#star_hap").html("<font color='red'>${hap }</font>");
			// ex) 2.5 => 금별 2개 반쪽 1개 은별 2개
		});
	</script>
	
</body>
</html>