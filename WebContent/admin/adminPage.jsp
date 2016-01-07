<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="../TodayCook_Type1/admin/simple-sidebar.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
<!-- <script>
$( document ).ready(function() {
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
}); 
</script> -->
</head>
<body>
<c:if test="${result == 1 }">
	<script type="text/javascript">
		alert("비밀번호를 확인해주세요!");
		history.back();
	</script>
</c:if>
<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("아이디를 확인해주세요!");
		location.href="index2.jsp";
	</script>
</c:if>
	<div id="wrapper" class="">

        <!-- Sidebar -->
        <!-- 부트스트랩에서 제공하는 sidebar로서, 왼쪽의 버튼을 클릭하면 해당하는 아이디에 맞는 내용이 불러와진다. -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a data-toggle="tab" href="#start">
                        <img src="${pageContext.request.contextPath}/img/todaycook.png" style="width:150px; height:65px;">
                    </a>
                </li>
                <li>
                    <a data-toggle="tab" href="#memberlist">회원 리스트</a>
                    <!-- memberlist를 불러온다. -->
                    
                </li>
                <li>
                    <a data-toggle="tab" href="#recipelist">레시피 현황</a>
                    <!-- recipelist를 불러온다 -->
                </li>
                <li>
                    <a data-toggle="tab" href="#replelist">레시피 댓글 현황</a>
                    <!-- replelist를 불러온다 -->
                </li>
                
                <li>
                    <a data-toggle="tab" href="#boardlist">공지사항 게시판</a>
                    <!-- boardlist을 불러온다 -->
                </li>
                <li>
                    <a href="recipeadmin.recipe">검색페이지로 이동</a>
                    <!-- 검색페이지, 즉, 유져들이 사용하는 레시피 메인페이지로 이동한다 -->
                </li>
                
                <li>
                    <a href="logout.logout">관리자 로그아웃</a>
                </li>
            </ul>
        </div>

		

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                	<!-- <a href="#" class="btn btn-default" id="menu-toggle">
                	[menu]
                	</a> -->
                    <div class="col-lg-12">
                         <div class="tab-content">
    						<div id="start" class="tab-pane fade in active">
    						<!-- admin페이지에 진입 시 작동될 첫 페이지에 나타날 내용 -->
     						 관리자 테스트 페이지입니다.<br>
     						 <a href="index2.jsp">메인으로</a>
    						</div>
    						
    						<div id="memberlist" class="tab-pane fade">
      						<%@include file="Memberlist.jsp" %>
    						</div>
                   		 	
                   		 	<div id="boardlist" class="tab-pane fade">
      						<%@include file="../board/boardList.jsp" %>
    						</div>
    						
    						<div id="recipelist" class="tab-pane fade">
      						<%@include file="Recipelist.jsp" %>
    						</div>
    						
    						<div id="replelist" class="tab-pane fade">
      						<%@include file="Replelist.jsp" %>
    						</div>
                   		 	
                   		 
                   		 </div>
                	</div>
            	</div>
        	</div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->
    </div>
</body>
</html>