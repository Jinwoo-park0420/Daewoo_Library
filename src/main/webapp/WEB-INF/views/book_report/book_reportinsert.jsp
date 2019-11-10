<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>독후감 제출</title>
<style>
textarea{resize:none;}
</style>
</head>
<body>
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
						<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
					</ul>
				</c:if>

				<c:if test="${!empty vo1 }">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="/member/index">처음으로</a></li>
						<li class="nav-item"><a class="nav-link" href="/member/logout">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" href="/member/mypage">My page</a></li>
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
<div class="container">
<table class="table table-striped">
	<thead>독후감 신청</thead>
	<tbody>
<form action="/book_report/book_reportinsert" method="post">
			<tr>
                <th>제목: </th>
                <td><input type="text" placeholder="제목을 입력하세요. " name="title" class="form-control"/></td>
            </tr>
            <tr>
            	<th>작성자:</th>
                <td><input type="text" placeholder="이름을 입력하세요" name="writer" class="form-control"/></td>
            </tr>
            <tr>
                <th>내용: </th>
                <td><textarea cols="20" rows="25" placeholder="내용을 입력하세요. " name="content" class="form-control"></textarea></td>
            </tr>
    
    <tr>        
         <th>파일첨부</th>   				<td><input type="file" name="uploadFile" id="uploadFile" multiple="multiple" class="form-control" placeholder="파일을 첨부하세요."/></td>
	
	</tr>
                        <tr>
                <td colspan="2">
                    <input type="submit" value="등록" class="btn btn-light pull-right "/>
                    <input type="button" value="reset" class="btn btn-light pull-left"/>
                    <input type="button" value="글 목록으로... " class="btn btn-light pull-right" onclick="javascript:location.href='/book_report/book_reportmain'"/>
                </td>
            </tr>
     </form>
</tbody>
</table>
</div>
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
</body>
</html>