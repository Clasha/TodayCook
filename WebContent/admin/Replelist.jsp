<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
  .btn-default {
      box-shadow: 1px 2px 5px #000000;   
  }
  </style>
<title>Insert title here</title>
<!-- 댓글 목록 -->

</head>
<body>

<br>
<h1></h1>
<table border ="1px" width="500">
<tr>
<td align ="center">댓글번호</td>
<td align ="center">댓글내용</td>
<td align ="center">댓글작성자</td>
<td align ="center">작성자번호</td>
<td align ="center">작성자닉네임</td>
<td align ="center">추천횟수</td>
<td align ="center">추천자번호</td>
<td align ="center">신고횟수</td>
<td align ="center">신고자번호</td>

</tr>
<c:forEach items="${RepleDetail}" var="mto"> <!-- admin 페이지로 진입시 전달된 repleDetail을 변수 mto에 저장한다  -->
<tr>
<td align="center">${mto.getCnum()}</td> <!-- 댓글 번호 -->
<td align="center">${mto.getCcomment()}</td> <!-- 댓글 내용  -->
<td align="center">${mto.getEmail()}</td> <!--댓글 작성자 이메일(아이디)  -->
<td align="center">${mto.getCmnum()}</td> <!-- 댓글 작성자 번호 -->
<td align="center">${mto.getNick()}</td> <!-- 댓글 작성자 닉네임 -->
<td align="center">${mto.getCrecommend()}</td> <!-- 댓글 추천횐수  -->
<td align="center">${mto.getRmnum()}</td> <!-- 댓글 추천자 번호 -->
<td align="center">${mto.getCwarning()}</td> <!-- 댓글 신고횟수 -->
<td align="center">${mto.getWmnum()}</td> <!-- 댓글 신고자 번호 -->
<td align="center">
<c:if test="${mto.getNick() ne 'admin' }"> <!-- 댓글 닉네임이 admin이 아니라면 -->
<a href="RepleDel.admin?cnum=${mto.getCnum() }" > <!-- 댓글 삭제 페이지에 레시피 번호를 파라미터로 넘긴다 -->
<button type="button" class="btn btn-default" onclick="return delCheck()">댓글삭제</button> <!-- 댓글 삭제 버튼 생성 -->
</a>
</c:if> 
</td>
</tr>
</c:forEach>
</table>

<!-- <input type="button" value="게시판으로 이동" onclick="boardgo()">  -->

<script type="text/javascript">
		
		function delCheck(){
			
			//window.open("delCinFirm.admin?email=", "비밀번호확인창");
			var del = confirm("삭제하시겠습니까?");
			if(del){
				alert("삭제 합니다");
				return true;
			}else{
				alert("삭제 취소합니다");
				return false;
			}
		}
</script>
</body>
</html>