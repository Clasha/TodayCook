<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- <%@ include file="../include/cdn.jsp" %> --%>
<link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
<title>Insert title here</title>
</head>
<body style="background: url(${pageContext.request.contextPath}/img/redberry.png); background-size: cover; font-size: 14px;" >
<header style="height:150px;">
<%@include file="../include/headerOrigin.jsp" %>
</header>
<div style="height:400px;">
<center>
	<div class="container">
      <h1>공지사항</h1>
      <table class="table table-hover">
      	<thead>
         <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성일</th>
         </tr>
         </thead>
         <!-- 전달된 boartlist를 변수 board에 담고 진행 스테이터스를 status에 담는다. -->
         <c:forEach var="board" items="${boardList }" varStatus="status">
           
               <tr class="record">
                  <td>${status.count }</td> <!--반복 횟수 표기 -->
                  <td><a href="noticedetail.notice?num=${board.num}"> <!-- 게시글 번호 전달  -->
                        <font color="green"><b>${board.subject }</b></font> <!-- 게시글 제목 표시 --> 
                        </a></td>
                  <td>${board.reg_date }</td> <!-- 게시글 작성날짜 표시  -->
               </tr>
          
         </c:forEach>
         <tr>
            <td colspan="5" style="border: white; text-align: right">
            <a href="recipedatil.recipe"><font size="5px;" color="black"><b>Main</b></font></a>
            </td>
         </tr>
      </table>
     <div>
         <jsp:include page="page.jsp" flush="true"/> <!-- 페이징 페이지 인클루드  -->
       </div> 
   </div>
   </div>
</center>
</div>
<footer>
<div class="footer">
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