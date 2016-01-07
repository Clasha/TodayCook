<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html> 
<html>
<head>
	<title>내가 쓴 레시피</title>
	<link rel="stylesheet" href="css/mypage.css">
</head>
<body>

<%-- 	내가 쓴 레시피 [${recipeCount}]<br>
	내 회원 번호 : ${ mnum } <br> --%>
	<hr>
		
	<div id="order">
		<a href="mypage_recipe.do?order=seq">최근순</a>&nbsp;
		<a href="mypage_recipe.do?order=hit">조회순</a>&nbsp;
		<a href="mypage_recipe.do?order=like">좋아요순</a>&nbsp;<br>
	</div>
	<table border="1">
		<tr>
			<th>대표<br>사진</th>
			<th>레시피제목</th>
			<th>등록시간</th>
			<th>조회수</th>
			<th>추천수</th>
			<!-- <th>신고수</th> -->
			<th>삭제</th>
			<th>수정</th>
		</tr>
		<c:forEach var="recipe" items="${ recipes }">
			
			<tr>				
				<td class="thumb_img">
					<c:if test="${picture==null}">
						<img src="${pageContext.request.contextPath}/recipeImg/NoImage.png" width="50" height="50">
					</c:if>
					<img src="${pageContext.request.contextPath}/recipeImg/${ recipe.image }" width="50" height="50">
				</td>
				<td><a href="datail.recipe?num=${ recipe.num }">${ recipe.title }</a></td>
				<td width="200">${ recipe.writetime }</td>
				<td>${recipe.count }</td>
				<td>${recipe.recommend }</td>
				<td width="50">
					<a href="del_my_recipe.do?num=${recipe.num}" onclick="return confirm('정말로 삭제하시겠습니까?')">
						<img src="${pageContext.request.contextPath}/jsp/remove-icon.png" width="25" height="25">
					</a>
				<td>
					<a href="Update.recipe?num=${recipe.num}">
						<img src="${pageContext.request.contextPath}/jsp/update-icon.png" width="25" height="25">
					</a>
				</td>
			</td>
			</tr>
			
		</c:forEach>
	</table>
	
</body>
</html>