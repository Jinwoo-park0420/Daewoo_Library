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
					<li class="nav-item"><a class="nav-link" href="/member/logout">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link" href="/member/mypage">My page</a></li>
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
            <h1 align="center">Update User INFO</h1>
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
	      <h3 class="text-center" style="width:100%; padding-top:20px; padding-bottom:20px; text-align:center; background-color:#fe983b;">회원 정보 수정</h3>
	      <div class="col-xs-3 col-sm-3"></div>
	       <form method="post" action="/member/update" id="memberUpdate"  >
	         <table class="table table-striped" >
	            <tr>
	              <th>user ID</th>
	              <td><input type="text" value="${modelVO.userid}" class="form-control" name="userid" readonly="readonly"/></td>
	            </tr>
	            <tr>
	              <th>이름</th>
	              <td><input type="text" class="form-control" value="${modelVO.name}" name="name"  id="name" />
	              <small class="text-danger" id="name"></small></td>
	 
	            <tr>
	              <th>E-mail</th>
	              <td><input type="email" class="form-control" value="${modelVO.email}" name="email" id="email"/>
	              <small class="text-danger" id="email"></small></td>
	            </tr>
	 
	            <tr>
	              <th>전화번호</th>
	              <td><input type="tel" class="form-control" value="${modelVO.phone_number}" name="phone_number" id="phone_number" />
	              <small class="text-danger" id="phone_number"></small></td>
	            </tr>
	            <tr>
	              <th>주소</th>
	              <td><input type="text" class="form-control" name="address" value="${modelVO.address}" readonly="readonly"/></td>
	            </tr>
	            <tr>
	              <th>생일</th>
	              <td><input type="number" class="form-control"  name="birthYear"  value="${modelVO.birthYear}"  readonly="readonly"/></td>
	            </tr>
	            <tr class="text-center">
	              <td colspan="2">
	                <button type="submit" class="btn btn-primary " style="width:260px; height:50px;" id="">Submit</button>
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
   
  <!-- validation 라이브러리 삽입 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
  <!-- validation 사용자 작성 코드 삽입-->
  <script src="/resources/js/update.js"></script>
  

</body>

</html>
