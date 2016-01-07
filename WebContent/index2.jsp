<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error/error404.jsp"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TodayCook</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="include/cdn.jsp" %>
<!-- <link rel="stylesheet" type="text/css" href="css/index.css"> -->
<!-- <link href="css/login-register.css" rel="stylesheet" /> -->
<script type="text/javascript" src="js/login-register.js" ></script>
<script type="text/javascript" src="js/index.js"></script>
<link rel="stylesheet" type="text/css" href="css/index2.css">
<link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">

</head>
<body>
<video id="videobcg" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
     <source src="video/beak.mp4" type="video/mp4">
     <source src="video/beak.mp4" type="video/webm">
</video>
<!-- 배경 동영상 설정. 자동실행되며, 음소거 설정 및 루프 -->

<!-- congratuation이 null이 아니라면 -->
<c:if test="${congratuation ne null}">
	<script type="text/javascript">
		alert("가입을 축하합니다! 다시 로그인해주세요 ^^");
	</script>
</c:if>
<c:if test="${result == 1 }">
	<script type="text/javascript">
		alert("비밀번호를 확인해주세요!");
	</script>
</c:if>
<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("아이디를 확인해주세요!");
	</script>
</c:if>

<center><br><br><br>
<div class="container">

	<!-- login이 null이 아니라면 -->
	<table>
	<c:choose>
	<c:when test="${login ne null }">
		<tr>
			<td colspan="2">
			<a href="#"><img src="img/todaycook.png" width=400>
			</td>
		</tr>
		<tr style="text-align:center">
			<td colspan="2">
			<font color="#fff"><h3>요리 레시피를 검색하세요!</h3></font>
			</td>
		</tr>
		<tr style="text-align:center">
			<td>
			<a href="recipemain.recipe">
			<button type="button" class="btn btn-primary btn-lg">
			<!-- font awesome에 있는 폰트 -->
			<span class="fa fa-fw fa-user-plus"></span>
			${login }님의<br>
			시작하기
			</button></a>
			</td>
			<td>
			<a href="logout.logout">
			<button type="button" class="btn btn-primary btn-lg">
			<!-- 부트스트랩에 있는 폰트 -->
			<span class="glyphicon glyphicon-off"></span>
			${login }님의<br>
			Logout
			</button></a>
			</td>
		</tr>
	</c:when>
	<c:otherwise> <!-- login이 null이라면 -->
		<tr>
			<td colspan="2">
			<a href="#"><img src="img/todaycook.png" width=400>
			</td>
		</tr>
		<tr style="text-align:center">
			<td colspan="2">
			<font color="#fff"><h3>요리 레시피를 검색하세요!</h3></font>
			</td>
		</tr>
		<tr style="text-align:center">
			<td>
			<button type="button" class="btn btn-primary btn-lg" onclick="openLoginModal();">
			<span class="fa fa-fw fa-user-plus"></span>
			로그인하고<br>
			시작하기
			</button>
			</td>
			<td>
			<a href="recipemain.recipe">
			<button type="button" class="btn btn-primary btn-lg" >
			<span class="glyphicon glyphicon-search"></span>
			비회원으로<br> 
			시작하기
			</button></a>
			</td>
		</tr>
	</c:otherwise>
	</c:choose>
	</table>

</div>

<!-- Modal --> <!-- 부트스트랩에서 제공하는 모달창 -->
  
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
                                	<img src="img/todaycook.png" width=250>
                                </div>
                                <div class="division">
                                    <div class="line l"></div>
                                      <span>WITH</span>
                                    <div class="line r"></div>
                                </div>
                                <div class="error"></div> <!-- 에러 발생시 생겨날 div -->
                                <div class="form loginBox">
                                <div class="form-group">
                                    <form method="post" action="login.join" onsubmit="return loginAjax()" name="loginform">
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
</center>
</body>
</html>