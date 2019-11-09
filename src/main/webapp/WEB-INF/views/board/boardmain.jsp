<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>

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
					</ul>
				</c:if>

				<c:if test="${!empty vo1 }">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="/index">처음으로</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/member/logout">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/member/mypage">My page</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
					</ul>
				</c:if>
			</div>
		</div>
	</nav>
<header class="masthead" style="background-image: url('/resources/img/bookk.jpg')">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="site-heading">

						<div class="navbar">
						</div>
			</div>
		</div>
		</div>
		</div>
</header>
			
						
					
		<!-- Main Content -->
	<div>
	<h3 align="center">건의사항</h3>
	</div>
	<div class="container">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>번 호</th>
					<th>제 목</th>
					<th>작 성 자</th>
					<th>작 성 일</th>
					<th>조 회 수</th>
				</tr>
			</thead>
			<c:forEach var="vo" items="${list}">
			<tbody>
				<tr>
					<td>${vo.bno}</td>
					<td><a href="/board/boardread?bno=<c:out value='${vo.bno}'/>" class="move">${vo.title}</a></td>
					<td>${vo.writer}</td>
					<td>${vo.regdate}</td>
					<td>${vo.readcnt}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
			<a class="btn btn-dark pull-right" href="/board/boardinsert">글쓰기</a>
				<div class="text-center">
					<ul class="pagination">
					
						<li><a class="btn btn-default" href="#">이전</a></li>
						<li><a class="btn btn-default" href="#">1</a></li>
						<li><a class="btn btn-default" href="#">2</a></li>
						<li><a class="btn btn-default" href="#">3</a></li>
						<li><a class="btn btn-default" href="#">4</a></li>
						<li><a class="btn btn-default" href="#">5</a></li>
						<li><a class="btn btn-default" href="#">다음</a></li>
					</ul>
				</div>
			</div>

<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="/resources/js/clean-blog.min.js"></script>
</body>
</html>