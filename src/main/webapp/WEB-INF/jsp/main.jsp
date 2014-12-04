<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel='stylesheet' href='css/lottery-custom.css' type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/3DGallery/demo.css"
	type="text/css" media="screen" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/3DGallery/style.css"
	type="text/css" media="screen" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/PercentageLoader/jquery.percentageloader-0.1.css"
	type="text/css" media="screen" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/3DGallery/jquery.gallery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/3DGallery/modernizr.custom.53451.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ClassyLED/jquery.classyled.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ClassyLED/raphael.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/PercentageLoader/jquery.percentageloader-0.1.min.js"></script>

<title>Online Prize System</title>
</head>
<body>
	<div class="loginHeader">
		<c:choose>
			<c:when test="${not empty userName}">
				<ul class="loginBar">
					<li>
						<a title="${userName}"><c:out value="${userName}" /></a>
						<b class="split">-</b>
						<a title="Sign out" href="logoff.do">Sign out</a>
					</li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="loginBar">
					<li>
						<a title="Login" href="login.do">Login</a>
						<b class="split">-</b>
						<a title="Sign in" href="register.do">Sign in</a>
					</li>
				</ul>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="topLoaderContainer">
		<div id="topLoader"></div>
	</div>
	<div class="lotteryContent" style="display: none">
		<div class="classyled"></div>
		<div class="container">
			<header style="display:none">
			<h1>
				3D Gallery <span>with CSS3 &amp; jQuery</span>
			</h1>
			<nav class="codrops-demos"> <a
				href="http://tympanus.net/codrops/2012/02/06/3d-gallery-with-css3-and-jquery/">Navigation</a>
			<a
				href="http://tympanus.net/codrops/2012/02/06/3d-gallery-with-css3-and-jquery/">Auto-Slideshow</a>
			<a class="current-demo" href="http://www.accenture.com">12
				Elements</a> </nav> </header>
			<section id="dg-container" class="dg-container">
			<div class="dg-wrapper">
				<a href="#"><img src="css/images/1.jpg" alt="image01"><span>http://www.colazionedamichy.it/</span></a>
				<a href="#"><img src="css/images/2.jpg" alt="image02"><span>http://www.percivalclo.com/</span></a>
				<a href="#"><img src="css/images/3.jpg" alt="image03"><span>http://www.wanda.net/fr</span></a>
				<a href="#"><img src="css/images/4.jpg" alt="image04"><span>http://lifeingreenville.com/</span></a>
				<a href="#"><img src="css/images/5.jpg" alt="image05"><span>http://circlemeetups.com/</span></a>
				<a href="#"><img src="css/images/6.jpg" alt="image06"><span>http://www.castirondesign.com/</span></a>
				<a href="#"><img src="css/images/7.jpg" alt="image07"><span>http://www.foundrycollective.com/</span></a>
				<a href="#"><img src="css/images/8.jpg" alt="image08"><span>http://www.mathiassterner.com/home</span></a>
				<a href="#"><img src="css/images/9.jpg" alt="image09"><span>http://learnlakenona.com/</span></a>
				<a href="#"><img src="css/images/10.jpg" alt="image10"><span>http://www.neighborhood-studio.com/</span></a>
				<a href="#"><img src="css/images/11.jpg" alt="image11"><span>http://www.beckindesign.com/</span></a>
				<a href="#"><img src="css/images/12.jpg" alt="image12"><span>http://kicksend.com/</span></a>
			</div>
			</section>
		</div>

		<div class="lotteryContainer">
			<div id="lotteryResult"><jsp:text>Please click 'Start' Button to enjoy</jsp:text></div>
			<div>
				<input id="startDraw" class="lotteryStartBtn" type="button"
					value="Start" /> <input id="startDrawText" type="button"
					value="startDraw" style="display: none" />
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		var $topLoader = $("#topLoader").percentageLoader({
			width : 512,
			height : 512,
			controllable : true,
			progress : 0.5,
			onProgressUpdate : function(val) {
				$topLoader.setValue(Math.round(val * 100.0));
			}
		});

		var topLoaderRunning = false;
		percentageLoader();
		function percentageLoader() {
			if (topLoaderRunning) {
				return;
			}
			topLoaderRunning = true;
			$topLoader.setProgress(0);
			$topLoader.setValue('0kb');
			var kb = 0;
			var totalKb = 999;

			var animateFunc = function() {
				kb += 17;
				$topLoader.setProgress(kb / totalKb);
				$topLoader.setValue(kb.toString() + 'kb');

				if (kb < totalKb) {
					setTimeout(animateFunc, 25);
				} else {
					topLoaderRunning = false;
					$("#topLoader").css('display', 'none');
					$('.lotteryContent').css('display', 'block');
					
					// 3DGallery
					$('#dg-container').gallery({
						autoplay : true
					});
					
					//ClassyLED
					$('.classyled').ClassyLED({
						type : 'time',
						format : 'hh:mm:ss',
						hourFormat : 24,
						color : '#fa0',
						backgroundColor : '#000',
						size : 12,
						rounded : 0,
						fontType : 2
					});
				}
			}

			setTimeout(animateFunc, 25);
		}

		// invoke the controller through ajax 
		$('#startDraw').click(function() {
			var startDraw = $("#startDrawtext").val();
			$.ajax({
				type : 'POST',
				dataType : 'text',
				url : 'beginToDraw.do',
				data : {
					startDraw : startDraw
				},
				success : function(data) {
					$('#lotteryResult').html(data);
				},
				error : function() {
					alert("error");
				}
			});
		});

	});
</script>
</html>