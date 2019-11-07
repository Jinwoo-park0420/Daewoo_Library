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
<title>글작성</title>
</head>
<body>
<div>
<form action="/board/insert" method="post"></div>
<div>
<label>작성자</label> <input type="text" value="아이디넣을거" name="writer"/></div>
<div>
<label>제목</label> <input type="text" name="title"/></div>
<div>
<label>내용</label> <textarea name="content" id="" cols="30" rows="10"></textarea></div>
<button type="submit" class="btn btn-primary">등록하기</button>
<button type="reset" class="btn btn-primary">다시쓰기</button>
</div>
</form>
</body>
</html>