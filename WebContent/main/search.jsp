<%@page import="com.TodayCook.VO.RecipeVO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="../error/error404.jsp"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../include/cdn.jsp" %>
<link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
<title>Today Cook</title>
<style type="text/css">
.affix {
   top: 80px;
}
</style>
</head>
<body class="body">
<!-- 현 페이지 설정을 utf-8로 한다. -->
<fmt:requestEncoding value="UTF-8"></fmt:requestEncoding>
<header>
<%@include file="../include/headerOrigin.jsp" %>
<center>
<div class="container">
<div style="margin-top:100px;">  
<form action="recipesearchmain.recipe">
    <div class="col-sm-offset-3 col-xs-6">
      <input type="text" class="form-control" id="search" name="search"  placeholder="레시피/재료를 입력해주세요">
     </div>
     <br><br> 
    <button type="submit" class="btn btn-primary">검색하기 <span class="glyphicon glyphicon-search"></span></button>
  </form>
</div>  
</center>
<center>
<div class="text-right" style="width:95%;"> <!-- -->
<a href="recipevideo.recipe"> <!-- 쉐프 요리영상 servlet으로 이동 -->
<button type="button" class="btn btn-warning"> 쉐프 요리 영상 </button>
</a>
&nbsp;
<a href="recipesearchcommend.recipe"> <!-- 추천순 servlet으로 이동-->
<button type="button" class="btn btn-primary"> 추천순 </button>
</a>
&nbsp;
<a href="recipesearchcount.recipe"> <!-- 조회순 servlet으로 이동 -->
<button type="button" class="btn btn-success"> 조회순 </button>
</a>
&nbsp;
<a href="recipesearchdate.recipe"> <!-- 최근날짜순 조회 servlet으로 이동 -->
<button type="button" class="btn btn-info"> 최근날짜순 </button>
</a>
</div>
</center>
</header>


<div class="container-fluid" style="clear: both;">
<div class="row-fluid">
<div class="col-sm-2">
<div data-spy="affix" data-offset-top="205">
<br><br>
<%@include file="../include/main_left.jsp" %> <!-- 카테고리 검색 페이지 인클루드 -->
</div>
</div>
</div>
<div class="col-sm-8" style="padding: 10px;">
<h3>${Searchlist }</h3> <!-- searchlist : search 결과물로, 결과가 있다면 0, 없다면 검색결과가 없습니다. 표기 -->
<c:forEach items="${Recipelist}" var="vo" >
<!-- jstl 중 core를 이용하여, recipelist를 vo라는 변수에 담아 사용한다. -->
<!-- forEach : 자바의 for문과 동일하다 -->
		<div class="col-md-4">
		<div class="thumbnail"> <!-- 부트스트랩 thumbnail -->
		
		<div class="ih-item square effect13 top_to_bottom" style="width:245px;height:245px">
		<!-- 마우스 오버시, 글자가 나타나는 이펙트  -->
		<a href="datail.recipe?num=${vo.getNum()}">
		<div class="new">
		<!-- ${pageContext.request.contextPath} : el문에서 제공하는 절대경로. 현 페이지의 절대위치를 제공한다. -->
		<img src="..${pageContext.request.contextPath}/recipeImg/${vo.getImage()}" style="width:245px;height:245px; z-index:1;">
		</div>
		<c:if test="${vo.getRecommend() > 1 }"> <!-- 1: 베스트 게시물 조건, 추천수가 1보다 컸을때 -->
		<div class="best">
			<img src="..${pageContext.request.contextPath}/img/icon_best.png" style="position: relative; left:160px; top:-240px; width:72px; height:75px; z-index:2;">
		</div>
		</c:if>
		
		<c:forEach items="${NewRecipe }" var="n">
			<c:if test="${vo.getNum() == n.getNum() }">
			<div class="new">
			<img src="..${pageContext.request.contextPath}/img/NEW.png" style="position: relative; left:10px; top:-150px; width:50px; height:50px; z-index:2;">
			<!-- NEW 이미지는 기존 Recipe 이미지보다 위에 있어야 하므로, z-index를 이용하여 위로 올린다. -->
			</div>
			</c:if>
		</c:forEach>
		<!-- NewRecipe를 변수 n에 담아 사용하되, NewRecipe가 null이 아닐때까지 반복한다. -->
		
		
		<br>
				<div class="info">
				<h3>Recipe View</h3>
		</div></a></div>
		
		
		제목 : ${vo.getTitle()}<br> <!-- 레시피 제목을 가져와서 표기한다. -->
		<font color:grey>by</font> ${vo.getNick()}<br> <!-- 레시피 작성자의 닉네임을 가져와서 표기한다. -->
		<%-- Cooktype : ${vo.getCooktype() }<br>
		Situation : ${vo.getSituation() }<br>
		조회수 : ${vo.getCount() }
		추천수 : ${vo.getRecommend() } --%>
		
		
		<div class="text-right"> <!-- 부트스트랩에서 제공하는 위치 지정 div로, align을 오른쪽으로 지정한다. -->
		<c:set var="on" value="btn_like.gif"/> <!-- btn_like.gif 값을 변수 on으로 지정한다. -->
		<c:forEach items="${Rjjim }" var="j"> <!-- Rjjim을 변수 j에 담아 Rjjim이 null이 아닐때 까지 반복한다. -->
			<c:if test="${vo.getNum() ==  j}"> <!-- 만약 RecipeList의 getNum()이 j와 같다면, 즉, 찜리스트에 담긴 레시피번호와 동일하다면 -->
				<c:set var="on" value="btn_like_on.gif"/> <!-- on의 변수값을 btn_like_on.gif, 이미 좋아요가 되어있다는 의미의 이미지로 바꾼다. -->
			</c:if>
		</c:forEach>
		<c:if test="${login ne null }"> <!-- login이 null이 아니라면 -->
		<img alt="list" src="${pageContext.request.contextPath}/img/number/${on}" id="like" onclick="likeClick(this, ${vo.getNum()})">
		<!-- 찜리스트와 비교되어진 좋아요버튼을 표시한다. -->
		</c:if>
		</div>
		</div>
		</div>
