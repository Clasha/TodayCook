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
<!-- 멤버현황을 표기한다. -->
</head>
<body>

<br>
<h1></h1>
<table border ="1px" width="500">
<tr>
<td align ="center">MNUM</td>
<td align ="center">Email</td>
<td align ="center">password</td>
<td align ="center">닉네임</td>
<td align ="center">회원 삭제</td>
</tr>
<c:forEach items="${adminlist}" var="mto">
<tr>
<td align="center">${mto.getNum()}</td> <!-- 멤버 번호 -->
<td align="center">${mto.getEmail()}</td> <!-- 멤버 이메일(아이디)  -->
<td align="center">${mto.getPwd()}</td> <!-- 멤버 비밀번호 -->
<td align="center">${mto.getNick()}</td> <!-- 멤버 닉네임 -->
<td align="center">
<c:if test="${mto.getNick() ne 'admin' }"> <!-- 멤버 닉네임이 admin이 아니라면 -->
<a href="memberDel.admin?email=${mto.getEmail() }" > <!-- 멤버 이메일을 파라미터로 전달 -->
<button type="button" class="btn btn-default" onclick="return delCheck()">회원강제탈퇴</button> <!-- 탈퇴버튼 생성 -->
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
			var del = confirm("탈퇴 시키겠습니까?");
			if(del){
				alert("탈퇴 및 삭제 합니다");
				return true;
			}else{
				alert("탈퇴 및 삭제 취소합니다");
				return false;
			}
		}
		/* function boardgo(){
			location.replace("http://localhost:8080/TodayCook_Type1/BoardServlet?command=board_list");
		} */
</script>
</body>
</html>