<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<title>마이페이지</title>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
	<!-- 부가적인 테마 -->
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
	<!-- jquery.min.js가 위에, bootstrap.min.js 가 아래애 -->
	<!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>  -->
	<link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">	
</head>
	<header style="height:150px;">
		<%@include file="/include/headerOrigin.jsp" %>
	</header>
	
	<!-- 마이페이지 인덱스의 css 코드. 꼭 이 위치에 있어야 함 -->
	<style type="text/css">
		.container {width: 1100px; max-width: none !important; background:#fff;}
		
		#contents_area {border: 0px solid #e6e7e8;margin-bottom: 50px;}
		#right_area {border: 0px solid #e6e7e8; padding: 30px;}
		#right_area a,span {display: block; margin-bottom: 10px;}
		
		.center {text-align: center;}
		.mypage_list {background:#fff; padding:25px 25px 0 40px;}
		.mypage_list a {display:inline-block; text-align:center; line-height:15px; padding-bottom:12px;}
		.mypage_list.three a {width:30%;}
		.mypage_icon {display:block; width:80px; width:80px; height:83px; margin:0 auto 10px;}
		
		.mypage_icon.icon_jjim {background-position:center -498px;}
		.mypage_icon.icon_recipe {background-position:center -498px;}
		.mypage_icon.icon_comment {background-position:center -498px;}
		.mypage_icon>img {width:inherit;}
		
		.mypage_num {padding-top:8px; font-size:14px; color:#aaa; display:block; }
		
		strong { color:green;}
		
	</style>
	<div style="background: url(${pageContext.request.contextPath}/jsp/labelle.png); background-size: cover;">
	<div class="container">
		
		
		
		<!--  모달 다이얼로그 -->
		<input type="hidden" id="newProfileUrl" name="new_profile_url">
		<div id="profileModal" class="modal fade bs-example-modal-sm" role="dialog" aria-hidden="true">
	      <div class="modal-dialog" style="width:570px">
	        <div class="modal-content" style="padding:0;">
	          <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><img src="http://recipe1.ezmember.co.kr/img/btn_close.gif" alt="닫기"></span></button>
	            <h4 class="modal-title">프로필 사진 편집</h4>
	          </div>
	          <div class="modal-body" style="padding:10px;text-align:center;">
	            <img id="vProfileImageModalSrc" src="userimg/${picture}" style="max-width:550px;max-height:500px;">
	            <div style="margin-top:10px;">
	            <input type="file" name="file" id="file_1" style="display:none;" />
	            <button type="button" onClick="document.getElementById('file_1').click();" class="btn btn-primary">프로필 사진 바꾸기</button>
	            <button type="button" id="profileSubmitBtn" onClick="doProfileImageSubmit()" class="btn btn-primary" disabled="disabled">저장</button>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div> <!-- div id="vProfileImageModal" 끝 -->
  		
  		<!-- 마이페이지 목록 -->
		<div id="contents_area" class="col-xs-9">
			<div class="mypage_list three">
				<a href="mypage_jjim.do?jjimCount=${jjimCount}&recipeCount=${recipeCount}&commCount=${commCount}">
					<span class="mypage_icon icon_jjim"><img src="jsp/jjim_icon.png"></span>
					<strong>찜한 레시피</strong>
					<span class="mypage_num">[${ jjimCount }]</span>
				</a>
				<a href="mypage_recipe.do?jjimCount=${jjimCount}&recipeCount=${recipeCount}&commCount=${commCount}">
					<span class="mypage_icon icon_recipe"><img src="jsp/recipe_icon.png"></span>
					<strong>내가 쓴 레시피</strong>
					<span class="mypage_num">[${ recipeCount }]</span>
				</a>
				<a href="mypage_recipe_comment.do?jjimCount=${jjimCount}&recipeCount=${recipeCount}&commCount=${commCount}">
					<span class="mypage_icon icon_comment"><img src="jsp/comm_icon.png"></span>
					<strong>레시피 댓글</strong>
					<span class="mypage_num">[${ commCount }]</span>
				</a>
			</div>
		
		<c:if test="${CONTENT!='/jsp/mypage/index.jsp'}" >
			<jsp:include page="${CONTENT}"></jsp:include>
		</c:if>
		</div> <!-- contents-area 끝-->
		
	  	<!-- 프로필 -->
		<div id="right_area" class="col-xs-3 center">
			<a href="javascript:void(0);" onClick="$('#profileModal').modal('show')">
				<img style="width:100px; height:100px; border-radius:50px;" src="userimg/${ picture }" onerror="this.src='${pageContext.request.contextPath}/userimg/NoImage.png'">
			</a> 
			<span>닉네임: ${ login }</span> 
			<a href="mypage_updateForm.do">회원정보수정</a> 
			<a href="member_out.do" onclick="return confirm('정말로 탈퇴하시겠습니까?')">회원탈퇴</a>
		</div>
		
		
	</div> <!-- container 끝 -->
	</div>
	
	<footer style="font-size: 14px;">
	<%@include file="/include/footer.jsp" %>
	</footer>
	

	<script type="text/javascript">
	
	var imageFile = null;
	
	// 저장 버튼을 클릭한 경우에 작동하는 함수
	function doProfileImageSubmit() {
		alert("저장버튼클릭");
		// 로드된 이미지가 없을 경우 알림창 띄우고 리턴
		if(!$("#newProfileUrl").val()) {
			alert('새 프로필 이미지를 올려주세요.');
	        return ;
	    }

		// 서버로 보낼 데이타를 구성함: 이미지파일과 회원번호
		var data = new FormData();
		data.append("file", imageFile);
		data.append("mnum", '${mnum}');
		
		// 데이터를 서버로 전송
		uploadToServer(data);
	   
	};
	
	// 데이터를 ajax방식으로 서버에 전송
	function uploadToServer(formData) {

		//Uncomment when you server ready

		xhr = new XMLHttpRequest();
		xhr.open("post", "http://localhost:8080/TodayCook_Type1/fileUpload",
				true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				alert(xhr.responseText);
				self.location.reload();
			}
		};
		xhr.send(formData);
	}
	
	// 이미지 파일을 열어서 로드하는 함수
	function handlePhotoFiles(e){
		imageFile = e.target.files[0];
		alert(imageFile);
		
		// 이미지 파일 크기 제한
	    if (e.target.files[0].size > (2*1024*1024)) {
	        alert("사진은 2MB까지만 허용됩니다.");
	        return false;
	    }

	    $('#submit_btn').attr('type','button').attr('onClick','alert("파일을 올리는 중입니다.");');

	    var reader = new FileReader();
	    reader.onload = function(evt) {
	        var img = new Image();
	        img.src = reader.result;
	        img.onload = function () {
	            var fileData = reader.result;
	            // 모달창의 이미지 변경
	            $("#vProfileImageModalSrc").attr("src",fileData);
	        	// 버튼 활성화
	            $('#profileSubmitBtn').prop('disabled',false);
	        	// URL 설정
	            $("#newProfileUrl").val(fileData);
	        }
	    }
	 	// URL로 데이터를 읽어옴.
	    reader.readAsDataURL(e.target.files[0]);
	    
	};

	$(document).ready(function()
	{
		// 파일 엘리먼트가 바뀌면 (파일 열기를 눌러서 선택했을 때)
		$("#file_1").change(function(e) {
	        handlePhotoFiles(e);
	    });

	});
	</script>
</body>
</html>