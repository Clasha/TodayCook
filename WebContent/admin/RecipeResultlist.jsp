<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 레시피 재검색 후 결과물이 담기는 페이지 -->
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
<c:forEach items="${RecipeFind}" var="mto"> <!-- RecipeFind 가 변수 mto에 저장된다. -->
<tr>
<td align="center">${mto.getRecipenum()}</td> <!-- 레시피 번호 -->
<td align="center">
<a href="datail.recipe?num=${mto.getRecipenum()}"> <!-- 레시피 제목 클릭 시 상세 페이지 확인용 -->
${mto.getRecipeTitle()} <!-- 레시피 제목  -->
</a>
</td>
<td align="center"><fmt:formatDate value="${mto.getRecipeWriteTime()}" /></td> <!-- 레시피 작성시간 -->
<td align="center">${mto.getMemberNick()}</td> <!-- 레시피 작성자 닉네임 -->
<td align="center">${mto.getMemberEmail()}</td> <!-- 레시피 작성자 이메일 -->
<td align="center">${mto.getWarningCount()}</td> <!-- 레시피 신고 횟수 -->
<td align="center"><fmt:formatDate value="${mto.getWarningTime()}" /></td> <!-- 레시피 신고 날짜  -->
</tr>
</c:forEach>
</table>

</body>
</html>