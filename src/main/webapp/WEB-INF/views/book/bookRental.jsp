<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<%-- <%@include file="../board/header.jsp" %> --%> <!-- 제이쿼리사용을 위해 header에 몰아둠 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="UTF-8">
<title>대우 도서관 - 도서대여 페이지</title>
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
<!-- Modal 창 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(//fonts.googleapis.com/earlyaccess/jejuhallasan.css);

.form-group{
	font-family: 'Jeju Gothic', sans-serif;
	padding:0px;
	font-weight:bold;
	margin-bottom:5px;
}

.form-control{
	font-family: 'Jeju Hallasan', cursive;
	background-color: #fff;
	font-size:14pt;
	border:0px;
	width:200px;
	height:30px;
	padding-left:8px;
}
</style>
</head>
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
		style="background-image: url('/resources/img/post-bg.jpg')">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-md-10 mx-auto">
					<div class="page-heading">
						<h1>도서 대여신청</h1>

					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="container">
		<div class="row">

	  <div class="contents">
      <div class="row" style="float: left; padding:15px">
      	<div>
      		<img src="/resources/thumb/${vo.bookno}.jpg" width="300" height="400" style="border: 1px solid green; border-radius: 10px">
      	</div>
      </div>    	
      <div class="" style="padding:20px; float: left; width: 60%">
      	<div class="form-group">
      		<label for="bookname" style="margin-bottom:1px;">도서명</label>
      		<input type="text" class="form-control" id="bookname" name="bookname" value="${vo.bookname}" style="font-size:14pt; border:0px; width:550px; height:30px; padding-left:8px;" readonly/>
      	</div>
      	<div class="form-group">
      		<label for="writer" style="margin-bottom:1px;">저 자</label>
      		<input type="text" class="form-control" id="writer" name="writer" value="${vo.writer}" style="font-size:14pt; border:0px; width:500px; height:30px; padding-left:8px;" readonly/>
      	</div>
      	<div class="form-group">
      		<label for="publisher" style="margin-bottom:1px;">출판사</label>
      		<input type="text" class="form-control" id="publisher" name="publisher" value="${vo.publisher}" style="font-size:14pt; border:0px; width:500px; height:30px; padding-left:8px;" readonly/>
      	</div>
      	<div class="form-group">
      		<label for="genre" style="margin-bottom:1px;">장 르</label>
      		<input type="text" class="form-control" id="genre" name="genre" value="${vo.genre}" readonly/>
      	</div>
      	<div class="form-group">
      		<label for="isbn" style="margin-bottom:1px;">isbn</label>
      		<input type="text" class="form-control" id="isbn" name="isbn" value="${vo.isbn }" readonly/>
      	</div>
      	<div class="form-group">
      		<label for="status" style="margin-bottom:1px;"></label>
      		<input type="hidden" class="form-control" id="status" name="status" value="${vo.status}" readonly/>
      	</div>
      	<div class="form-group">
      		<label for="bookno" style="margin-bottom:1px;"></label>
      		<input type="hidden" class="form-control" id="bookno" name="bookno" value="${vo.bookno }" readonly />
      	</div>
      	</div>
		</div>
		</div>
        
	</div>
	 <div class="contents-footer">
      	<button class="btn btn-dark" id="moveBtn2" role="button" style="margin-left:125px;">대여신청</button>
      	<button class="btn btn-dark" id="closeBtn" type="submit">이전페이지로</button>
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
</body>

<script>
$(function(){
//대여하기 버튼 클릭시 실행될 스크립트
	$("#moveBtn2").click(function(){
		
		console.log("도서 대여신청");
		var bookno=$("#bookno").val();
		var status=$("#status").val();
		$.ajax({
			url:"/book/bookRental",
			method:"GET",
			data:{"bookno":bookno},
			success:function(data){
				if(data){
					console.log("data : "+data);
				}else{
					console.log("No data");
				}
			
			}
			
		})

		
		
		alert("대여 신청 완료");
		//location.href="/book/booksearch";
	})
	
	$("#closeBtn").click(function(){
		
		history.back();
	})
})
</script>
</html>