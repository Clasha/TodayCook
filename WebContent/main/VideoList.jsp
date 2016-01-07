<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
	<title>쉐프 비디오</title>

</head>
<body>
<header style="height:150px;">
<%@include file="../include/headerOrigin.jsp" %>
</header>
<div style="margin:auto;height:500px;"> 
<iframe src="${pageContext.request.contextPath}/include/VideoList.jsp" width="100%" height="500px" frameborder='0'>
</iframe>
</div> 
<footer style="font-size:14px;">
<%@include file="../include/footer.jsp" %>
</footer>


</body>
</html>