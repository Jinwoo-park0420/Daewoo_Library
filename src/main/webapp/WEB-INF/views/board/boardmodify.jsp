<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../board/header.jsp" %> <!-- 제이쿼리사용을 위해 header에 몰아둠 -->
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
<title>글 수정하기</title>
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
	<thead>${vo.bno}번 글 수정하기</thead>
	<tbody>
<form role="form" action="/board/modify" method="post">
			<tr>
                <th>제목: </th>
                <td><input type="text" value="${vo.title}" name="title" class="form-control" required/></td>
                <input type="hidden" value="${vo.bno}" name="bno"/>
            </tr>
            <tr>
            	<th>작성자:</th>
                <td><input type="text" value="${vo.writer}" name="writer" class="form-control" readonly="readonly"/></td>
            </tr>
            <tr>
                <th>내용: </th>
                <td><textarea cols="20" rows="25" name="content" class="form-control" required>${vo.content}</textarea></td>
            </tr>
            <tr>
                <th>비밀번호: </th>
                <td><input type="password" name="password" class="form-control" required /></td>
            </tr>
                        <tr>
                <td colspan="2">

                    <button type="submit" data-oper='modify' class="btn btn-light pull-right ">수정완료</button>
                    <button type="submit" onclick="location.href='/board/boardmain'" class="btn btn-light pull-right ">목록으로</button>
                    <button type="submit" onclick="location.href='/board/boarddelete?bno=${vo.bno}'" class="btn btn-light pull-left">삭제하기</button>
                    <!-- <button type="submit" data-oper='remove' class="btn btn-light pull-left ">삭제하기</button> -->
                    <!-- <button type="submit" data-oper='list' class="btn btn-light pull-right ">목록으로</button> -->
                </td>
            </tr>
     </form>
</tbody>
</table>
</div>
</body>
<!-- <script>
$(function(){
	//remove와 list 버튼이 눌러지면 새로 만든 폼 보내고
	//modify 버튼이 눌러지면 원래의 폼 보내기
	var formObj=$("#operForm");
	
	$("button").click(function(e){
		//submit 막기
		e.preventDefault();
		
		var oper=$(this).data("oper");
		
		if(oper=='remove'){
			formObj.attr('action','/board/boarddelete');
			formObj.attr('method','get')
			formObj.submit();
		}else if(oper=='list'){
			formObj.attr('action','/board/boardmain');
			formObj.attr('method','get');
		}else{ //oper=> modify
			formObj=$("form[role='form']");
		}
})
</script> -->
</html>