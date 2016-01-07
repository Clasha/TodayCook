<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 레시피 목록을 불러온다 -->
</head>
<body>
<table border ="1px" width="500">
<tr>
<td align ="center">레시피번호</td>
<td align ="center">레시피제목</td>
<td align ="center">레시피작성날짜</td>
<td align ="center">레시피작성자</td>
<td align ="center">레시피작성자이메일</td>
<td align ="center">레시피신고횟수</td>
<td align ="center">레시피신고날짜</td>
</tr>
<c:forEach items="${RecipeFind}" var="mto"> <!-- RecipeFind에 전달된 파라미터값을 변수 mto에 저장한 후 for문을 실행한다 -->
<tr>
<td align="center">${mto.getRecipenum()}</td> <!-- 레시피 번호 -->
<td align="center">
<a href="datail.recipe?num=${mto.getRecipenum()}"> <!-- 레시피번호를 파라미터로 가지고, 제목 클릭 시 해당 레시피 확인 가능 -->
${mto.getRecipeTitle()}<!-- 레시피 제목 -->
</a>
</td>
<td align="center"><fmt:formatDate value="${mto.getRecipeWriteTime()}" /></td> <!-- 레시피가 작성된 시간 -->
<td align="center">${mto.getMemberNick()}</td> <!-- 레시피 작성자 닉네임 -->
<td align="center">${mto.getMemberEmail()}</td> <!-- 레시피 작성자 이메일 -->
<td align="center">${mto.getWarningCount()}</td> <!-- 레시피 신고 횟수 -->
<td align="center"><fmt:formatDate value="${mto.getWarningTime()}" /></td> <!-- 레시피 신고 시간 -->
<td align="center">
<c:if test="${mto.getMemberNick() ne 'admin' }"> <!-- 레시피 작성자가 admin이 아니라면 -->
<button type="button" class="btn btn-default" onclick="RecipeDelete(this, ${mto.getRecipenum()})">레시피 삭제</button>
<!-- 레시피 번호를 가진 함수채로 삭제버튼 생성 -->
</c:if> 
</td>
</tr>
</c:forEach>
</table>

</body>
</html>