<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="../error/error404.jsp"  %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!-- <!DOCTYPE html>
<html >
  <head> -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/login-register.js" ></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
    rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
	<link href="${pageContext.request.contextPath}/css/login-register.css" rel="stylesheet" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_left.css"/>
	<link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <title>Smart Fixed Header</title>
    
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
  </head>

  <!-- <body> -->
  <c:if test="${result == 1 }">
	<script type="text/javascript">
		alert("비밀번호를 확인해주세요!");
		history.back(); /* 페이지를 앞서 있었던 페이지로 이동한다. */
	</script>
	</c:if>
	<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("아이디를 확인해주세요!");
		location.href="index2.jsp"; /* 아이디조차 존재하지 않으면 페이지를 인트로페이지로 이동한다. */
	</script>
	</c:if>

    <header class="main-header">
  <a href="${pageContext.request.contextPath}/recipemain.recipe">
  <img src="${pageContext.request.contextPath}/img/todaycook.png" width=150 style="margin-left:50px; margin-bottom:15px;">
  </a>
  <nav>
    <ul style="margin-right:50px;">
  	
  	<c:choose>
	<c:when test="${login ne null }"> <!-- login이 null이 아니라면 -->
	<c:if test="${login ne 'admin'}"> <!-- login이 admin이 아니라면 -->
	<div class="dropdown"> <!-- 아래로 내려지는 버튼(드롭다운버튼)  -->
    <a data-toggle="dropdown" style="text-decoration: none"> <!-- href 데코레이션을 없앤다 -->
    <img src="${pageContext.request.contextPath}/userimg/${picture}" onerror="this.src='${pageContext.request.contextPath}/userimg/NoImage.png'" style="cursor:pointer; width:40px; border-radius: 20px; margin-bottom:15px;">
    <!-- login한 유저의 프로필 사진을 표기하고, 만약 프로필사진이 없다면 default 이미지를 표시한다.  -->
    <span class="caret"></span></a>
    <ul class="dropdown-menu" style="line-height: 3em">
      <li><a href="${pageContext.request.contextPath}/mypage_index.do">${login}'s MyPage</a></li>
      <li><a href="#" onclick="return Logout()"><span class="glyphicon glyphicon-off"></span>Logout</a></li>
    </ul>
  	
	 
      <script type="text/javascript"> 
		function Logout(){ /* 로그아웃 버튼 클릭 시, */ 
		var check = confirm("로그아웃 하시겠습니까?"); //confirm창으로 yes를 클릭하면 true, no를 클릭하면 false가 된다.
		if(check){ //yes를 클릭하면
		location.href="logout.logout"; //servlet logout.logout으로 이동
		return true; 
		}else{ //no를 클릭하면
		return false; //onclick 실행 취소	
			}
		}
	</script>
 	 
    </c:if>  <!--  admin이 null이 아니라면 종료 -->
    <li>
    <a href="${pageContext.request.contextPath}/Recipe/RecipeWrite.jsp"> <!-- 레시피 작성페이지로 이동  -->
	<img src="${pageContext.request.contextPath}/img/ico_write.png" class="write" style="width:40px;border-radius: 20px; margin-bottom:15px;"></button>
	</a>
    </li>
    <li>
    <a href="${pageContext.request.contextPath}/noticeview.notice" > <!-- 공지사항페이지로 이동 -->
	<img src="${pageContext.request.contextPath}/img/read.png" class="read" style="width:40px;border-radius: 20px; margin-bottom:15px;"></button>
	</a>
    </li>
    <c:if test="${login eq 'admin'}"> <!-- login이 amdin과 동일하다면 -->
	<li>
	<a href="${pageContext.request.contextPath}/admin.join"> <!-- admin 페이지로 이동하면 버튼 추가  -->
	<img src="${pageContext.request.contextPath}/img/admin.png" class="admin" style="width:40px;border-radius: 20px; margin-bottom:15px;"></button>
	</a>
	</li>
	</div>
	</c:if>
	
	
	</c:when>
    <c:otherwise> <!-- 만약 login이 null이라면 -->
    <li> <!-- 유저버튼 클릭 시, 로그인창을 모달창으로 띄운다. -->
	<img src="${pageContext.request.contextPath}/img/ico_user.png" style="cursor:pointer; margin-bottom:15px;" onclick="openLoginModal();">
    </li>
    
    <li>
   	<a href="#" onclick="sessioncheck()" > <!-- 레시피글쓰기 버튼 클릭 시 -->
    <script>
    	function sessioncheck(){ //함수 sessioncheck를 실행한다.
    		alert("로그인이 필요한 페이지입니다. 메인 페이지로 이동합니다.");
    		location.href="index2.jsp"; //메인페이지로 이동한다.
    		<%-- var login = <%=session.getAttribute("login")%>; 
    		if(login==null){ //만약 
    			alert("로그인이 필요한 페이지입니다. 메인 페이지로 이동합니다.");
    			//지훈 수정
    			//history.back();
    			location.href="index2.jsp";
    		}//if
    		else{
    			location.href="../Recipe/RecipeWrite.jsp";
    		} --%>
    	}//function
    </script>
    <img src="${pageContext.request.contextPath}/img/ico_write.png" class="write" style="margin-bottom:15px;"></button>
    </a>
    </li>
    <li>
    <a href="${pageContext.request.contextPath}/noticeview.notice" >
	<img src="${pageContext.request.contextPath}/img/read.png" class="read" style="width:40px;border-radius: 20px;margin-bottom:15px;"></button>
	</a>
	</li>
	</c:otherwise>
	</c:choose>
    
    
    </ul>
  </nav>
	</header>
    	<!-- 헤더가 움직이는 스크립트가 담긴 index.js -->
        <script src="${pageContext.request.contextPath}/js/index.js"></script>
	<!-- Modal -->
  
  <!-- 메인페이지와 동일한 modal창. 로그인을 담당한다. -->
  <!-- ////////////////////////////// -->
  <div class="modal fade login" id="loginModal">
		      <div class="modal-dialog login animated">
    		      <div class="modal-content">
    		         <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">LOGIN</h4>
                    </div>
                    <div class="modal-body">  
                        <div class="box">
                             <div class="content">
                                <div class="social">
                                	<img src="${pageContext.request.contextPath}/img/todaycook.png" width=250>
                                </div>
                                <div class="division">
                                    <div class="line l"></div>
                                      <span>WITH</span>
                                    <div class="line r"></div>
                                </div>
                                <div class="error"></div>
                                <div class="form loginBox">
                                <div class="form-group">
                                    <form method="post" action="${pageContext.request.contextPath}/main.join" onsubmit="return loginAjax()" name="loginform">
                                    <input id="useremail" class="form-control" type="text" placeholder="Email" name="useremail">
                                    <input id="psw" class="form-control" type="password" placeholder="Password" name="psw">
                                    <input class="btn btn-default btn-login" type="submit" value="Login">
                                    </div>
                                    </form>
                                </div>
                             </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="forgot login-footer">
                        <p>아직 회원이 아니신가요? <a href="newjoin.join">회원가입하기</a></p>
                            <p>잊어버리셨나요? <a href="forgotPassword.join">비밀번호 찾기</a></p>
                        </div>
                    </div>        
    		      </div>
		      </div>
		  </div>
		  
  <!-- 각각의 write, read, admin버튼에 툴팁을 단다. 부트스트랩 -->
  <script type="text/javascript">
$('.write').tooltip({title: "레시피쓰기", trigger: "hover", placement: "bottom"}); 
$('.read').tooltip({title: "공지사항을 읽어주세요!", trigger: "hover", placement: "bottom"});
$('.admin').tooltip({title: "관리자 페이지!", trigger: "hover", placement: "bottom"}); 
  </script>
    
    
<!--   </body>
</html> -->
    