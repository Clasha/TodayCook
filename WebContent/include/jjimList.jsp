<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="cdn.jsp" %>
<style type="text/css">
body {
	background-color: #fff;
	padding: 2px;
}
.jjim {
	background-color: #fff;
	
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
<br><br>
<c:choose>
<c:when test="${login ne null}"> <!-- login이 null 이 아니면 -->

	<div class="jjim">
	<div class="thumbnail">
		<table width="180px">
			<tr>
			<td>image</td>
			<td>타이틀</td>
			<!-- <td>삭제</td>	 -->
			</tr>			
			<c:forEach items="${jjimlist}" var="vo" > <!-- setAttribute로 받는 jjimlist를 변수 vo에 저장한 후 forEach문을 돌린다 -->
			<tr style="border-bottom: 1px solid red;">
				<td><img src="..${pageContext.request.contextPath}/recipeImg/${vo.getImage()}" style="width:50px;height:50px"></td>
					<!-- 레시피의 대표이미지 표기 -->
				
				<td><a href="datail.recipe?num=${vo.getNum()}" name="${vo.getNum()}" id="${vo.getNum()}">${vo.getTitle() }</a></td>
					<!-- 레시피의 넘버를 가지고 있는 레시피 타이틀 표기 -->
				<%-- <td><button onclick="jjimDelete(this, ${vo.getNum()})">삭제</button></td> --%>
			</tr>
			</c:forEach>
		</table>
		</div>
	</div>
</c:when>
<c:otherwise> <!--배너  -->
<a href="#">
<img src="..${pageContext.request.contextPath}/banner/3Ever.gif">
</a>
<br><br>
<a href="#">
<img src="..${pageContext.request.contextPath}/banner/Step.gif">
</a>
<br><br>
<a href="#">
<img src="..${pageContext.request.contextPath}/banner/pop.gif">
</a>
<br><br>
<a href="#">
<img src="..${pageContext.request.contextPath}/banner/dcp.gif">
</a>
</c:otherwise>	
</c:choose>
</body>
</html>