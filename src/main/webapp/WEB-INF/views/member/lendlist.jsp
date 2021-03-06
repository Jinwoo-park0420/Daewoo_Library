<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<title>게시판</title>

<style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
 
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
						<li class="nav-item"><a class="nav-link"
							href="/member/logout">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/member/mypage">My page</a></li>
						<li class="nav-item"><a class="nav-link">${vo1.userid}님</a></li>
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
	<h3 align="center">내 활동 조회</h3>
	</div>
	<div class="container">
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>번 호</th>
					<th>제 목</th>
					<th>작 성 자</th>
					<th>작 성 일</th>
					<th>조 회 수</th>
				</tr>
			</thead>
			<c:set var="page" value="${pageVO.cri.pageNum}"/>
			<%  
				Integer page1=(Integer)pageContext.getAttribute("page");
			
							
			    int start=(page1-1)*10+1;
			
			%>
			<c:forEach var="vo" items="${list}">
			<tbody>
				<tr>
					<td><%=start%></td>				
					<td><a href="/board/boardread?bno=<c:out value='${vo.bno}'/>" class="move">${vo.title}</a>[${vo.replycnt}]</td>
					<td>${vo.writer}</td>
					<td><fmt:formatDate value="${vo.updatedate}" pattern="yyyy-MM-dd HH:mm"/></td>
					<td>${vo.readcnt}</td>
				</tr>
				<%
					start=start+1;
				%>
				</c:forEach>	
			</tbody>
		</table>
		<div><p>총 게시글 수: ${pageVO.total}</p></div>
		<div>
			<a class="btn btn-dark pull-right" href="/board/boardinsert">글쓰기</a>
		</div>
			<input type="hidden" value="${pageVO.prev}" />
			<input type="hidden" value="${pageVO.next}" />
			<input type="hidden" value="${pageVO.startPage}" />
			<input type="hidden" value="${pageVO.endPage}" />
				<div class="text-center container">
					<ul class="pagination">
						<c:if test="${pageVO.prev}">
						<li class="paginate_button previous"><a class="btn btn-light" href="${pageVO.startPage-1}">이전</a></li>
						</c:if>
						<c:forEach var="idx" begin="${pageVO.startPage}" end="${pageVO.endPage}">
                            <li class="paginate_button ${pageVO.cri.pageNum==idx?'active':''}">
                            	<a href="${idx}" class="btn btn-light">${idx}</a>
                            </li>
                        </c:forEach>
						<c:if test="${pageVO.next}">
						<li class="paginate_button next"><a class="btn btn-light" href="${pageVO.endPage+1}">다음</a></li>
					</c:if>
					</ul>
				</div>
				<div>
				<form action="" id="searchForm" method="get">
				<select name="type" id="">
				<option value="">---</option>
   				<option value="T" <c:out value="${pageVO.cri.type eq 'T'?'selected':''}"/>>제목</option>
                <option value="C" <c:out value="${pageVO.cri.type eq 'C'?'selected':''}"/>>내용</option>
                <option value="W" <c:out value="${pageVO.cri.type eq 'W'?'selected':''}"/>>작성자</option>
                </select>
				<input type="text" name="keyword" value="${pageVO.cri.keyword}"/>
                <input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}"/>
                <input type="hidden" name="amount" value="${pageVO.cri.amount}"/>
                <button class="btn btn-default">검색</button>
			</form><!-- 검색종료 -->
		</div>				
	</div>
			

<%-- 페이지 번호를 클릭하면 보낼 폼 --%>
<form action="" id="actionForm">
	<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}" />
	<input type="hidden" name="amount" value="${pageVO.cri.amount}" />
	<input type="hidden" name="type" value="${pageVO.cri.type}" />
	<input type="hidden" name="keyword" value="${pageVO.cri.keyword}" />
</form>

<script>
//하단의 페이지 번호 클릭시 작동하는 스크립트
var actionForm=$("#actionForm");
$(".paginate_button a").click(function(e){
	e.preventDefault(); //a 태그의 동작 막기
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	actionForm.submit();
})


//검색 버튼이 눌러지면 작동할 스크립트
	$(".btn-default").click(function(){
		var searchForm=$("#searchForm");
		//검색조건이나 검색어가 비어 있는지 확인하고
		//알림창 띄우고
		//비어 있으면 searchForm으로 되돌려 보내기
		if(!searchForm.find("option:selected").val()){
			alert("검색 종류를 선택하세요");
			return false;
		}
		if(!searchForm.find("input[name='keyword']").val()){
			alert("검색어를 선택하세요");
			searchForm.find("input[name='keyword']").focus();
			return false;
		}
		//검색폼을 보내기 전에 pageNum값을 1로 변경 후 보내기
		searchForm.find("input[name='pageNum']").val("1");
		
		searchForm.submit();
	})

</script>


<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="/resources/js/clean-blog.min.js"></script>
</body>
</html>