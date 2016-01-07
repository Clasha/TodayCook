<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="../error/error404.jsp"  %>       
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
    rel="stylesheet" type="text/css">
  <link rel="stylesheet" type="text/css" href="../TodayCook_Type1/css/index.css">
  <link rel="stylesheet" type="text/css" href="../${pageContext.request.contextPath}/css/join.css">
<!-- <script type="text/javascript" src="js/index.js"></script> -->

<title>로그인</title>
<!-- <style type="text/css">
body {
background-color: #EAEAEA;
padding-top: 30px;
}
body>div{
width: 40%;
border: 1px solid red;
}
hr {
border: 1px solid red;
}
.fa{
	margin-top: 10px;
}
.btn {
	width: 100%;
	height: 50px;
}
footer {
	padding-top: 20px;
}
</style> -->
<script type="text/javascript">
$(document).ready(function(){
$("#email").blur(function(){ //아이디창에서 포커스가 벗어나면 함수 실행
	var check = $('input#email').val();
	if(check=="") {alert('이메일을 입력해주세요!');}
	//이메일 형식 확인용
	var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	if(regex.test(check) === false) { //적힌 이메일이 이메일 형식에 맞지 않으면  
	    alert("잘못된 이메일 형식입니다.");  //경고창을 띄운 후
	    return false; //함수 실행 취소
	} 
	else{ //적힌 이메일이 이메일 형식에 맞다면
	$.ajax({ //ajax를 실행한다.
		type: "POST", //타입은 post
		url: "../TodayCook_Type1/join/join_comfirm.jsp", //이메일 중복체크를 실행한다
		data : {"uesrid" : check}, //parameter name: userid, value: check(유저가 작성한 이메일) 전달
		success: function(data) { //중복체크 후 반환 값
			if(jQuery.trim(data)=='YES'){ //중복이 되지 않으면
				//alert("사용가능한 이메일입니다");
				document.getElementById("idCheck").innerHTML="<font color='green'>멋진 이메일이네요!</font>";
				//idcheck 란에 멋진 이메일이네요! 를 표기한다.
			}else{ //중복일 경우엔
				alert("경고! 이미 등록된 이메일입니다!"); //경고창을 띄운 후
				document.getElementById("idCheck").innerHTML="<font color='red'>이미 등록된 이메일입니다!</font>";
				//idcheck란에 이미 등록된 이메일임을 표기한다.
			}
		}//success
		
	}) //ajax
	}
});//blur
    $('#email').tooltip({title: "비밀번호 찾기 및 의견제출에 이용되오니 유효한 이메일 작성을 부탁드립니다. ", trigger: "focus", placement: "bottom"}); 
	//이메일란 아래쪽으로 이메일 작성에 유의사항을 툴팁으로 표시한다.
});	//ready
	
	
	function idclear(){
		document.getElementById("idCheck").innerHTML ="";
		//idcheck안의 html을 공백으로 만든다.
	}//end idclear()
	
	function passCheck() { //비밀번호와 비밀번호확인이 일치하는지 확인하는 함수
	      if(signup.pass.value==signup.pass2.value) { //서로 일치한다면
	         document.getElementById("pwdCheck").innerHTML = "<font color='green'>비밀번호가 일치합니다.</font>";
	         //pwdcheck안의 html에 일치한다는 메세지와 함께
	         var icon = document.getElementById("checkicon"); 
	         icon.style.color="green"; //checkicon의 색을 초록색으로 바꾼다.
	      } 
	      if(signup.pass.value!=signup.pass2.value) { //서로 일치하지 않으면
	         document.getElementById("pwdCheck").innerHTML = "<font color='red'>비밀번호가 일치하지 않습니다.</font>";
	         //pwdcheck안의 html에 일치하지 않는다는 메세지와 함께
	         var icon = document.getElementById("checkicon");
	         icon.style.color="red"; //checkicon의 색을 빨간색으로 바꾼다.
	      }
	   }//end passCheck()
	   
	   $.fn.setPreview = function(opt){ //유져 프로필 미리보여주기
		    "use strict"
		    var defaultOpt = {
		        inputFile: $(this),
		        img: null,
		        w: 100,
		        h: 100
		    };
		    $.extend(defaultOpt, opt);

		    var previewImage = function(){
		        if (!defaultOpt.inputFile || !defaultOpt.img) return;

		        var inputFile = defaultOpt.inputFile.get(0);
		        var img       = defaultOpt.img.get(0);

		        // FileReader
		        if (window.FileReader) {
		            // image 파일만
		            if (!inputFile.files[0].type.match(/image\//)) return;

		            // preview
		            try {
		                var reader = new FileReader();
		                reader.onload = function(e){
		                    img.src = e.target.result;
		                    img.style.width  = defaultOpt.w+'px';
		                    img.style.height = defaultOpt.h+'px';
		                    img.style.display = '';
		                }
		                reader.readAsDataURL(inputFile.files[0]);
		            } catch (e) {
		                // exception...
		            }
		        // img.filters (MSIE)
		        } else if (img.filters) {
		            inputFile.select();
		            inputFile.blur();
		            var imgSrc = document.selection.createRange().text;

		            img.style.width  = defaultOpt.w+'px';
		            img.style.height = defaultOpt.h+'px';
		            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";            
		            img.style.display = '';
		        // no support
		        } else {
		            // Safari5, ...
		        }
		    };

		    // onchange
		    $(this).change(function(){
		        previewImage();
		    });
		};


		$(document).ready(function(){
		    var opt = {
		        img: $('#img_preview'),
		        w: 100,
		        h: 100
		    };

		    $('#profilpic').setPreview(opt);
		}); 

</script>
</head>
<body>
	<center>
	<div class="container">
	<a href="${pageContext.request.contextPath}/index2.jsp"><img src="${pageContext.request.contextPath}/img/todaycook.png" width="300px"></a>
	<br>
	<form role="form" name="signup" action="${pageContext.request.contextPath}/join.join" method="post" ENCTYPE="multipart/form-data">
	<div class="col-sm-offset-2 col-xs-8">
	<hr>
	<input type="email" class="form-control" placeholder="이메일" name="email" id="email" onfocus="idclear()" required>
	<span id="idCheck"></span> 
	<br>
	<input type="password" class="form-control" name="pass" id="pass" placeholder="비밀번호" onblur="passCheck()" trequired>
	<input type="password" class="form-control" name="pass2" id="pass2" placeholder="비밀번호 확인" onblur="passCheck()" required>
	<i class="fa fa-lock fa-3x" id="checkicon"></i><br>
	<span name="pwdCheck" id="pwdCheck"></span>
	<hr>
	<img id="img_preview" style="display:none; border-radius: 5px; box-shadow: 5px 5px gray;"/>	
	<br>
	<input type="file" id="profilpic" name="profilpic" >
	<br>
	<input type="text" class="form-control" placeholder="닉네임" name="nic" id="nic" maxlength="6" required>
	<span id="nicCheck"></span>
	<hr>
	<br>
	<button type="submit" class="btn btn-success"><span class="fa fa-check"></span> 가 입 하 기</button>
	</div>
	</form>
	</div>
	<br><br>
	<div>
	<img src="${pageContext.request.contextPath}/img/todaycook.png" width="80px">copyright© <b>TodayCook Corp.</b> All Rights Reserved.
	</div>
	</center>
</body>
</html>