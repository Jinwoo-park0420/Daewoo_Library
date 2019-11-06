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
	<header class="masthead"
		style="background-image: url('/resources/img/home-bg.jpg')">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="site-heading">
				
						<div class="box">
							<div class="container-1">
							글 검색<input type="search" id="search" placeholder="Search..." /> <i class="fa fa-search"><span class="icon"></span></i>

							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</header>
	
		<!-- Main Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="post-preview">
					<table>
					<tr>
					<th>번 호   </th>
					<th>제 목   </th>
					<th>작 성 자   </th>
					<th>작 성 일   </th>
					<th>조 회 수   </th>
					</tr>
					<c:forEach var="vo" items="${list}">
					<tr>
					<td>${vo.bno}</td>
					<td>${vo.title}</td>
					<td>${vo.writer}</td>
					<td>${vo.regdate}</td>
					<td>${vo.readcnt}</td>
					</tr>
					</c:forEach>
					</table>
				</div>
				<hr>
				<div class="post-preview">
					
				</div>
				
				</div>

				</div>
				<!-- Pager -->
				<div class="clearfix">
					<a class="btn btn-primary float-right" href="/board/boardinsert">글쓰기
						&rarr;</a>
				</div>
			</div>
		</div>
	</div>


<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="/resources/js/clean-blog.min.js"></script>
</body>
</html>