</c:forEach>
</div>
<div class="col-sm-2">
<div data-spy="affix" data-offset-top="205">
<div class="jjimlist">
<br><br>
<%@include file="../include/jjimList.jsp" %> <!-- 우편에는 찜리스트가 담긴 페이지를 인클루드한다. -->
</div>
</div>
</div>
</div>

<!-- footer -->
<div class="footer" >
<%@include file="../include/footer.jsp" %> <!-- 아래에는 하단페이지를 인클루드한다. -->
</div>

<!-- back to top 버튼 --> <!-- 스크롤이 일정길이 이상내려가면 나타난다.  -->
<a href="#" class="btn btn-default back-to-top">Back to Top</a>
<style>
.back-to-top {
    position: fixed; /* 위치 고정 */
    bottom: 2em; /* 바닥에서 2em 떨어진다 */
    right: 10px; /* 오른쪽으로 10px */
    padding: 1em;  
    display: none; /* 평상시에는 표시되지 않는다. */
}
</style>
<script type="text/javascript">
$(document).ready(function() {
    var offset = 350;   // 수직으로 어느정도 움직여야 버튼이 나올까?
    var duration = 0;   // top으로 이동할때까지의 animate 시간 (밀리세컨드, default는 400. 예제의 기본은 500)
    $(window).scroll(function() {
        if ($(this).scrollTop() > offset) {
            $('.back-to-top').fadeIn(duration); //현 윈도우창의 scrollTop이 350px보다 크다면 나타남
        } else {
            $('.back-to-top').fadeOut(duration); //그게 아니라면 사라짐
        }
    });
     
    $('.back-to-top').click(function(event) {
        event.preventDefault();
        $('html, body').animate({scrollTop: 0}, duration); //html의 body가 scrollTop이 0인곳으로 이동
        return false;
    })
});

