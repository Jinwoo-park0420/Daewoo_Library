<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="UTF-8">
<title>대우 도서관 - 도서검색 페이지</title>
<!-- 검색박스용 -->
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

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

</head>
<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="/index">대우 도서관</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<c:if test="${empty vo1 }">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="/index">처음으로</a></li>
						<li class="nav-item"><a class="nav-link" href="/member/join">회원가입</a></li>
						<li class="nav-item"><a class="nav-link" href="/member/login">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
						<li class="nav-item"><a class="nav-link" href="/search/booksearch">도서 검색</a></li>
					</ul>
				</c:if>

				<c:if test="${!empty vo1 }">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="/index">처음으로</a></li>
						<li class="nav-item"><a class="nav-link" href="/member/logout">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" href="/member/mypage">My page</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
						<li class="nav-item"><a class="nav-link" href="/search/booksearch">도서 검색</a></li>
					</ul>
				</c:if>
			</div>
		</div>
	</nav>

	<!-- Page Header -->
	<header class="masthead"
		style="background-image: url('/resources/img/post-bg.jpg')">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-md-10 mx-auto">
					<div class="page-heading">
						<h1>도서검색</h1>
						<form action="" id="searchForm" method="get">
						<select name="type" id="">
							<option value="">---</option>
							<option value="T" <c:out value=""/>>도서이름</option>
							<option value="G" <c:out value=""/>>장 르</option>
							<option value="W" <c:out value=""/>>저 자</option>
						</select>
						<input type="text" name="keyword" value="" placeholder="검색어를 입력하세요."/>
						<button class="btn btn-warning">Search</button>
						</form>
							<!-- <div class="box">
								<div class="container-1">
									<input type="search" id="search" placeholder="검색어를 입력하세요." />
									<i class="fa fa-search"><span class="icon"></span></i>
								</div>
							</div> -->
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- /.panel-heading -->
	<div class="panel-body">
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>도서번호</th>
					<th>도서이름</th>
					<th>장 르</th>
					<th>저 자</th>
					<th>발행일</th>
					<th>도서상태</th>
					<th>대여기간</th>
				</tr>
			</thead>

		</table>
		
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
</body>
</html>