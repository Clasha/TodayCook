<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Video Playlist</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/UI.css">
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,600,300italic,300' rel='stylesheet' type='text/css'>
 
  <script>
  $(function() {
    $( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
    $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
  });
  
   $(function() {
    $( "#tabs2" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
    $( "#tabs2 li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
  });
  
  
   $(function() {
    $( "#tabs3" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
    $( "#tabs3 li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
  });
   $(function() {
    $( "#tabs4" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
    $( "#tabs4 li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
  });
   $(function() {
    $( "#tabs5" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
    $( "#tabs5 li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
  });
   $(function() {
    $( "#tabs6" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
    $( "#tabs6 li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
  });
   $(function() {
    $( "#tabs7" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
    $( "#tabs7 li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
  });
  </script>
  
   <script>
  $(function() {
    $( "#tabschannels" ).tabs();
  });
  </script>
  
  
  <style>
  .ui-tabs-vertical { width: 55em; }
  .ui-tabs-vertical .ui-tabs-nav { padding: .2em .1em .2em .2em; float: right; width: 18em;
background: black; }
  .ui-tabs-vertical .ui-tabs-nav li { clear: left; width: 100%; border-bottom-width: 1px !important; border-right-width: 0 !important; margin: 0 -1px .2em 0; }
  .ui-tabs-vertical .ui-tabs-nav li a { display:block; }
  .ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active { padding-bottom: 0; padding-right: .1em; border-right-width: 1px; }
  .ui-tabs-vertical .ui-tabs-panel { /* padding: 1em; float: right; */ width: 40em; margin-left: 5px;}
  </style>
  

</head>
<body> 
 
 
 <div id="tabschannels" style="width:72%; margin: auto;">
  <ul>
    <li><a href="#tabsc-1">백종원</a></li>
    <li><a href="#tabsc-2">이원일</a></li>
    <li><a href="#tabsc-3">이연복</a></li>
    <li><a href="#tabsc-4">오세득</a></li>
    <li><a href="#tabsc-5">김풍</a></li>
    <li><a href="#tabsc-6">박준우</a></li>
    <li><a href="#tabsc-7">최현석</a></li>
  </ul>
  
  <div id="tabsc-1">
  <!-- content start -->
 
					<div id="tabs">
					  <ul style="height:357px;overflow-y:auto;overflow-x:hidden">
						<li><a href="#tabs-1"><img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Back1.PNG">폭탄 계란찜</a></li>
						<li><a href="#tabs-2"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Back2.PNG">계란 볶음밥</a></li>
						<li><a href="#tabs-3"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Back3.PNG">초간단 잡채</a></li>
						<li><a href="#tabs-4"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Back4.PNG">만능 볶음 양념장</a></li>
						<li><a href="#tabs-5"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Back5.PNG">고등어 김치찜</a></li>
						<li><a href="#tabs-6"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Back6.PNG">고등어 구이</a></li>
						<li><a href="#tabs-7"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Back7.PNG">양파 볶기</a></li>
						<li><a href="#tabs-8"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Back8.PNG">양파 캐러멜 카레</a></li>
						<li><a href="#tabs-9"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Back9.PNG">삽겹살 된장찌개</a></li>
						<li><a href="#tabs-10"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Back10.PNG">중국집 볶음밥</a></li>
						
					  </ul>
					  <div id="tabs-1">
					<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    WIDTH='640' HEIGHT='360' id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=AE352BCFD87F7EFB2C9A2110A47682ED43D4&outKey=V124d6829e1d1285595069b5051667aa86f1809497986941678cd9b5051667aa86f18&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            WIDTH='640' HEIGHT='360'            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=AE352BCFD87F7EFB2C9A2110A47682ED43D4&outKey=V124d6829e1d1285595069b5051667aa86f1809497986941678cd9b5051667aa86f18&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
					

				</div>
					  <div id="tabs-2">
						<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    WIDTH='640' HEIGHT='360' id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=D00BA1A5A55F3B311CF1F6CFF91B91F7AAEC&outKey=V122325721d79703af92f962cd26116cb01de4cecf3b8bc05ebd4962cd26116cb01de&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            WIDTH='640' HEIGHT='360'            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=D00BA1A5A55F3B311CF1F6CFF91B91F7AAEC&outKey=V122325721d79703af92f962cd26116cb01de4cecf3b8bc05ebd4962cd26116cb01de&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
						
				</div>
					  <div id="tabs-3">
							<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    WIDTH='640' HEIGHT='360' id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=EED026317FC15837E053539917A6A68D3809&outKey=V12870a4292242e50e09c1d496879eb567a6909b66371f198ed4a1d496879eb567a69&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            WIDTH='640' HEIGHT='360'            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=EED026317FC15837E053539917A6A68D3809&outKey=V12870a4292242e50e09c1d496879eb567a6909b66371f198ed4a1d496879eb567a69&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>

					  </div>
					  
						<div id="tabs-4">
						<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    WIDTH='640' HEIGHT='360' id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=3FA89A93375467C3BD13416D268676A5BC0C&outKey=V125d9e928199f7149795eaeefb71a5bd30bf9460cceb85a244baeaeefb71a5bd30bf&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            WIDTH='640' HEIGHT='360'            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=3FA89A93375467C3BD13416D268676A5BC0C&outKey=V125d9e928199f7149795eaeefb71a5bd30bf9460cceb85a244baeaeefb71a5bd30bf&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
						
					  </div>
					  
						<div id="tabs-5">
						<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    WIDTH='640' HEIGHT='360' id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=348984949B255D340D779D6A553FBF3DD2BF&outKey=V1295e3477a5209b8ea8ffad94b29e444a12a8102c20d8a5be0b0fad94b29e444a12a&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            WIDTH='640' HEIGHT='360'            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=348984949B255D340D779D6A553FBF3DD2BF&outKey=V1295e3477a5209b8ea8ffad94b29e444a12a8102c20d8a5be0b0fad94b29e444a12a&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
						
					  </div>
					  
						<div id="tabs-6">
						<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    WIDTH='640' HEIGHT='360' id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=E906CF9AA425CC2F16D6A31F04BF2C93CCC9&outKey=V1232b2d306acb627657a198b8c5f07a0d6fb6ebed80f004457c2198b8c5f07a0d6fb&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            WIDTH='640' HEIGHT='360'            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=E906CF9AA425CC2F16D6A31F04BF2C93CCC9&outKey=V1232b2d306acb627657a198b8c5f07a0d6fb6ebed80f004457c2198b8c5f07a0d6fb&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
					  </div>
					  
						<div id="tabs-7">
						<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    WIDTH='640' HEIGHT='360' id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=A0453DF3B9725972AEAD2166B7A2D403B6FC&outKey=V1246742810948816cd64bb9ead3d6b3a7a4a0ace595ad0a6511fbb9ead3d6b3a7a4a&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            WIDTH='640' HEIGHT='360'            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=A0453DF3B9725972AEAD2166B7A2D403B6FC&outKey=V1246742810948816cd64bb9ead3d6b3a7a4a0ace595ad0a6511fbb9ead3d6b3a7a4a&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
						
					  </div>
					  
						<div id="tabs-8">
						<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    WIDTH='640' HEIGHT='360' id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=8A51A6E37641E82643FF258BF7985BF293BB&outKey=V12503e925ec754f2893666fb526a2c868b1e2291fb547dc4038766fb526a2c868b1e&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            WIDTH='640' HEIGHT='360'            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=8A51A6E37641E82643FF258BF7985BF293BB&outKey=V12503e925ec754f2893666fb526a2c868b1e2291fb547dc4038766fb526a2c868b1e&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
					  </div>
					  
						<div id="tabs-9">
						<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    WIDTH='640' HEIGHT='360' id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=A910A83EAADA12840F2B9AD6E3C058CD33B4&outKey=V128bce7f4c21c7d4d63a4bb787e326d1cc69928d84891525b2a94bb787e326d1cc69&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            WIDTH='640' HEIGHT='360'            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=A910A83EAADA12840F2B9AD6E3C058CD33B4&outKey=V128bce7f4c21c7d4d63a4bb787e326d1cc69928d84891525b2a94bb787e326d1cc69&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>

					  </div>
					  
						<div id="tabs-10">
						<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    WIDTH='640' HEIGHT='360' id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=76DD295FDF37AE586855F514092F24E23453&outKey=V127f7f11f21d4b2c4059389560ae0769ec273bbe8b6c8435dc2b389560ae0769ec27&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            WIDTH='640' HEIGHT='360'            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=76DD295FDF37AE586855F514092F24E23453&outKey=V127f7f11f21d4b2c4059389560ae0769ec273bbe8b6c8435dc2b389560ae0769ec27&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
						
					  </div> 
					</div>
					 
  <!-- content end -->
  </div>
  
  
  <div id="tabsc-2">
  <!--- content start --->
 
					<div id="tabs2">
					  <ul style="height:357px;overflow-y:auto;overflow-x:hidden">
						<li><a href="#tabs2-1"><img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/one1.PNG">이 참외 비빔면</a></li>
						<li><a href="#tabs2-2"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/one2.PNG">삼겹살 팟티</a></li>
						<li><a href="#tabs2-3"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/one3.PNG">옥돔이 맛있돔</a></li>
						<li><a href="#tabs2-4"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/one4.PNG">야육동</a></li>
						<li><a href="#tabs2-5"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/one5.PNG">허니버터징</a></li>
						<li><a href="#tabs2-6"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/one6.PNG">LA 떡 다져스</a></li>
						<li><a href="#tabs2-7"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/one7.PNG">한식브런찜</a></li>
						<li><a href="#tabs2-8"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/one8.PNG">만능 나물 양념장</a></li>
						<li><a href="#tabs2-9"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/one9.PNG">초코 모찌 맛있찌</a></li>
						<li><a href="#tabs2-10"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/one10.PNG">감자봤수란</a></li>
						
					  </ul>
					  <div id="tabs2-1">
						<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    WIDTH='640' HEIGHT='360' id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=BCF9214E044F7D80782F8EA2E579C6D12C53&outKey=V12272c93c9a9a008be0e216fddaa4e7ce4786512058012e11ad0216fddaa4e7ce478&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            WIDTH='640' HEIGHT='360'            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=BCF9214E044F7D80782F8EA2E579C6D12C53&outKey=V12272c93c9a9a008be0e216fddaa4e7ce4786512058012e11ad0216fddaa4e7ce478&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
					  </div>
					  <div id="tabs2-2">
					  <object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    WIDTH='640' HEIGHT='360' id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=C5F07F90A73543F353D7390994D7C3A8C3D2&outKey=V127c0ce1a2a74f8a48beb47d0b1e20a6c0604c4bccb99c4eb993b47d0b1e20a6c060&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            WIDTH='640' HEIGHT='360'            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=C5F07F90A73543F353D7390994D7C3A8C3D2&outKey=V127c0ce1a2a74f8a48beb47d0b1e20a6c0604c4bccb99c4eb993b47d0b1e20a6c060&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
					  
					   </div>
					  <div id="tabs2-3">
					  <object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    WIDTH='640' HEIGHT='360' id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=74BA8147A1F890D0327264BAEDD96BED6A22&outKey=V121259d7ac8a022697a0ba6b3d1a47100729a1d287628e18d276ba6b3d1a47100729&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            WIDTH='640' HEIGHT='360'            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=74BA8147A1F890D0327264BAEDD96BED6A22&outKey=V121259d7ac8a022697a0ba6b3d1a47100729a1d287628e18d276ba6b3d1a47100729&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
					  
					  </div>
					  
						<div id="tabs2-4">
						<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    WIDTH='640' HEIGHT='360' id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=93963223B2DC1B27A0FD66FB526A2C868B1E&outKey=V12128d092424a9a3d890eaeefb71a5bd30bf98236710c2f2c940eaeefb71a5bd30bf&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            WIDTH='640' HEIGHT='360'            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=93963223B2DC1B27A0FD66FB526A2C868B1E&outKey=V12128d092424a9a3d890eaeefb71a5bd30bf98236710c2f2c940eaeefb71a5bd30bf&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
						
					  </div>
					  
						<div id="tabs2-5">
						<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    WIDTH='640' HEIGHT='360' id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=9DD9A609111A1C02F6E8061F9438ADB3C1AD&outKey=V123c520330efd5567628eaeefb71a5bd30bf1c01490f55bb87c5eaeefb71a5bd30bf&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            WIDTH='640' HEIGHT='360'            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=9DD9A609111A1C02F6E8061F9438ADB3C1AD&outKey=V123c520330efd5567628eaeefb71a5bd30bf1c01490f55bb87c5eaeefb71a5bd30bf&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
						
					  </div>
					  
						<div id="tabs2-6">
						<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    WIDTH='640' HEIGHT='360' id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=328D95B4F59D74AFFC631AB575D276BEF723&outKey=V122220413c026d641f9b0af7884589909a7fb482f164eea7def70af7884589909a7f&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            WIDTH='640' HEIGHT='360'            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=328D95B4F59D74AFFC631AB575D276BEF723&outKey=V122220413c026d641f9b0af7884589909a7fb482f164eea7def70af7884589909a7f&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
						
					  </div>
						<div id="tabs2-7">
						<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    WIDTH='640' HEIGHT='360' id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=9998DFE16EE2757E1B700A6DD4AD13278429&outKey=V126bb704249a1a75dceb178288888266a2b2bae6770d362447a6178288888266a2b2&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            WIDTH='640' HEIGHT='360'            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=9998DFE16EE2757E1B700A6DD4AD13278429&outKey=V126bb704249a1a75dceb178288888266a2b2bae6770d362447a6178288888266a2b2&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
						
					  </div>
						<div id="tabs2-8">
						<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    WIDTH='640' HEIGHT='360' id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=0B73CC505E8B186AB137C3AE9146C3DAFBEC&outKey=V1212ff2e7e5e621cd6709d6a553fbf3dd2bfd71948214babd1ff9d6a553fbf3dd2bf&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            WIDTH='640' HEIGHT='360'            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=0B73CC505E8B186AB137C3AE9146C3DAFBEC&outKey=V1212ff2e7e5e621cd6709d6a553fbf3dd2bfd71948214babd1ff9d6a553fbf3dd2bf&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
						
					  </div>
						<div id="tabs2-9">
						<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    WIDTH='640' HEIGHT='360' id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=14F7B3FDDAA070875865062E833F97B7DA2E&outKey=V12800b51962b41962daf87d5fa5a304efe06a99a1d6cd168c49a87d5fa5a304efe06&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            WIDTH='640' HEIGHT='360'            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=14F7B3FDDAA070875865062E833F97B7DA2E&outKey=V12800b51962b41962daf87d5fa5a304efe06a99a1d6cd168c49a87d5fa5a304efe06&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
						
					  </div>
						<div id="tabs2-10">
						<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    WIDTH='640' HEIGHT='360' id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=27F588DDF3D4B985B53A8880C6DFA2B1982A&outKey=V129d3a351cd2a025296a10158805a917784d9ce23865c1fe14d710158805a917784d&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            WIDTH='640' HEIGHT='360'            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=27F588DDF3D4B985B53A8880C6DFA2B1982A&outKey=V129d3a351cd2a025296a10158805a917784d9ce23865c1fe14d710158805a917784d&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
						
					  </div>
					</div>
					 
  <!-- content end -->
  
  </div>
  <div id="tabsc-3">
  <!-- content start -->
 
					<div id="tabs3">
					  <ul style="height:357px;overflow-y:auto;overflow-x:hidden">
						<li><a href="#tabs-1"><img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/bok1.PNG">동파육</a></li>
						<li><a href="#tabs-2"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/bok2.PNG">콩가루 짜장면</a></li>
						<li><a href="#tabs-3"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/bok3.PNG">냉짬뽕</a></li>
						<li><a href="#tabs-4"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/bok4.PNG">굴소스 떡볶이</a></li>
						<li><a href="#tabs-5"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/bok5.PNG">닭발</a></li>
						<li><a href="#tabs-6"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/bok6.PNG">탕수육</a></li>
						<li><a href="#tabs-7"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/bok7.PNG">대게살볶음</a></li>
						<li><a href="#tabs-8"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/bok8.PNG">새우완자탕</a></li>
						<li><a href="#tabs-9"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/bok9.PNG">칠리로브스터</a></li>
						
					  </ul>
					  <div id="tabs-1">
					  	<iframe width="640" height="360" src="https://www.youtube.com/embed/WMI7HvIPLcY" frameborder="0" allowfullscreen></iframe>
					  </div>
					  <div id="tabs-2">
					  	<iframe width="640" height="360" src="https://www.youtube.com/embed/p-fialw1uBM" frameborder="0" allowfullscreen></iframe>
					   </div>
					  <div id="tabs-3">
					  <iframe width="640" height="360" src="https://www.youtube.com/embed/T4yjMzFRbOM" frameborder="0" allowfullscreen></iframe>
					  </div>
					  
						<div id="tabs-4">
						   <iframe width="640" height="360" src="https://www.youtube.com/embed/2gzJ2bfhhVU" frameborder="0" allowfullscreen></iframe>
					  </div>
					  
						<div id="tabs-5">
						<iframe width="640" height="360" src="https://www.youtube.com/embed/07WZSrqV4Dg" frameborder="0" allowfullscreen></iframe>
					  </div>
					  
						<div id="tabs-6">
						<iframe width="640" height="360" src="https://www.youtube.com/embed/kLbN3BqwNrQ" frameborder="0" allowfullscreen></iframe>
					  </div>
						<div id="tabs-7">
						<iframe width="640" height="360" src="https://www.youtube.com/embed/olGZA4Jo6ZM" frameborder="0" allowfullscreen></iframe>
					  </div>
						<div id="tabs-8">
						<iframe width="640" height="360" src="https://www.youtube.com/embed/qBwdjeP4X1U" frameborder="0" allowfullscreen></iframe>
					  </div>
						<div id="tabs-9">
						<iframe width="640" height="360" src="https://www.youtube.com/embed/StTHqmFe6bE" frameborder="0" allowfullscreen></iframe>
					  </div>
						
					</div>
					 
  <!-- content end -->
  
  </div>
  
  <div id="tabsc-4">
  <!-- content start -->
 
					<div id="tabs4">
					  <ul style="height:357px;overflow-y:auto;overflow-x:hidden">
						<li><a href="#tabs-1"><img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Deuk1.PNG">크림소스 새우튀김</a></li>
						<li><a href="#tabs-2"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Deuk2.PNG">5분 토스트</a></li>
						<li><a href="#tabs-3"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Deuk3.PNG">비프 타르타프</a></li>
						<li><a href="#tabs-4"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Deuk4.PNG">체리베리 팬케이크</a></li>
						<li><a href="#tabs-5"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Deuk5.PNG">양갈비</a></li>
						<li><a href="#tabs-6"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Deuk6.PNG">착한 스테이크</a></li>
						<li><a href="#tabs-7"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Deuk7.PNG">꿀절임 카프레제</a></li>
						<li><a href="#tabs-8"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Deuk8.PNG">냉국</a></li>
						<li><a href="#tabs-9"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Deuk9.PNG">고대미 리조토</a></li>
						<li><a href="#tabs-10"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Deuk10.PNG">아메리카노</a></li>
						
					  </ul>
				<div id="tabs-1">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/rrOBZrOiXv4" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-2">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/rg2LPC6GN0I" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-3">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/CJIzxcw4o40" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-4">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/D_d4C6rPuGA" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-5">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/ZHT6KjSpTXQ" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-6">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/JleTR0ptOcc" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-7">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/Gvokph1yZjg" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-8">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/IXVlGKZbFA4" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-9">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/kYgB4TDKlxA" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-10">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/mdyeh6VXYgc" frameborder="0" allowfullscreen></iframe>
				</div>
			</div>
					 
  <!-- content end -->
  
  </div>
  
  
  <div id="tabsc-5">
  <!-- content start -->
 
					<div id="tabs5">
					  <ul style="height:357px;overflow-y:auto;overflow-x:hidden">
						<li><a href="#tabs-1"><img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Pung1.PNG">레몬타르트</a></li>
						<li><a href="#tabs-2"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Pung2.PNG">기름없닭</a></li>
						<li><a href="#tabs-3"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Pung3.PNG">레알육개장라면</a></li>
						<li><a href="#tabs-4"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Pung4.PNG">럭셔리 스팸스테이크</a></li>
						<li><a href="#tabs-5"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Pung5.PNG">밥버거</a></li>
						<li><a href="#tabs-6"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Pung6.PNG">토마토 볶음밥</a></li>
						<li><a href="#tabs-7"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Pung7.PNG">팬케이크</a></li>
						<li><a href="#tabs-8"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Pung8.PNG">스튜</a></li>
						<li><a href="#tabs-9"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Pung9.PNG">알찬 컵 빵</a></li>
						<li><a href="#tabs-10"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Pung10.PNG">크로켓</a></li>
						
					  </ul>
				<div id="tabs-1">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/NH8Qs7qUTJo" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-2">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/siokbPuVDZA" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-3">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/LGP4zGjKyYM" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-4">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/XKzh0yUcUII" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-5">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/okipGChiatE" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-6">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/kxTDBZ1-QgU" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-7">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/h2KVtNcsXso" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-8">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/_N1SjdZrEoU" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-9">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/3DPyd-7_Kbg?list=PL4ru2l4xOI1LYjvywbA7zzGIGP9UZphlS" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-10">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/kbuejETmY7I?list=PL4ru2l4xOI1LYjvywbA7zzGIGP9UZphlS" frameborder="0" allowfullscreen></iframe>
				</div>
			</div>
					 
  <!-- content end -->
  
  </div>
  
    <div id="tabsc-6">
  <!-- content start -->
 
					<div id="tabs6">
					  <ul style="height:357px;overflow-y:auto;overflow-x:hidden">
						<li><a href="#tabs-1"><img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Jun1.PNG">머랭케이크</a></li>
						<li><a href="#tabs-2"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Jun2.PNG">벨기에 디저트</a></li>
						<li><a href="#tabs-3"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Jun3.PNG">맛있게 자시오</a></li>
						<li><a href="#tabs-4"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Jun4.PNG">가지가지한다</a></li>
						<li><a href="#tabs-5"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Jun5.PNG">코드네임 써니</a></li>
						<li><a href="#tabs-6"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Jun6.PNG">Love of Life</a></li>
						<li><a href="#tabs-7"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Jun7.PNG">파리송로</a></li>
						<li><a href="#tabs-8"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Jun8.PNG">그.래.요</a></li>
						
					  </ul>
				<div id="tabs-1">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/GlKAtnTqJis" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-2">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/NrUmLdr_jf4" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-3">
					<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    width="640" height="360" id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=BC07411491D377609F94371CA81502F81038&outKey=V1262723e24bc28108a21c4ece286984119ed0c5d4fe29bd3285ec4ece286984119ed&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            width="640" height="360"            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=BC07411491D377609F94371CA81502F81038&outKey=V1262723e24bc28108a21c4ece286984119ed0c5d4fe29bd3285ec4ece286984119ed&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
				</div>
				<div id="tabs-4">
					<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    width="640" height="360" id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=005426EDBF809CFEA1DE3C8AABC1A5A51135&outKey=V1212838a919cd742704c267563c9af1a3d7a31ad5ebcadfb77b4267563c9af1a3d7a&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            width="640" height="360"            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=005426EDBF809CFEA1DE3C8AABC1A5A51135&outKey=V1212838a919cd742704c267563c9af1a3d7a31ad5ebcadfb77b4267563c9af1a3d7a&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
				</div>
				<div id="tabs-5">
					<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    width="640" height="360" id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=3A33EB047D743FEFBBB00C6D1B1808F8CCED&outKey=V125d4702f649e859e51d9548e3dd65f8de073bf021c7c0780ec49548e3dd65f8de07&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            width="640" height="360"            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=3A33EB047D743FEFBBB00C6D1B1808F8CCED&outKey=V125d4702f649e859e51d9548e3dd65f8de073bf021c7c0780ec49548e3dd65f8de07&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
				</div>
				<div id="tabs-6">
					<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    width="640" height="360" id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=97CBBA2337C9A84DBE6CE108B1496E8ABA36&outKey=V12596782465d19fbc2e2977d5a4b782b33747b1ae5ae3aca07e9977d5a4b782b3374&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            width="640" height="360"            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=97CBBA2337C9A84DBE6CE108B1496E8ABA36&outKey=V12596782465d19fbc2e2977d5a4b782b33747b1ae5ae3aca07e9977d5a4b782b3374&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
				</div>
				<div id="tabs-7">
					<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    width="640" height="360" id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=FD18DAD8982E1DBC0B368BCD56F24A4E0B38&outKey=V12897301d22861fea34dbdf8a8a9d891a31a3b3b23e50d2da2b8bdf8a8a9d891a31a&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            width="640" height="360"            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=FD18DAD8982E1DBC0B368BCD56F24A4E0B38&outKey=V12897301d22861fea34dbdf8a8a9d891a31a3b3b23e50d2da2b8bdf8a8a9d891a31a&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
				</div>
				<div id="tabs-8">
					<object    classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'    codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0'    width="640" height="360" id='rmcPlayer_08889' align='middle'>    <param name='allowScriptAccess' value='always'/>    <param name='quality' value='high'/>    <param name='movie' value='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'/>    <param name='wmode' value='window'/>    <param name='allowFullScreen' value='true'/>    <param name='bgcolor' value='#000000'/>    <param name='FlashVars' value='vid=495F005D3F4362A46A826044036B448B69D3&outKey=V128edce3932c5aa08b336f850d20745d59cd4e88629229219d596f850d20745d59cd&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'>    <embed            src='http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayer.nhn'            width="640" height="360"            quality='high'            wmode='window'            id='rmcPlayer_rmcPlayer_7690'            name='rmcPlayer_rmcPlayer_7690'            FlashVars='vid=495F005D3F4362A46A826044036B448B69D3&outKey=V128edce3932c5aa08b336f850d20745d59cd4e88629229219d596f850d20745d59cd&wmode=transparent&jsCallable=false&isAutoPlay=false&controlBarMovable=true&api=http://serviceapi.rmcnmv.naver.com/flash&skinName=tvcast_white&isResizableCoverImage=true&beginTime=0&__flashID=rmcPlayer_08889&skinURL=http://serviceapi.rmcnmv.naver.com/flash/getCommonPlayerSkin.nhn?name=tvcast_white&'            bgColor='#000000' align='middle' allowScriptAccess='always' allowFullScreen='true'            type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'/></object>
				</div>
			</div>
					 
  <!-- content end -->
  
  </div>
  
    <div id="tabsc-7">
  <!-- content start -->
 
					<div id="tabs7">
					  <ul style="height:357px;overflow-y:auto;overflow-x:hidden">
						<li><a href="#tabs-1"><img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Seok1.PNG">채끝 스테이크</a></li>
						<li><a href="#tabs-2"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Seok2.PNG">고르곤졸라 뇨끼</a></li>
						<li><a href="#tabs-3"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Seok3.PNG">치즈 핫도그</a></li>
						<li><a href="#tabs-4"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Seok4.PNG">닭다리 스테이크</a></li>
						<li><a href="#tabs-5"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Seok5.PNG">갈릭 크림 수프</a></li>
						<li><a href="#tabs-6"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Seok6.PNG">된장 버터 비빔밥</a></li>
						<li><a href="#tabs-7"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Seok7.PNG">치즈케이크 아이스크림</a></li>
						<li><a href="#tabs-8"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Seok8.PNG">새우 카레 파스타</a></li>
						<li><a href="#tabs-9"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Seok9.PNG">해장 칼국수</a></li>
						<li><a href="#tabs-10"> <img style="clear:both;float:left;width:150px" src="${pageContext.request.contextPath}/img/Seok10.PNG">갈치 베이컨 말이</a></li>
						
					  </ul>
				<div id="tabs-1">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/0HDivRXEqNg" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-2">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/KMQaGRSsZ5U" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-3">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/gzqLnrmBA0M" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-4">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/BHi8UDlJlK4" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-5">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/dckT5S-DLLQ" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-6">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/seDdoBZYSD0" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-7">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/XDkXCUUmfEg" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-8">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/tlq44ybJdt8" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-9">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/pfh33_YIaDo" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="tabs-10">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/O29QqLXM9wI" frameborder="0" allowfullscreen></iframe>
				</div>
			</div>
					 
  <!-- content end -->
  
  </div>
</div>
 
</body>
</html>