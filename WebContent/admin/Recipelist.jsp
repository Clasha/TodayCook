<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- admin 페이지로 이동할 때 모든 레시피가 검색되어 저장되는 페이지 -->
</head>
<body>

<input type="text" name="findnick" id="findnick" placeholder="작성자 검색">
<input type="button" value="검색하기" id="findnickrecipe">
<input type="button" value="정리하기" id="findlistdelete">

<script type="text/javascript">
$('#findnickrecipe').click(function(){
	var nick = $('input#findnick').val(); //작성자검색란의 값
	$.ajax({	//ajax 실행
		type: "POST", //타입은 post
		url: "..${pageContext.request.contextPath}/findnickrecipe.recipe", //닉네임 확인페이지
		data: {"nick" : nick},//parameter로 name: nick, value: nick(작성자검색란의 값)을 전달한다
		dataType: 'html', //데이터타입은 html
		success : function(html) {
			jQuery('.find').html(jQuery.trim(html)); //작성자 검색이 되면, 해당 결과물을 가져온다
			
			$('#findnick').each(function(){
				$(this).val("");
			});//input 칸 삭제
			
			$('.list').hide(); //밑의 list를 숨긴다.
		}//success
	})//ajax
});//click

$('#findlistdelete').click(function(){//정리하기 버튼
	/* $.ajax({
		type: "POST",
		url: "..${pageContext.request.contextPath}/AdminRecipeResultList.recipe",
		dataType: 'html',
		success : function(html) {
			alert('ajax 실행');
			jQuery('.list').html(jQuery.trim(html));
		}
	})//ajax */
	
	jQuery('.find').empty();//검색 결과물을 비운다.
	$('.list').show(); //리스트를 띄운다.
	//setTimeout($('.list').show(), 3000);
	
});//click

function RecipeDelete(i, j){ //레시피 삭제 버튼 클릭시
	//i : this를 담기위한 임시 변수
	//j : 레시피 번호가 담긴 변수
	//alert('레시피 삭제 버튼이 눌렸습니다. Recipelist페이지');
	 var deletenum = j;
	$.ajax({ //ajax 실행
		type: "POST", //타입 post
		url: "..${pageContext.request.contextPath}/deleterecipe.recipe", //레시피 삭제 페이지
		data : {"num" : deletenum}, //parameter 전달, name: num, value: deletenum
		success: function(data) { //해당 레시피를 삭제한다
				alert('해당 레시피가 삭제되었습니다. 정리하기를 눌러주세요.')
				 $.ajax({ //ajax를 실행한다
					type: "POST", //타입은 post
					url: "..${pageContext.request.contextPath}/AdminRecipeResultList.recipe",
					//servlet을 실행한다.
					dataType: 'html',//데이터타입은 html
					success : function(html) {
						jQuery('.list').html(jQuery.trim(html)); //레시피결과물이 담긴 페이지를 불러온다.
					}
				})//ajax 
				
				}//success
			
		});//ajax	 
};
</script>

<hr>
<div class="find">

</div> 
<hr>
<br>
<div class="list">
<table border ="1px" width="500">
<tr>
<td align ="center">번호</td>
<td align ="center">제목</td>
<td align ="center">작성날짜</td>
<td align ="center">작성자</td>
<td align ="center">작성자이메일</td>
<td align ="center">추천수</td>
<td align ="center">댓글수</td>
<td align ="center">신고횟수</td>
<td align ="center">신고날짜</td>
</tr>
<c:forEach items="${RecipeDetail}" var="mto"> <!-- recipedatail 을 mto 변수에 담는다. -->
<tr>
<td align="center">${mto.getRecipenum()}</td> <!-- 레시피 번호 -->
<td align="center">
<a href="datail.recipe?num=${mto.getRecipenum()}"> <!-- 레시피 제목 클릭 시 레시피 상세 페이지 확인용 -->
${mto.getRecipeTitle()} <!-- 레시피 제목 -->
</a>
</td>
<td align="center"><fmt:formatDate value="${mto.getRecipeWriteTime()}" /></td> <!-- 레시피 작성시간  -->
<td align="center">${mto.getMemberNick()}</td> <!-- 레시피 작성자 -->
<td align="center">${mto.getMemberEmail()}</td> <!-- 레시피 작성자 이메일(아이디) -->
<td align="center">${mto.getRecommend()}</td> <!-- 레시피 추천수 -->
<td align="center">${mto.getReplyCount()}</td> <!-- 레시피 댓글 수 -->
<td align="center">${mto.getWarningCount()}</td> <!-- 레시피 신고횟수 -->
<td align="center"><fmt:formatDate value="${mto.getWarningTime()}" /></td> <!-- 레시피 신고날짜 -->
</tr>
</c:forEach>
</table>
</div>

</body>
</html>