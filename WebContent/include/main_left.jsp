<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul id="toggle">
<p style="text-align: center; border:1px solid black"><b>카테고리 검색</b></p>

<li>
        <div><span class="menu-icons type"> <i class="fa fa-user"></i> </span>
			<h3>종류별</h3>
				<span class="the-btn"><i class="fa fa-plus"></i></span> 
					<div class="clear"></div>
        </div>
			<ul>
				<li><a href="recipesearchcooktype.recipe?cooktype=메인반찬">메인반찬</a></li>
				<li><a href="recipesearchcooktype.recipe?cooktype=밑반찬">밑반찬</a></li>
				<li><a href="recipesearchcooktype.recipe?cooktype=국/탕">국/탕</a></li>
				<li><a href="recipesearchcooktype.recipe?cooktype=찌개">찌개</a></li>
				<li><a href="recipesearchcooktype.recipe?cooktype=간식/디저트">간식/디저트</a></li>
				<li><a href="recipesearchcooktype.recipe?cooktype=면/만두">면/만두</a></li>
				<li><a href="recipesearchcooktype.recipe?cooktype=밥/죽/떡">밥/죽/떡</a></li>
				<li><a href="recipesearchcooktype.recipe?cooktype=퓨전">퓨전</a></li>
				<li><a href="recipesearchcooktype.recipe?cooktype=김치/젓갈/장류">김치/젓갈/장류</a></li>
				<li><a href="recipesearchcooktype.recipe?cooktype=양념/소스/잼">양념/소스/잼</a></li>
				<li><a href="recipesearchcooktype.recipe?cooktype=양식">양식</a></li>
				<li><a href="recipesearchcooktype.recipe?cooktype=샐러드/스프">샐러드/스프</a></li>
				<li><a href="recipesearchcooktype.recipe?cooktype=베이킹">베이킹</a></li>
				<li><a href="recipesearchcooktype.recipe?cooktype=차/음료/술">차/음료/술</a></li>
				<li><a href="recipesearchcooktype.recipe?cooktype=기타">기타</a></li>
			</ul>
</li>
<li>
        <div><span class="menu-icons situation"> <i class="fa fa-user"></i> </span>
			<h3>상황별</h3>
				<span class="the-btn"><i class="fa fa-plus"></i></span> 
					<div class="clear"></div>
        </div>
			<ul>
				<li><a href="recipesearchsituation.recipe?situation=일상">일상</a></li>
				<li><a href="recipesearchsituation.recipe?situation=초스피드">초스피드</a></li>
				<li><a href="recipesearchsituation.recipe?situation=손님접대">손님접대</a></li>
				<li><a href="recipesearchsituation.recipe?situation=술안주">술안주</a></li>
				<li><a href="recipesearchsituation.recipe?situation=다이어트쿡">다이어트쿡</a></li>
				<li><a href="recipesearchsituation.recipe?situation=나들이">나들이</a></li>
				<li><a href="recipesearchsituation.recipe?situation=영양식">영양식</a></li>
				<li><a href="recipesearchsituation.recipe?situation=간식">간식</a></li>
				<li><a href="recipesearchsituation.recipe?situation=야식">야식</a></li>
				<li><a href="recipesearchsituation.recipe?situation=해장">해장</a></li>
				<li><a href="recipesearchsituation.recipe?situation=명절">명절</a></li>
				<li><a href="recipesearchsituation.recipe?situation=이유식">이유식</a></li>
				<li><a href="recipesearchsituation.recipe?situation=기타">기타</a></li>
			</ul>
</li>

</ul>

<script>
$("#toggle > li > div").click(function () {
    if (false == $(this).next().is(':visible')) {
        $('#toggle ul').slideUp();        
    }
    
    var $currIcon=$(this).find("span.the-btn > i") //the btn의 갯수와 i 의 갯수를 확인한다.
    
    $("span.the-btn > i").not($currIcon).addClass('fa-plus').removeClass('fa-minus');
    //the-btn의 갯수가 i의 갯수보다 많으면 plus 버튼을 minus 버튼으로 바꾼다.
    
    $currIcon.toggleClass('fa-minus fa-plus');
    
    $(this).next().slideToggle();

    $("#toggle > li > div").removeClass("active");
    $(this).addClass('active');

});
</script>    