function likeClick(i, n){ //좋아요 버튼 클릭 시, 해당 레시피의 버튼을 변수도 불러온다.
	var likeck = i; // i : 해당 누른 버튼(반복된 for문에서 특정위치의 해당버튼에 해당한다. 일종의 this)
	var listnum = n; // n : 해당 버튼이 눌린 레시피의 번호
	if(likeck.src.match("btn_like.gif")){ //만약 좋아요의 버튼 링크가 btn_like.git와 일치한다면
		
		$.ajax({ //ajax 실행
			type: "POST", //타입은 post
			url: "main/search_jjim.jsp", //찜 DB접속 페이지
			data : {"num" : listnum}, //parameter name: num, value: listnum(레시피 번호)
			success: function(data) { //해당 레시피번호를 찜리스트에 담는다.
				if(jQuery.trim(data)=='YES'){ //해당 레시피번호가 중복되지 않고 잘 담겼다면
					alert("찜 했습니다.");
					likeck.src="..${pageContext.request.contextPath}/img/number/btn_like_on.gif";
					//src를 btn_like_on으로 변경하여 좋아요했다는 표시로 변경한다.
						
					//$('.jjimlist').load("include/jjimList.jsp");
					}//if
					else{ //만약 해당 레시피번호가 중복되어 담기지 않았다면
					alert("경고! 이미 등록된 찜입니다!");
					likeck.src="..${pageContext.request.contextPath}/img/number/btn_like.gif";
					//해당 버튼을 btn_like로 변경한다.
					}//else
						
					$.ajax({ //위의 ajax가 실행되고 나면 이 ajax를 실행한다.
						type: "POST", //타입은 post
						url: "jjim.jjim", //servlet jjim.jjim을 실행, 해당 페이지로 jjim리스트를 발송한다.
						dataType: 'html', //데이터 타입은 html
						success : function(html) { //해당페이지로 jjim리스트가 발송되면
							jQuery('.jjimlist').html(jQuery.trim(html)); //jjimlist div에 html을 불러온다.
						}
					})//ajax
						
						
					}//success
				
			});//ajax		
	}else if(likeck.src.match("btn_like_on.gif")){ //만약 눌러진 버튼이 btn_like_on이라면,
		$.ajax({ //ajax를 실행한다.
			type: "POST", //타입은 post
			url: "main/search_jjim_cancle.jsp", //찜 취소페이지
			data : {"num" : listnum}, // parameter name: num, value: listnum(해당 레시피 번호)
			success: function(data) { //해당 레시피 번호에 해당하는 찜 취소
				if(jQuery.trim(data)=='YES'){ //찜이 취소되면
					alert("찜취소 했습니다.");
					likeck.src="..${pageContext.request.contextPath}/img/number/btn_like.gif";
					//해당 버튼을 btn_like로 변경한다.
					}//if
					
					$.ajax({ //위의 ajax가 실행되고 나면 이 ajax를 실행한다.
						type: "POST", //타입은 post
						url: "jjim.jjim", //servlet jjim.jjim을 실행, 해당 페이지로 jjim리스트를 발송한다.
						dataType: 'html',//데이터 타입은 html
						success : function(html) {//해당페이지로 jjim리스트가 발송되면
							jQuery('.jjimlist').html(jQuery.trim(html));//jjimlist div에 html을 불러온다.
						}
					})//ajax
					
					}//success
				
			});//ajax	
	}//else if
		
}//function

/* function jjimDelete(i, n){
	var deletenum = n;
	$.ajax({
		type: "POST",
		url: "main/search_jjim_cancle.jsp", //찜 DB접속 페이지
		data : {"num" : deletenum},
		success: function(data) { //중복체크 후 반환 값
			if(jQuery.trim(data)=='YES'){
				alert("찜 삭제 했습니다.");
				
				}//if
				
				$.ajax({
					type: "POST",
					url: "jjim.jjim",
					dataType: 'html',
					success : function(html) {
						 //$('.jjimlist').html(responseText);
						 //jQuery('.jjimlist').append(jQuery.trim(html));
						jQuery('.jjimlist').html(jQuery.trim(html));
					}
				})//ajax
				
				}//success
			
		});//ajax	
}//function */

$('#customerbtn').click(function(){ //footer의 의견제출 버튼 클릭 시,
	if($('#customerEmail').val()!=""){ //고객 email이 빈칸이 아니라면
	$.ajax({ //ajax를 실행한다.
		Type: 'POST', // 타입은 post
		url : "${pageContext.request.contextPath}/main/CustomerInsert.jsp", //고객의견발송페이지
		data: $('#customer').serialize(),//폼 전송(폼의 모든 내용을 parameter로 전송한다.)
		success: function(data){
			
		alert('의견이 제출되었습니다. 고맙습니다.');
			$('#customerSend').each(function(){
				$(this).val("");
			});//내용 삭제 기능
			$('#customerEmail').each(function(){
				$(this).val("");
			});//이메일칸 내용 삭제 기능
		}
	});//ajax
	}else{
		alert('이메일을 적어주세요!');
	}
});//click

	
</script>	
</body>
</html>