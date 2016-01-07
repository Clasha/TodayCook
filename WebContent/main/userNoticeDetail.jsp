<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../include/cdn.jsp" %>
<title>Insert title here</title>
</head>
<body style="height:600px; background: url(${pageContext.request.contextPath}/img/redberry.png); background-size: cover; font-size:14px;">
<header style="height:150px;">
<%@include file="../include/headerOrigin.jsp" %>
</header>
<div>
<center>
	<div class="container" style="width:50%;">
      <h1>공지사항</h1>
      <table class="table table-hover">
			<tr>
				<th>작성자</th>
				<td>${board.mnum}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${board.reg_date}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">${board.subject }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
				<textarea cols="80" rows="10" readonly>${board.content}</textarea>
				</td>
			</tr>
		</table>
		
		<input type="button" class="btn btn-warning" value="게시글 리스트"
			onclick="location.href='noticeview.notice'"> 
	
   </div>
</center>
</div>
<footer>
<div class="footer" style="font-size:14px;">
<%@include file="../include/footer.jsp" %>
</div>
</footer>
<script type="text/javascript">
$('#customerbtn').click(function(){
	if($('#customerEmail').val()!=""){
			alert('의견이 제출되었습니다. 고맙습니다.');
	$.ajax({
		Type: 'POST',
		url : "${pageContext.request.contextPath}/main/CustomerInsert.jsp",
		data: $('#customer').serialize(),//폼 전송
		success: function(data){
			
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