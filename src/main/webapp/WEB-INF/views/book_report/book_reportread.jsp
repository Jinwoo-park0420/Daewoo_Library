<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
<title>글수정</title>
<style>
textarea{resize:none;}
</style>
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
					</ul>
				</c:if>

				<c:if test="${!empty vo1 }">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="/index">처음으로</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/member/logout">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/member/mypage">My page</a></li>
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
                <form id='operForm' action="modify" method="get">
<table class="table table-striped">
	<thead>${report_select.bno}번 글</thead>
	<tbody>
			<tr>
                <th>제목: </th>
                <td><input type="text" value="${report_select.title}" name="title" class="form-control" readonly="readonly"/></td>
            </tr>
            <tr>
            	<th>작성자:</th>
                <td><input type="text" value="${report_select.writer}" name="writer" class="form-control" readonly="readonly"/></td>
            </tr>
            <tr>
                <th>내용: </th>
                <td><textarea cols="20" rows="25" name="content" class="form-control" readonly="readonly">${report_select.content}</textarea></td>
            </tr>
                        <tr>
                <td colspan="2">
                    <button data-oper='modify' class="btn btn-light pull-right">수정하기</button>
                    <button data-oper='delete' class="btn btn-light pull-right ">삭제하기</button>
                    <button data-oper='list' class="btn btn-light pull-left ">목록으로</button>
                
					<input type='hidden' id='bno' name='bno' value='<c:out value="${report_select.bno}"/>'>					
                </td>
            </tr>     
</tbody>
</table>
				</form>
</div>
   <script src='{% static "js/jquery-1.11.3.min.js" %}'></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
 $(function() {
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function() {
	operForm.attr("action", "/book_report/book_reportmodify").submit();
	})
	$("button[data-oper='delete']").on("click", function() {
	operForm.attr("action", "/book_report/book_reportdelete").submit();
	})
	
	$("button[data-oper='list']").on("click", function() {
		operForm.find("#bno").remove();
		operForm.attr("action", "/book_report/book_reportmain")
			operForm.submit();
		})

	})
</script>

</body>
</html>