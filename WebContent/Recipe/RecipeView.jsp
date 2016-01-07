<%@page import="com.TodayCook.VO.RecipeVO"%>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %> --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page errorPage="../error/error404.jsp"  %>
<fmt:requestEncoding value="UTF-8" />

<!-- RecipeViewCommand에서 생성(setAttribute)한다. -->
<c:set var="Recipe" value="${Recipe }"/><!-- RecipeVO타입으로 해당 레시피의 정보를 담고있다. -->
<c:set var="Step" value="${Step }"/><!-- ArrayList에 CookStepVO을 담고 있다. 레시피의 이미지와 설명을 담고있다. -->
<c:set var="Comment" value="${Comment }"/>
<!-- ArrayList에 Recipe_CommentVO를 담고 있다. 레시피의 댓글 정보를 담고 있다. 추가로 댓글을 단 유저의 닉네임과 프로필사진을 가주고 온다.  -->
<c:set var="User" value="${User }"/>
<!-- ArrayList에 Object형태로 레시피를 작성한 유저의 닉네임과 프로필 그리고 총 조회수를 담고 있다. -->
<c:set var="CLike" value="${CLike }"/><!-- 로그인한 유저가 좋아요한 댓글 번호를 담고 있다. -->
<c:set var="RLike" value="${RLike }"/><!-- 로그인한 유저가 좋아요한 레시피 번호를 담고 있다. -->
<c:set var="picture" value="${sessionScope.picture}"/><!-- 로그인한 유저의 프로필 사진 -->
<c:set var="Rwarning" value="${Rwarning }"/><!-- 로그인한 유저가 신고한 레시피의 번호를 담고있다. -->
<c:set var="Cwarning" value="${Cwarning }"/><!-- 로그인한 유저가 신고한 댓글의 번호를 담고있다. -->

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TodayCook ${Recipe.getTitle() }</title>
<!-- 레시피의 타이틀을 넣어줘서 브라우저에 해당 레시피이름이 나오게된다. -->
<link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
<style type="text/css">
main.view {
	width:90%;
	margin: auto;
	background-color: #fff;
}
</style>
<script type="text/javascript">
	/* Comment Like */
	/* 댓글에 좋아요 버튼을 눌렀을때 작동하는 function */
	function likeClick(i,cnum,mnum){
		var likeck = i;/* i에는 버튼이 눌린 객체가 들어가 있다. */
		/* if에서 버튼의 이미지가 활성화 비활성화를 체크해서 번가라 실행 되게끔 되어있다. */
		if(likeck.src.match("btn_like.gif")){
			likeck.src="..${pageContext.request.contextPath}/img/number/btn_like_on.gif";
			/* 이미지를 활성화 이미지로 교체해 준다. */
			CommentLike(cnum,mnum,"like.recipe");
			/* CommentLike라는 Ajax에 댓글번호 유저 번호화 URL을 넘겨준다. (like.recipe은 댓글의 좋아요 체크)*/
			
		}else if(likeck.src.match("btn_like_on.gif")){
			likeck.src="..${pageContext.request.contextPath}/img/number/btn_like.gif";
			/* 이미지를 비활성화 이미지로 교체해 준다. */
			CommentLike(cnum,mnum,"del_like.recipe");
			/* CommentLike라는 Ajax에 댓글번호 유저 번호화 URL을 넘겨준다. (del_like.recipe은 댓글의 좋아요 해제)*/
		}
	}
	
	/* Recipe Like */
	/* 레시피의 좋아요 버튼을 눌렀을때 작동하는 function */
	function RlikeClick(i,num,mnum){
		var likeck = i;/* i에는 버튼이 눌린 객체가 들어가 있다. */
		/* if에서 버튼의 이미지가 활성화 비활성화를 체크해서 번가라 실행 되게끔 되어있다. */
		if(likeck.src.match("btn_like.gif")){
			likeck.src="..${pageContext.request.contextPath}/img/number/btn_like_on.gif";
			/* 이미지를 활성화 이미지로 교체해 준다. */
			CommentLike(num,mnum,"Rlike.recipe");
			/* CommentLike라는 Ajax에 레시피번호 유저 번호화 URL을 넘겨준다. (Rlike.recipe은 레시피의 좋아요 체크)*/
			
		}else if(likeck.src.match("btn_like_on.gif")){
			likeck.src="..${pageContext.request.contextPath}/img/number/btn_like.gif";
			/* 이미지를 활성화 이미지로 교체해 준다. */
			CommentLike(num,mnum,"Rdel_like.recipe");
			/* CommentLike라는 Ajax에 레시피번호 유저 번호화 URL을 넘겨준다. (Rdel_like.recipe은 레시피의 좋아요 해제)*/
		}
	}
	
	/*Ajax----------------------------------------------------*/
		/* 댓글 좋아요 Ajax */
		function CommentLike(cnum,mnum,url)
		{
		var xmlhttp;
		if (window.XMLHttpRequest)
		  {// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		  }
		else
		  {// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
		xmlhttp.onreadystatechange=function()
		  {
		  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		    {
			  /* xmlhttp.readyState==4 이고 xmlhttp.status==200 이면 Ajax가 성공적으로 실행 된것이다.*/
			    /* URL에 del이 있으면 싫어요 없으면 좋아요라는 경고창이 뜬다. */
			 	if(url.match("del")){
			 		alert("싫어요");
			 	}else{
			 		alert("좋아요");
			 	}
		    }
		  }
		xmlhttp.open("GET",url+"?cnum="+cnum+"&mnum="+mnum,true);
		/* GET방식을 넘겨받은 URL에 파라미터로 댓글번호(cnum)와 유저번호(mnum)를 넘겨준다. */
		xmlhttp.send();
		}
		
	 
	/*----------------------------------------------------*/
	/* 레시피 신고 */
	function error_Recipe_Click(i,num,mnum){
		/* 클릭된 버튼의 객체(i), 레시피번호(num), 회원번호(mnum) */
		var warning = i;/* i에는 버튼이 눌린 객체가 들어가 있다. */
		/* if에서 버튼의 이미지가 활성화 비활성화를 체크해서 번가라 실행 되게끔 되어있다. 한번 신고하면 신고는 풀리지 않는다.*/
		if(warning.src.match("btn_error.gif")){
			warning.src="..${pageContext.request.contextPath}/img/number/btn_error_on.gif";
			/* 레시피의 신고 이미지가 활성화 이미지로 교체된다. */
			Recipe_warning(num,mnum,"Rwarning.recipe");
			/* Recipe_warning라는 레시피 신고 Ajax로 레시피번호(num), 유저번호(mnum), URL을 넘겨준다. (Rwarning.recipe은 레시피 신고 )*/
		}else if(warning.src.match("btn_error_on.gif")){
			alert("이미 신고한 댓글 입니다.");
		}
	}
	
	/* 댓글 신고 */
	function errorClick(i,cnum,mnum) {/* 클릭된 버튼의 객체(i), 댓글번호(cnum), 회원번호(mnum) */
		var warning = i;/* i에는 버튼이 눌린 객체가 들어가 있다. */
		/* if에서 버튼의 이미지가 활성화 비활성화를 체크해서 번가라 실행 되게끔 되어있다. 한번 신고하면 신고는 풀리지 않는다.*/
		if(warning.src.match("btn_error.gif")){
			warning.src="..${pageContext.request.contextPath}/img/number/btn_error_on.gif";
			/* 댓글의 신고 이미지가 활성화 이미지로 교체된다. */
			Comment_warning(cnum,mnum,"Cwarning.recipe");
			/* Comment_warning라는 댓글 신고 Ajax로 댓글번호(cnum), 유저번호(mnum), URL을 넘겨준다. (Rwarning.recipe은 레시피 신고 )*/
		}else if(warning.src.match("btn_error_on.gif")){
			alert("이미 신고한 게시물 입니다.");
		}
	}
	
	/* 레시피 신고 Ajax */
	function Recipe_warning(num,mnum,url)
	{
		var xmlhttp;
		if (window.XMLHttpRequest)
		  {// code for IE7+, Firefox, Chrome, Opera, Safari
		  	xmlhttp=new XMLHttpRequest();
		  }
		else
		  {// code for IE6, IE5
		  	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
			xmlhttp.onreadystatechange=function()
		  {
		  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		    {
			  /* xmlhttp.readyState==4 이고 xmlhttp.status==200 이면 Ajax가 성공적으로 실행 된것이다.*/
				alert("해당 게시물을 신고했습니다.");
		    }
		  }
		xmlhttp.open("GET",url+"?num="+num+"&mnum="+mnum,true);
		/* GET방식으로 넘겨받은 URL에 레시피번호(num) 회원번호(mnum)를 파라이터로 넘겨준다. */
		xmlhttp.send();
	}
	
	/* 댓글 신고 */
	function Comment_warning(cnum,mnum,url)
	{
		var xmlhttp;
		if (window.XMLHttpRequest)
		  {// code for IE7+, Firefox, Chrome, Opera, Safari
		  	xmlhttp=new XMLHttpRequest();
		  }
		else
		  {// code for IE6, IE5
		  	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
			xmlhttp.onreadystatechange=function()
		  {
		  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		    {
			  /* xmlhttp.readyState==4 이고 xmlhttp.status==200 이면 Ajax가 성공적으로 실행 된것이다.*/
				alert("해당 댓글을 신고했습니다.");
		    }
		  }
		xmlhttp.open("GET",url+"?cnum="+cnum+"&mnum="+mnum,true);
		/* GET방식으로 넘겨받은 URL에 댓글번호(cnum) 회원번호(mnum)를 파라이터로 넘겨준다. */
		xmlhttp.send();
	}
	
	
</script>
</head>
<body>
<header style="height:100px;">
<%@include file="../include/headerOrigin.jsp" %>
</header>
<main class="view">
	<div>
	<!-- 요리의 대표이미지 -->
		<div><img src="${pageContext.request.contextPath}/recipeImg/${Recipe.getImage()}" alt="mainImage" id="mainImage" width="328px" height="328px" align="left"></div>
		<!-- 레시피의 요리상황(Recipe.getSituation())과 요리 종류(Recipe.getCooktype()) -->
		<div><font color="#999">${Recipe.getSituation() } · ${Recipe.getCooktype() }</font><br></div>
		<div><strong><font size="40">${Recipe.getTitle() }</font></strong></div>
		<!-- 요리 타이틀(Recipe.getTitle()) -->
		<div><img alt="인원" src="${pageContext.request.contextPath}/img/number/icon_info1.gif"><font color="#999">인원 : ${Recipe.getPerson() }</font><br></div>
		<!-- 요리 인원(Recipe.getPerson()) -->
		<div><img alt="조리시간" src="${pageContext.request.contextPath}/img/number/icon_info2.gif"><font color="#999">조리시간 : ${Recipe.getCooktime() }</font><br></div>
		<!-- 조리시간(Recipe.getCooktime()) -->
		<div><img alt="난이도" src="${pageContext.request.contextPath}/img/number/icon_info3.gif"><font color="#999">난이도 : ${Recipe.getHardly() }</font><br></div>
		<!-- 난이도(Recipe.getHardly())  -->
		<div><font color="#999">비용 : ${Recipe.getPay() }</font><br></div>
		<!-- 비용(Recipe.getPay()) -->
		<div><font color="#999">등록일 : ${Recipe.getWritetime() } &nbsp;/&nbsp;&nbsp; 조회수 : ${Recipe.getCount()} &nbsp;/&nbsp;&nbsp; 좋아요 : ${Recipe.getRecommend()}</font><br></div>
		<!-- 등록일(Recipe.getWritetime())과 조회수(Recipe.getCount())과 좋아요(Recipe.getRecommend()) -->
		<div><img alt="profile" src="${pageContext.request.contextPath}/userimg/${User.get(0) }" width="50px" height="50" align="left" style="border-radius:25px"></div>
		<!-- 레시피를 등록한 유저의 프로필 사진(User.get(0)) -->
		<div><font color="#de4830" style="font-size: 24px">${User.get(1) }</font><br></div> <!-- 레시피를 등록한 유저의 닉네임(User.get(1)) -->
		<div><font size="2px">레시피 : ${User.get(2) }</font><br></div> <!-- 레시피를 등록한 유저의 레시피수(User.get(2)) -->
		<c:if test="${sessionScope.mnum != null }"> <!-- sessionScope.mnum != null은 로그인했으면 좋아요 버튼과 신고 버튼이 보이게 해준다. -->
		<div>
			<br>
			
			<c:set var="CK" value="btn_like.gif"/>
			<!-- jstl로 CK라는 변수에 btn_like.gif(비활성화 이미지)라는 값을 넣어놓는다. -->
			<!-- jstl반복문으로 로그인한 유저가 해당 레시피를 좋아요 했으면 CK변수에 값으로 btn_like_on.gif(활성화 이미지)을 넣어준다. -->
			<c:forEach items="${RLike }" var="r">
				<c:if test="${sessionScope.mnum ==  r}">
					<c:set var="CK" value="btn_like_on.gif"/>
				</c:if>
			</c:forEach>
			
			<c:set var="Rerror" value="btn_error.gif" />
			<!-- jstl로 CK라는 변수에 btn_error.gif(비활성화 이미지)라는 값을 넣어놓는다. -->
			<!-- jstl반복문으로 로그인한 유저가 해당 레시피를 신고 했으면 CK변수에 값으로 btn_error_on.gif(활성화 이미지)을 넣어준다. -->
			<c:forEach items="${Rwarning }" var="RW">
				<c:if test="${sessionScope.mnum == RW}">
					<c:set var="Rerror" value="btn_error_on.gif"/>
				</c:if>
			</c:forEach>
			<!-- 해당 이미지가 클릭되면 javascript에 RlikeClick함수에 인자로 클릭된 객체(this)와 레시피번호(Recipe.getNum())와 로그인한 유저번호(mnum)를 넘겨준다.  -->
			<img alt="list" src="${pageContext.request.contextPath}/img/number/${CK }" id="like" onclick="RlikeClick(this,${Recipe.getNum()},${mnum})">
			<!-- 해당 이미지가 클릭되면 javascript에 error_Recipe_Click함수에 인자로 클릭된 객체(this)와 레시피번호(Recipe.getNum())와 로그인한 유저번호(mnum)를 넘겨준다.  -->
			<img alt="error" src="${pageContext.request.contextPath}/img/number/${Rerror}" id="error" onclick="error_Recipe_Click(this,${Recipe.getNum()},${mnum})">
		</div>
	</c:if>
	</div>
<br>
	<div style="clear:both; padding-left: 100px; background-color: #F1F1F2; border-radius:10px" >
		<dl>
			<dt>[주재료]</dt>
			<!-- 주제료(Recipe.getMaterial()) -->
			<dd>${Recipe.getMaterial() }</dd>
		</dl>
	</div>
	
	<!-- jstl로 i라는 변수를 선언 -->
	<c:set var="i" value="0"/>
	<!-- Step은 요리의 설명과 이미지를 담고있다. forEach(반복문)에 변수로 s에 Step을 담는다. ArrayList로 CookStepVO을 담고 있다. -->
	<c:forEach items="${Step}" var="s">
		<!-- i는 반복문을 돌면서 값이 1씩 증가 한다. -->
		<c:set var="i" value="${i+1 }"/>
		<div style="margin-bottom: 30px;">
			<div style="clear:both;">
				<!-- icon_step_${i }.gif(해당 gif는 숫자 이미지이다.)에 i가 증가하면 해당 이미지가 바뀌어서 보여주게된다. -->
				<img alt="number" src="${pageContext.request.contextPath}/img/number/icon_step_${i }.gif" align="left">
			</div>
			<div>
			<!-- 레시피 설명(s.getContents()) -->
			<font size="6pt">${s.getContents()}</font>
			</div>
			<div style="margin-left: 60px">
			<!-- 레시피이미지(s.getImage()) --><br>
			<img alt="image num" src="${pageContext.request.contextPath}/recipeImg/${s.getImage()}" width="754" height="502" style="border-radius:10px">
			</div>
		</div>
	</c:forEach>
	
	<div style="margin-bottom: 30px; margin-top: 30px">
      <div>
         <img alt="TIP" src="${pageContext.request.contextPath}/img/number/tit_tip.gif"/>
         <!-- 레시피 팁(Recipe.getTip()) -->
         <br><div style="margin-left: 30px; font-size: 24px">${Recipe.getTip() }</div>
      </div>
   </div>
	
	
	<div>
		<!-- Comment를 반복문의 변수로 i에 담는다. Comment는 ArrayList로 Recipe_CommentVO를 담고 있다. -->
		<c:forEach items="${Comment }" var="i">
				<div style="clear:both; margin-bottom:30px;">
					<!-- 댓글을 작성한 유저의 프로필사진(i.getProfilpic()) -->
					<img alt="댓글유저 이미지" src="${pageContext.request.contextPath}/userimg/${i.getProfilpic()}" width="50px" height="50" align="left" style="border-radius:25px">
					<!-- 댓글을 작성한 유저의 닉네임(i.getNick())과 작성일(i.getCdate()) -->
					<font color="#44b6b5" size="4px">아이디:${i.getNick() }</font> <font color="#999" size="2px">작성일:${i.getCdate() }</font>
					<!-- 로그인 했으면(sessionScope.mnum != null) 댓글에 좋아요와 신고를 볼수 있게끔 한다. -->
					<c:if test="${sessionScope.mnum != null }">
						<div style="display: inline;">
						<!-- jstl로 on변수에 btn_like.gif라는 값을 넣는다. -->
							<c:set var="on" value="btn_like.gif"/>
							<!-- 반복문 변수에 Clike(은 로그인한 유저가 좋아요한 댓그번호를 담고 있다.)를 j에 담는다 -->
							<!-- j와 i의 댓글번호가 같으면 on변수에 btn_like_on.gif을 담는다. -->
							<c:forEach items="${CLike }" var="j">
								<c:if test="${i.getCnum() ==  j}">
									<c:set var="on" value="btn_like_on.gif"/>
								</c:if>
							</c:forEach>
							
							<!-- jstl변수 Cerror에  btn_error.gif라는 값을 넣는다. -->
							<c:set var="Cerror" value="btn_error.gif"/>
							<!-- 반복문 변수 Cwar에 Cwarning(은 로그인한 유저가 신고한 댓글의 번호를 담고있다)을 넣는다. -->
							<!-- CWar화 i.getCnum()(i.getCnum은 댓글 번호이다.)이 같으면 Cerror변수에 btn_error_on.gif라는 값을 넣는다. -->
							<c:forEach items="${Cwarning }" var="CWar">
								<c:if test="${i.getCnum() == CWar}">
									<c:set var="Cerror" value="btn_error_on.gif"/>
								</c:if>
							</c:forEach>
							
							<!-- 댓글의 좋아요 버튼을 누르면 javascript의 likeClick로 클릭된 객체와 댓글번호와 유저번호를 인자로 전달해준다. -->
							<img alt="list" src="${pageContext.request.contextPath}/img/number/${on }" id="like" onclick="likeClick(this,${i.getCnum()},${mnum})">
							<!-- 댓글의 신고 버튼을 누르면 javascript의 errorClick로 클릭된 객체와 댓글번호와 유저번호를 인자로 전달해준다. -->
							<img alt="error" src="${pageContext.request.contextPath}/img/number/${Cerror}" id="error" onclick="errorClick(this,${i.getCnum()},${mnum})">
							<!-- if문으로 해당 댓글을 작성한 사람이 자신의 댓글을 삭제 할수 있다.(자신이 작성한 댓글에는 삭제글자가 보인다.) -->
							<c:if test="${sessionScope.mnum == i.getMnum() }">
								| <a href="commentDelete.recipe?cnum=${i.getCnum()}&num=${Recipe.getNum() }&mnum=${mnum }">삭제</a>
							</c:if>
						</div>
					</c:if>
					<!-- 댓글 내용(i.getCcomment())  -->
					<br>${i.getCcomment() }
				</div>
		</c:forEach>
		
		<!-- 로그인은 해서 세션에 회원번호가 있으면 댓글을 작성 할 수 있다. -->
		<c:if test="${sessionScope.mnum != null }">
			<div style="clear:both;">
				<!-- 로그인한 회원의 프로필 이미지 -->
				<img alt="댓글유저 이미지" src="${pageContext.request.contextPath}/userimg/${picture}" width="50px" height="50" align="left" style="border-radius:25px">
			</div>
			<div>
				<form action="comment.recipe" method="GET">
					<!-- 댓글을 작성하면 hidden타입으로 레시피 번호를 보내준다. -->
					<input type="hidden" name="num" value="${Recipe.getNum() }">
					<!-- 댓글을 작성하면 hidden타입으로 회원번호를 보내준다. -->
					<input type="hidden" name="mnum" value="${mnum }">
					<textarea rows="6" cols="50" name="content" style="height:100px; float: left; resize:none;"></textarea>
					<input type="submit" value="등록" style="width:100px; height:100px;">
				</form>
			</div>
			</c:if>
	</div>
	
	
	
	<div style="width:90%; text-align: center">	
		<a href="recipedatil.recipe">
			<button class="btn-lg btn-default" style="margin-top: 15px;">목록으로</button>		
		</a>
	</div>

</main>	

	<footer style="font-size: 14px; width:100%;" >
	<%@include file="../include/footer.jsp" %>
	</footer>
</body>
</html>