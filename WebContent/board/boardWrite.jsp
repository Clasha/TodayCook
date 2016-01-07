<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 등록 화면</title>
<!-- 게시글 등록 페이지 -->
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
                    <a data-toggle="tab" href="#boardlist">공지사항 게시판</a>
                </li>
                <li>
                    <a data-toggle="tab" href="#boardwrite">공지사항 글쓰기</a>
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
	<div class="tab-content">
	<div id="boardwrite" class="tab-pane fade in active">
	<div id="wrap" align="center">
		<h1>게시글 등록</h1>
		<form name="frm" method="post" action="BoardServlet">
			<input type="hidden" name="command" value="board_write">
			<input type="hidden" name="mnum" value="${sessionScope.mnum }">
			<table>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="nick" value="${sessionScope.login }" readonly></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" size="70" name="subject"> * 필수</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="70" rows="15" name="content"></textarea></td>
				</tr>
			</table>
			<br>
			<br> <input type="submit" value="등록"
				onclick="return boardCheck()'"> <input type="reset"
				value="다시 작성"> <input type="button" value="목록"
				onclick="location.href='BoardServlet?command=board_list'">
		</form>
	</div>
	</div>
	
	
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>