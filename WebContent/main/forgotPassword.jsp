<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="../error/error404.jsp"  %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/app.min.css" rel="stylesheet" />
<%@ include file="../include/cdn.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/password.css"/>
<link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
<!-- <style type="text/css">
body {
	color: #fff;
}
#videobcg { 
     position: absolute;
     top: 0px;
     left: 0px;
     min-width: 100%;
     min-height: 100%;
     width: auto;
     height: auto;
     z-index: -1000;
     overflow: hidden;
}
.loginContentWrap {
    width: 100%;
    position: relative;
    top: 50%;
    -webkit-transform: translateY(-50%);
    -ms-transform: translateY(-50%);
    transform: translateY(-50%);
    position: absolute;
}
.loginContentWrap form .btn {
    margin: 20px 0 0 0;
    font-size: 20px;
    font-size: 2rem;
    font-weight: bold;
    width: 100%;
    text-transform: uppercase;
    padding: 15px 0;
}
.btn.btn-orange {
    background: #fe5621;
    color: #fff;
}    
.container {
	width: 100%;
}
</style> -->
</head>
<body>
<video id="videobcg" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
     <source src="${pageContext.request.contextPath}/video/tsumons_move.mp4" type="video/mp4">
     <source src="${pageContext.request.contextPath}video/tsumons_move.mp4" type="video/webm">
</video>
<div class="loginContentWrap">
		<div class="container">
			<div class="row">
			<!-- 부트스트랩. 가로 6칸, 왼쪽에서 3칸 띈다. xs : cellphone 크기일 때, lg: 화면이 매우 클 때   -->
				<div class="col-xs-12 col-sm-6 col-sm-offset-3 col-lg-4 col-lg-offset-4">
					<div class="text-center"> <!-- text 위치가 center인 div -->
						<h1 class="pageTitle">비밀번호를 <br>새로 만드세요!</h1>
						<p>등록한 이메일을 적어주신 후 확인해 주세요. <br>이메일이 보내지는 즉시 기존 비밀번호는 소멸됩니다.</p>
					</div>
					<form data-parsley-validate="" novalidate="" name="password" id="password">
						<div class="form-group">
							<input type="email" class="form-control simple-form-control" id="passwordEmail" name="passwordEmail" placeholder="Email" required="" data-parsley-error-message="Wrong e-mail format" data-parsley-id="4">
						</div>
						<div class="form-group">
							<span id="emailCheck"></span>
						</div>
						<div class="form-group">
							<button type="button" class="btn btn-orange" id="passwordbtn">Send new password</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>	
	
	<script type="text/javascript">
	$('#passwordbtn').click(function(){
		var check = $('input#passwordEmail').val();
		if(check=="") {alert('이메일을 입력해주세요!');}
		//이메일 형식 확인용
		var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		if(regex.test(check) === false) {  //이메일형식과 맞지 않으면
		    alert("잘못된 이메일 형식입니다.");  
		    return false;
		} 
		else{ //이메일 형식과 동일하면
			$.ajax({ //ajax 실행
				type: "POST", //타입은 post
				url: "../TodayCook_Type1/main/emailconfirm.jsp", //이메일 체크 페이지
				data : {"useremail" : check}, //parameter name : useremail, value: 유저가 작성한 email
				success: function(data) { //이메일 유무 체크 여부 후 값 반환
					if(jQuery.trim(data)=='YES'){
						document.getElementById("emailCheck").innerHTML="<font color='white'>적합한 이메일입니다!</font>";
						
						$.ajax({ //적합한 이메일이라면
							Type: 'POST', //타입은 post
								url : "${pageContext.request.contextPath}/main/forgotPasswordinsert.jsp", //이메일 발송페이지로
								data: $('#password').serialize(),//폼 전송
								success: function(data){ //이메일 발송 시
									alert('이메일이 발송되었습니다.');
												
									$('#passwordEmail').each(function(){
									$(this).val(""); 
									});//이메일칸 내용 삭제 기능
									
									//메일 전송 후 메인페이지로 이동
									location.href="${pageContext.request.contextPath}/index2.jsp";
										
								}//success
							});//ajax
							
					}else{
						alert("경고! 없는 이메일입니다!");
						document.getElementById("emailCheck").innerHTML="<font color='red'>등록되지 않은 이메일입니다!</font>";
				}
			}//success
			
		}) //ajax
		}
	});//click
							
						
	</script>
</body>
</html>