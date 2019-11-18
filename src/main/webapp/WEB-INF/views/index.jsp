<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>대우 도서관</title>
<!-- 검색박스용 -->
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<!-- Custom fonts for this template -->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="/resources/css/clean-blog.min.css" rel="stylesheet">
<link href="/resources/css/button-select.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/button-select.css"
	type="text/css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
</head>
<script>
$(function(){
	var message='${message}';
	if(message!="" && message.length !=0){
		alert(message);
		
	}
	
	
})

</script>
<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="/member/index">대우 도서관</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<c:if test="${empty vo1 }">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="/member/index">처음으로</a></li>
						<li class="nav-item"><a class="nav-link" href="/member/join">회원가입</a></li>
						<li class="nav-item"><a class="nav-link" href="/member/login">로그인</a></li>
					</ul>
				</c:if>

				<c:if test="${!empty vo1 }">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="/member/index">처음으로</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/member/logout">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/member/mypage">My page</a></li>
					</ul>
				</c:if>
			</div>
		</div>
	</nav>

	<!-- Page Header -->
	<header class="masthead"
		style="background-image: url('/resources/img/home-bg.jpg')">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="site-heading">

						<div class="navbar">
							<br>
							<li class="menu"><a href="/library/libraryinfo">도서관 안내</a>
								<ul class="hide">
									<li><a href="#">이용 안내</a></li>
									<li><a href="#">찾아오시는 길</a></li>
								</ul></li>
							<li class="menu"><a href="/book/booksearch">자료 검색</a>
								<ul class="hide">
									<li><a href="#">신간 자료</a></li>
									<li><a href="#">베스트셀러</a></li>
									<li><a href="#">청소년 권장도서</a></li>
								</ul></li>

							<li class="menu"><a href="board/boardinfo">소통 참여</a>
								<ul class="hide">
									<li><a href="/board/boardmain">건의사항</a></li>
									<li><a href="#">도서 신청</a></li>
									<li><a href="/boardcompetition/boardcompetition">독후감 대회</a></li>
								</ul></li>
							<li class="menu"><a href="/book/bookapply" class="applyBook">도서
									신청</a>
						</div>
						<div class="container">
							<br />
						</div>
						<div class="row justify-content-center">
							<div class="col-12 col-md-10 col-lg-8">
								<form action="/book/booksearch" id="searchForm" method="post">
							<select name="criteria" id="">
								<option value="">---</option>
								<option value="bookname" <c:out value=""/>>도서명</option>
								<option value="writer" <c:out value=""/>>저 자</option>
								<option value="publisher" <c:out value=""/>>출판사</option>
							</select> 
							<input type="text" name="keyword" value="" placeholder="검색어를 입력하세요" />
							<button class="btn btn-outline-light" type="submit">Search</button>
						</form>
							
							<!--end of col-->
						</div>
					</div>

				</div>
				<br>


			</div>
		</div>
	
	</header>

	<!-- Main Content -->



	<div class="container">

		<div class="row">


			<div class="col-lg-8 col-md-10 mx-auto">
				<hr>
				<div class="post-preview">
					<a href="/book/newbook">
						<h2 class="post-title">신규도서</h2>
				</div>
				<hr>
				<div class="post-preview">
					<a href="/book/popularbook">
						<h2 class="post-title">인기도서</h2>
					</a>
				</div>
				<hr>
				<div class="post-preview">
					<a href="/book/recommandbook">
						<h2 class="post-title">추천도서</h2>
					</a>

				</div>
				<hr>


				<!-- Pager -->
				<div class="clearfix">
					<a class="btn btn-primary float-right" href="#">도서목록 보기 &rarr;</a>
				</div>
			</div>
		</div>
	</div>

	<hr>

	<h1>대우 도서관 찾아오시는 길</h1>
 	<div id="mapdiv">

		<div id="map"></div>

	</div> 
	<label> 주소: 서울특별시 노원구 공릉1동 동일로 1082 </label>
	<br>

	<label>전화: 02-987-0012</label>
	<br>
	<br>
	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<ul class="list-inline text-center">
						<li class="list-inline-item"><a href="#"> <span
								class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-twitter fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li class="list-inline-item"><a href="#"> <span
								class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li class="list-inline-item"><a href="#"> <span
								class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-github fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
					</ul>
					<p class="copyright text-muted">Copyright &copy; Your Website
						2019</p>
				</div>
			</div>
		</div>
	</footer>


	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="/resources/js/clean-blog.min.js"></script>

<!-- 세션이 없을 경우 도서신청 하면 alter뜨게 나옴 후 login페이지로 이동시킬예정  -->
<!-- 	<script>
		$(function() {
			
			var applybook = $(".applybook");
			$(".applyBook").click(function(e) {
				e.preventDefault();
				alert("로그인 후에 이용하세요 ");
				applybook.action="/member/login";
				applybook.submit();
			})
		})
	</script>
 --> 	
 
 <script>
		//GoogleMap//
		function initMap() {
			var latitude = 37.626636;
			var longitude = 127.072824;

			var seoul = {
				lat : latitude,
				lng : longitude
			};
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 15,
				center : seoul
			})

			var marker = new google.maps.Marker({
				position : seoul,
				map : map,
				title : "대우 도서관"
			});
			marker.setMap(map);

		}
		
		$(function(){
		//검색 버튼이 눌러지면 작동할 스크립트
		$(".btn-outline-light").click(function(){
			var searchForm=$("#searchForm");
			//검색조건이나 검색어가 비어있는지 확인하고
			//알림창 띄우고
			//비어 잇으면 searchForm으로 되돌려 보내기
			if(!searchForm.find("option:selected").val()){
				alert("검색 종류를 선택하세요");
				return false;
			}
			if(!searchForm.find("input[name='keyword']").val()){
				alert("검색어를 입력하세요");
				searchForm.find("input[name='keyword']").focus();
				return false;
			}
			//검색 폼을 보내기 전에 pageNum값을 1로 변경 후 보내기
			searchForm.find("input[name='pageNum']").val("1");
			searchForm.submit();
		})
	})
	
	</script>
 
 	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBzDGpcVk6NFENgr5AwQdXCxu2o9vauvY4&callback=initMap"></script>
 
</body>

</html>




</html>