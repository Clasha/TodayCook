<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/mypage.css">
</head>
<body>
	<hr>
	<table border="1">
		<tr>
			<th>사진</th>
			<th>댓글내용</th>
			<th>등록날짜</th>
			<th>추천수</th>
			<th>신고수</th>
			<th>삭제</th>
		</tr>
		현재시간: ${ sysdate } <br>
		
		<c:forEach var="comment" items="${ comments }">
			
			<tr>			
				<td class="thumb_img">
					<c:if test="${picture==null}">
						<img src="${pageContext.request.contextPath}/userimg/NoImage.png" width="50" height="50">
					</c:if>
					<c:if test="${picture!=null }">			
				 		<img src="${pageContext.request.contextPath}/userimg/${ picture }" width="50" height="50">
				 	</c:if>	
				</td>	
				<td width="280">
					<a href="datail.recipe?num=${ comment.num }">
						${ comment.ccomment}</td>
					</a>
				<td>${ comment.cdate }</td>
				<td>${ comment.crecommend }</td>
				<td>${ comment.warning }</td>
				<td>
					<a href="del_my_comment.do?cnum=${comment.cnum}" onclick="return confirm('정말로 삭제하시겠습니까?')">
						<img src="${pageContext.request.contextPath}/jsp/remove-icon.png" width="25" height="25">
					</a>
				</td>
			</tr>

		</c:forEach>
	</table>
</body>
</html>