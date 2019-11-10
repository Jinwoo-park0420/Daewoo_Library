<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Clean Blog - Start Bootstrap Theme</title>

  <!-- Bootstrap core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="/resources/css/clean-blog.min.css" rel="stylesheet">

<!-- 	<style>
  	div#myinfo_left{
  		width:13%;
  		height:98%;
  		background-color: white;
  		float:left;
  	}
  	#myinfo_right{
  		width:13%;
  		height:98%;
  		background-color: white;
  		float:right;
  	}
  	#myinfo_btn{
  		width:230px;
  		height:50px;
  		margin: center;
  	}
	</style> -->

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
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
  <!-- Page Header -->
  <header class="masthead" style="background-image: url('/resources/img/post-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="post-heading">
            <h1 align="center">My page</h1>
          </div>
        </div>
      </div>
    </div>
  </header>
 <!--    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
  <!-- Post Content -->
  <hr>

	
  
<div class="row">
	<div class="container">
		<div class="col-lg-12">
			<div class="myinfo-context">
			 <h3 class="text-center" style="width:100%; padding-top:20px; padding-bottom:20px; text-align:center; background-color:#8099af; ">회원 정보</h3>
				<h3 class="text-center">Myinfo</h3>
			<div class="myinfo-body">
				<div class="table-response">
					<table class="table table-striped" style="align:center">
						<thead>
							<tr>
								<th>이름</th>
								<th>user ID</th>
								<th>Address</th>
								<th>BirthYear</th>
								<th>Email</th>
								<th>phone number</th>
							</tr>
						</thead>
							<c:forEach items="${list}" var="vo">
						<tbody>
							<tr>
								<td>${vo.name}</td>
								<td>${vo.userid}</td>
								<td>${vo.address}</td>
								<td>${vo.birthYear}</td>
								<td>${vo.email}</td>
								<td>${vo.phone_number}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			</div>
			<div class="myinfo-btn">
			<button type="button" class="btn btn-primary btn-block" style="width:260px; height:50px;" id=""><a href="/member/update">회원수정페이지</a></button>
 			<button type="button" class="btn btn-primary btn-block" style="width:260px; height:50px;" id=""><a href="/member/leave">회원탈퇴페이지</a></button>
  			<button type="button" class="btn btn-primary btn-block" style="width:260px; height:50px;" id="">내가 쓴 게시글 보기</button>
			
			</div>
		</div>
	</div>
</div>
	
	
	<hr>
  <!-- Footer -->
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <ul class="list-inline text-center">
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
          </ul>
          <p class="copyright text-muted">Copyright &copy; Your Website 2019</p>
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
