<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<script>
	$(document).ready(function(){
	    $("#confirm_email").click(function(){
	    	var mnum = $('input#mnum').val();
	    	var email = $('input#email').val();
	    	console.log(mnum); console.log(email); 
	    	$.ajax({
	            url:'jsp/updateInfo/confirmEmail.jsp',
	            type:'post',
	            data: {"mnum": mnum, "email":email },
	            success : function(data) {
	                alert(data);
	            }
	        }); //ajax
	    });// click
	});// ready
	
	function infoSubmit() {
		if( document.fm_info.nick.value == "") {
			alert("닉네임을 입력하세요.");
			document.fm_info.nick.focus();
		}
	}
	function pwdSubmit() {
		if ( document.fm_pw.now_pwd.value == "" ) {
			alert("비밀번호를 입력하세요.");
			document.fm_pw.now_pwd.focus();
		} else if ( document.fm_pw.new_pwd.value == "" ) {
			alert("새 비밀번호를 입력하세요.");
			document.fm_pw.new_pwd.focus();
		} else if ( document.fm_pw.conf_pwd.value == "" ) {
			alert("새 비밀번호 확인을 입력하세요.");
			//document.getElementById("lb_conf_pw").style.display = "block";
			document.fm_pw.conf_pwd.focus();
		} else if ( document.fm_pw.new_pwd.value != document.fm_pw.conf_pwd.value ) {
			alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			document.fm_pw.conf_pwd.value = "";
			//document.getElementById("lb_conf_pw").style.display = "block";
			document.fm_pw.conf_pwd.focus();
			return false;	
		} else {
			return true;
		}
		return false;
	}
	
	</script>
	
</head>
<body>	
	회원정보수정하기~
	<form name="fm_info" action="mypage_updateInfo.do" method="post" onsubmit="return infoSubmit()">
		회원번호:<input type="hidden" value="${member.mnum}" name="mnum" id="mnum"> <br>
		닉네임:<input type="text" value="${member.nick}" name="nick"> <br>
		이메일:<input type="email" value="${member.email}" name="email" id="email"> 	
		<!-- 중복체크 버튼을 누르면 이메일 중복체크... -->	

		<input type="button" value="중복체크" id="confirm_email" > 
		<span id="idCheck"></span> <br>
		<input type="submit" value="수정">
	</form>
	
	<hr>
	<strong>비밀번호 변경하기</strong><br>
	<form name="fm_pw" action="mypage_updatePwd.do" method="post" onsubmit="return pwdSubmit()">
		현재 비밀번호: <input type="password" values="" name="now_pwd"> <br><br>
		새 비밀번호: <input type="password" values="" name="new_pwd"><br>
		새 비밀번호 확인: <input type="password" values="" name="conf_pwd"><br>
		<input type="submit" value="비밀번호 변경">
	</form>
</body>
</html>