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

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
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
            <h1 align="center">Change Password</h1>
          </div>
        </div>
      </div>
    </div>
  </header>
	<!-- Post Content -->
  <hr>
  
<div class="rows">
	<div class="container">
		<div class="col-lg-12">
	      <h3 class="text-center" style="width:100%; padding-top:20px; padding-bottom:20px; text-align:center; background-color:#d1c9b7;">비밀번호 변경</h3>
		<div class="col-xs-3 col-sm-3"></div>
	        <!-- <p>&nbsp;</p> -->
	         <form method="post" action="/member/chPwd" name="form_chpwd" id="chPwd" >
	         <table class="table table-striped" >
	            <tr>
	              <th>user ID</th>
	              <td><input type="text" value="${vo1.userid}" class="form-control" name="name" readonly="readonly"/>
	              <small class="text-danger" id="name"></small>
	              </td>
	              
	            </tr>
	            <tr>
	              <th>현재 비밀번호</th>
	              <td><input type="password" id="current_password" class="form-control" name="current_password" />
	               <small class="text-danger" id="current_password"></small>
	              </td>
	            </tr>
	            <tr>
	              <th>변경할 비밀번호</th>
	              <td><input type="password" id="new_password" class="form-control" name="new_password" />
	              <small class="text-danger" id="new_password"></small>
	              </td>
	            </tr>
	            <tr>
	              <th>비밀번호 확인</th>
	              <td><input type="password" id="confirm_password" class="form-control" name="confirm_password" />
	              <small class="text-danger" id="confirm_password"></small>
	              </td>
	            </tr>
	            <tr class="text-center">
	              <td colspan="2">
	                <button type="submit" class="btn btn-primary" onclick="location.href='/index'" style="width:260px; height:50px;" id="">변경하기</button>
	             	<button type="reset" class="btn btn-primary" id="">Reset</button>
	              </td>
	            </tr>
	         </table>
	         </form>
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
