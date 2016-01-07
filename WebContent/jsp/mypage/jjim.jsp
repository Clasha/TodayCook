<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/mypage.css">
</head>
<body>
	찜한 레시피 [${jjimCount }]<br>
	내 회원 번호 : ${ mnum } <br>
	<hr>
	<table border="1">
		<tr>
			<th>대표사진</th>
			<th>레시피제목</th>
			<th>찜한시간</th>
			<th>조회수</th>
			<th>추천수</th>
			<th>찜취소</th>
		</tr>
		
		<c:forEach var="recipe" items="${ recipes }">
			
			<tr>				
				<td class="thumb_img">
					<img src="${pageContext.request.contextPath}/recipeImg/${ recipe.image }" width="50" height="50">
				</td>
				<td>
					<a href="datail.recipe?num=${ recipe.num }">
						${ recipe.title }
					</a>
				</td>
				<td>${ recipe.writetime }</td>
				<td>${recipe.count }</td>
				<td>${recipe.recommend }</td>
				<td width="50">
					<a href="cancle_jjim.do?num=${recipe.num}" onclick="return confirm('정말로 찜 취소하시겠습니까?')">
						<img src="${pageContext.request.contextPath}/jsp/remove-icon.png" width="25" height="25">
					</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>