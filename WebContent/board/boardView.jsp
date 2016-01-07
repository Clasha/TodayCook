<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 상세보기</title>
<!-- 게시글 상세보기 페이지  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="../TodayCook_Type1/admin/simple-sidebar.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/TodayCook_Type1/board/css/board.css">
<script type="text/javascript" src="script/board.js"></script>
<script>
$( document ).ready(function() {
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
}); 
</script>
</head>
<body>
	<div id="wrapper" class="">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a data-toggle="tab" href="#start">
                        <img src="${pageContext.request.contextPath}/img/todaycook.png" style="width:150px; height:65px;">
                    </a>
                </li>
                <li>
                    <a href="recipemain.recipe">게시판 나가기</a>
                </li>
                <li>
                    <a href="logout.logout">관리자 로그아웃</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->
        
         <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                	<!-- <a href="#" class="btn btn-default" id="menu-toggle">Toggle Menu</a> -->
                    <div class="col-lg-12"> 
       				<br><br><br><br>
       <div class="tab-content">             
     <div id="boarddetail" class="tab-pane fade in active">   
	<div id="wrap" align="right">
		
		<table>
			<tr>
				<th>작성자</th>
				<td>${board.nick}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><fmt:formatDate value="${board.reg_date}" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">${board.subject }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
				<textarea cols="60" rows="10" readonly>${board.content }</textarea>
				</td>
			</tr>
		</table>
		<br> <input type="button" value="게시글 수정" 
			onclick="location.href='BoardServlet?command=board_update_form&num=${board.num}'">
		<input type="button" value="게시글 삭제"
			onclick="location.href='BoardServlet?command=board_delete&num=${board.num}'">
		<input type="button" value="게시글 리스트"
			onclick="location.href='BoardServlet?command=board_list'"> 
		<input type="button" value="게시글 등록"
			onclick="location.href='BoardServlet?command=board_write_form'">
	</div>

	<br>
	
	</div>
	<div id="memberlist" class="tab-pane fade">
     <%@include file="../admin/Memberlist.jsp" %>
    </div>
	
	
	</div></div></div></div></div></div>

</body>
</html>