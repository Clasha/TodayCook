<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="../error/error404.jsp"  %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/help.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%@ include file="../include/cdn.jsp" %>
<script src="//code.jquery.com/jquery-2.1.1.js"></script><!-- 제이쿼리를 사용하기 위해서 CDN으로 제공하는 코드 -->
<style type="text/css">
.container {
	width: 80%;
}

</style>
<script> 
$(document).ready(function(){
    $("#head").click(function(){
    	/* head라는 글자가 있는 div태그의 id와 일치하며, 이 id 안의 내용을 클릭할 경우에 아래의 명령을 수행 */
        $("#body").slideToggle("slow");/* id가 body인 div태그에 대해서 슬라이드 토글 효과를 줍니다 */
    });
});

$(document).ready(function(){
    $("#head1").click(function(){
        $("#body1").slideToggle("slow");
    });
});

$(document).ready(function(){
    $("#head2").click(function(){
        $("#body2").slideToggle("slow");
    });
});

$(document).ready(function(){
    $("#head3").click(function(){
        $("#body3").slideToggle("slow");
    });
});
$(document).ready(function(){
    $("#head4").click(function(){
        $("#body4").slideToggle("slow");
    });
});
$(document).ready(function(){
    $("#head5").click(function(){
        $("#body5").slideToggle("slow");
    });
});
$(document).ready(function(){
    $("#head6").click(function(){
        $("#body6").slideToggle("slow");
    });
});

$(document).ready(function(){
    $("#head7").click(function(){
        $("#body7").slideToggle("slow");
    });
});

</script>


</head>
<body>
<header style="height:150px;">
<%@include file="../include/headerOrigin2.jsp" %>
</header>
<div class="container">
<h1 align="center">도움말</h1>
<div id="head">회원가입은 어떻게 하나요?<span class="caret"></span></a></div>
<div id="body">
회원가입하는 방법이 궁금하신가요?<br>
오늘의 요리는 이메일로 회원가입을 할 수 있습니다.<br>
로그인페이지 아래에 회원가입을 눌러 회원가입을 할 수 있습니다.<br>
</div>
<p>

<div id="head1">레시피를 등록하고 싶어요<span class="caret"></span></a></div>
<div id="body1">
레시피 등록방법이 궁금하신가요?<br>
오늘의 요리 메인페이지 우측 상단의 글쓰기 아이콘을 눌러 레시피를 작성하실 수 있습니다.<br>
레시피 등록은 오늘의요리 회원만 가능합니다.<br>
</div>
<p>

<div id="head2">프로필사진을 변경하고 싶어요<span class="caret"></span></a></div>
<div id="body2">
회원가입 시 등록한 프로필 사진을 변경하고 싶으신가요?<br>
우측 상단 mypage를 클릭하시면 프로필사진을 변경하실 수 있습니다.<br>
</div>
<p>

<div id="head3">비밀번호를 잃어버렸어요<span class="caret"></span></a></div>
<div id="body3">
비밀번호를 잃어버리셨나요?<br>
회원가입 시 등록했던 이메일 주소로 비밀번호를 새로 발급받으실 수 있습니다.<br>
로그인페이지 밑에 비밀번호 찾기를 클릭한후 가입했던 이메일을 입력하시면<br>
비밀번호 재설정을 위한 메일이 발송되니 확인 후 이용하시면 됩니다.
</div>
<p>

<div id="head4">나의 활동내역을 확인하고 싶어요<span class="caret"></span></a></div>
<div id="body4">
내가 활동한 내용들을 한꺼번에 확인하고 싶으신가요?<br>
상단의 프로필사진 밑에 mypage를 클릭하시면 나의 자취를 확인하실 수 있습니다.<br>
</div>
<p>

<div id="head5">레시피를 수정하고 싶어요<span class="caret"></span></a></div>
<div id="body5">
이미 등록한 레시피를 수정하고 싶으신가요?<br>
상단의 프로필사진 밑에 mypage에서 레시피 수정이 가능합니다.<br>
</div>
<p>

<div id="head6">내가 쓴 글/댓글을 삭제하고 싶어요<span class="caret"></span></a></div>
<div id="body6">
부득이한 이유로 내가 쓴 글을 삭제하고 싶으신가요?<br>
작성하신 레시피 삭제는 mypage에서 가능하고,<br>
댓글 삭제는 해당 레시피 페이지에서만 가능합니다<br>
삭제한 게시물은 절대 복구되지 않으니 신중하게 삭제해주세요.<br>
</div>
<p>

<div id="head7">회원탈퇴 방법을 알려주세요<span class="caret"></span></a></div>
<div id="body7">
사용중인 오늘의요리 아이디는 회원탈퇴 후 재사용 및 복구가 불가능 합니다.<br>
탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택해 주세요.<br>
로그인 후 상단의 mypage에서 탈퇴 가능합니다.<br>
</div>
</div>

</body>
</html>