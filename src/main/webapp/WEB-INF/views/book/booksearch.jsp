<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<%-- <%@include file="../board/header.jsp" %> --%> <!-- 제이쿼리사용을 위해 header에 몰아둠 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="UTF-8">
<title>대우 도서관 - 전체목록 페이지</title>
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

.modal-header{
	background-color: #dee2e6;
}
.modal-footer{
	background-color: #dee2e6;
}
.modal-title{
	font-family: 'Nanum Pen Script', cursive;
}
.modal-content{
	background-color: #e9ecef;
}
.form-group{
	font-family: 'Jeju Gothic', sans-serif;
	padding:0px;
	font-weight:bold;
	margin-bottom:5px;
}
.form-control{
	font-family: 'Jeju Hallasan', cursive;
	background-color: #e9ecef;
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
						<h1>자료검색</h1>
						<form action="booksearch" id="searchForm" method="get">
							<select name="type" id="">
								<option value="">---</option>
								<option value="bookname" <c:out value="${pageVO.cri.type eq 'bookname'?'selected':'' }"/>>도서명</option>
								<option value="writer" <c:out value="${pageVO.cri.type eq 'writer'?'selected':'' }"/>>저 자</option>
								<option value="publisher" <c:out value="${pageVO.cri.type eq 'publisher'?'selected':'' }"/>>출판사</option>
							</select> 	
							<input type="text" name="keyword" value="" placeholder="검색어를 입력하세요" />
							<button class="btn btn-outline-light" type="submit">Search</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="container">
		<div class="row">
			<div id="list-example" class="list-group" role="tablist">
				<a class="list-group-item list-group-item-action" href="booksearch">전체 목록</a>
				<a class="list-group-item list-group-item-action" href="newbook">신규 도서</a>
				<a class="list-group-item list-group-item-action" href="recommandbook">추천 도서</a>
				<a class="list-group-item list-group-item-action" href="popularbook">인기 도서</a>
				<a class="list-group-item list-group-item-action" href="loanbook">대출 급상승 도서</a>
			</div>

			<div class="panel-body col-lg-8 mx-10">
    			<table class="table table-striped table-bordered table-hover" style="width: 1000px">
    				<thead>
    					<tr align="center">
                    		<th></th>
                    		<th width="auto">도서명</th>
                    		<th width="110px">장 르</th>
                    		<th width="175px">저 자</th>
                    		<th width="110px">출판사</th>
                    		<th width="110px">도서상태</th>
                		</tr>									
            		</thead>
					<tbody>
					<c:forEach var="vo" items="${list}">
							<tr>
								<td><img src="/resources/thumb/${vo.bookno}.jpg" width="100" height="150"></td>
								<td><a href="<c:out value='${vo.bookno }'/>" class="move">${vo.bookname}</a></td>
								<td>${vo.genre }</td>
								<td align="justify">${vo.writer }</td>
								<td>${vo.publisher }</td>
								<td>
									<c:if test="${vo.status==0}">
									<span style="color: #0000ff;font-weight: bold;display: table;margin-left: auto;margin-right: auto;">대여가능</span>
									</c:if>
									<c:if test="${vo.status==1}">
									<span style="color: #ff0000;font-weight: bold;display: table;margin-left: auto;margin-right: auto;">대여중</span>
									</c:if>
								</td>
							</tr>
							
					</c:forEach>
					</tbody>
				</table>
	<!-- start Pagination -->
	<div class="text-center col-lg-8.5" style="margin-left: auto;width: 1000px">
    	<ul class="pagination" style="display: -webkit-inline-box;">
        	<c:if test="${pageVO.prev }">	
            	<li class="paginate_button previous">
                	<a href="${pageVO.startPage-1}" class="btn btn-light">이전</a>
                </li>
                </c:if>
                <c:forEach var="idx" begin="${pageVO.startPage }" end="${pageVO.endPage }" >
	            	<li class="paginate_button ${pageVO.cri.pageNum==idx?'active':'' }">
	                	<a href="${idx }" class="btn btn-light">${idx }</a>
	                </li>
                    </c:forEach>
                    <c:if test="${pageVO.next }">
	                	<li class="paginate_button next">
		                	<a href="${pageVO.endPage+1 }" class="btn btn-light">다음</a>
	                   	</li>
                    </c:if>
                </ul>
			</div>
            <!-- end Pagination -->
			</div>
            	</div>
	</div>
<!-- 페이지 번호를 클릭하면 보낼 폼 -->
<form action="" id="actionForm">
	<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum }" />
	<input type="hidden" name="amount" value="${pageVO.cri.amount}" />
	<input type="hidden" name="type" value="${pageVO.cri.type}" />
	<input type="hidden" name="keyword" value="${pageVO.cri.keyword}" />
</form>

<!-- Modal -->
<div class="modal fade" id="bookDetailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog" style="width:900px;display: table;" role="document">
    <div class="modal-content" style="width:900px; border-radius: 10px">
      <div class="modal-header">
        <h1 class="modal-title" id="exampleModalCenterTitle">도서 상세정보</h1>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="row" style="float: left; padding:15px">
      	<div>
      		<img class="imgModal" src="" width="300" height="400" style="border: 1px solid green; border-radius: 10px">
      	</div>
      </div>    	
      <div class="" style="padding:20px; float: left; width: 60%">
      	<div class="form-group">
      		<label for="bookname" style="margin-bottom:1px;">도서명 : </label>
      		<input type="text" class="form-control" id="bookname" name="bookname" style="font-size:14pt; border:0px; width:550px; height:30px; padding-left:8px;" readonly/>
      	</div>
      	<div class="form-group">
      		<label for="writer" style="margin-bottom:1px;">저 자 : </label>
      		<input type="text" class="form-control" id="writer" name="writer" style="font-size:14pt; border:0px; width:500px; height:30px; padding-left:8px;" readonly/>
      	</div>
      	<div class="form-group">
      		<label for="publisher" style="margin-bottom:1px;">출판사 : </label>
      		<input type="text" class="form-control" id="publisher" name="publisher" style="font-size:14pt; border:0px; width:500px; height:30px; padding-left:8px;" readonly/>
      	</div>
      	<div class="form-group">
      		<label for="genre" style="margin-bottom:1px;">장 르 : </label>
      		<input type="text" class="form-control" id="genre" name="genre" readonly/>
      	</div>
      	<div class="form-group">
      		<label for="isbn" style="margin-bottom:1px;">isbn : </label>
      		<input type="text" class="form-control" id="isbn" name="isbn" readonly/>
      	</div>
      	<div class="form-group">
      		<label for="status" style="margin-bottom:1px;">도서상태 : </label>
      		<input type="text" class="form-control" id="status" name="status" readonly/>
      	</div>
      	<div class="form-group">
      		<label for="bookno" style="margin-bottom:1px;"></label>
      		<input type="hidden" class="form-control" id="bookno" name="bookno"/>
      	</div>
      	</div>
		</div>
      <div class="modal-footer">
      	<button class="btn btn-primary" id="rentalBtn" role="button">대여신청</button>
      	<button class="btn btn-danger" id="returnBtn" role="button">반납</button>
      	<button class="btn btn-dark" id="closeBtn" type="submit">목록으로</button>
      </div>
    </div>
  </div>
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
//검색 버튼이 눌러지면 작동할 스크립트
$(".btn-outline-light").click(function(e){
	e.preventDefault();
	var searchForm=$("#searchForm");
	//검색조건이나 검색어가 비어있는지 확인하고
	//알림창 띄우고
	//비어 잇으면 searchForm으로 되돌려 보내기
	if(!searchForm.find("option:selected").val()){
		alert("검색 종류를 선택하세요");
		return false;
	}
	if(!searchForm.find("input[name='keyword']").val()){
		alert("검색어를 입력하세요");
		searchForm.find("input[name='keyword']").focus();
		return false;
	}
	//검색 폼을 보내기 전에 pageNum값을 1로 변경 후 보내기
	searchForm.find("input[name='pageNum']").val("1");
	searchForm.submit();
})

	//하단의 페이지 번호 클릭시 작동하는 스크립트
	var actionForm=$("#actionForm");
	$(".paginate_button a").click(function(e){
		e.preventDefault(); //a 태그의 동작 막기
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	})

 	//제목을 클릭하면 실행될 스크립트
	var modal=$("#bookDetailModal");
	$(".move").click(function(e){
		e.preventDefault(); //a 태그 막기
		console.log("도서 상세정보 클릭");		
		var bookno=$(this).attr("href");
		
		//bno를 보내서 해당 책 정보 가져오기
		$.getJSON({
			url:'/book/bookDetail',
			data:{
				bookno:bookno
			},
			success:function(result){
				console.log(result);
				//result 값을 모달 안에 넣어주기
						
				var bookno = result.bookno;
				var bookname=result.bookname;
				var writer = result.writer;
				var genre = result.genre;
				var publisher = result.publisher;
				var status = result.status;
				var isbn = result.isbn;
					
				$("#exampleModalCenterTitle").val(exampleModalCenterTitle);
				$("#bookno").val(bookno);	
				$("#bookname").val(bookname);
				$("#writer").val(writer);
				$("#genre").val(genre);
				$("#publisher").val(publisher);
				$("#status").val(status);
				var colorChange=$("#status");
				if(status==0){
					$("#status").val("대여 가능");
					$(colorChange).css("color","#0000ff");
					$("#rentalBtn").show();
					$("#returnBtn").hide();
				}else{
					$("#status").val("대여 중")
					$(colorChange).css("color","#ff0000");
					$("#rentalBtn").hide();
					$("#returnBtn").show();
				}
				$("#isbn").val(isbn);
								
				modal.find(".imgModal").attr("src","/resources/thumb/"+bookno+".jpg");
															
				modal.modal("show");

			}			
		
		})

		
	//대여하기 버튼 클릭시 실행될 스크립트
	$("#rentalBtn").click(function(e){
		e.preventDefault();
		console.log("도서 대여~~");
		var bookno=$("#bookno").val();
		var bookname=$("#bookname").val();
		$.ajax({
			url:"/book/bookRental",
			method:"GET",
			data:{"bookno":bookno,
				"bookname":bookname
			},
			success:function(data){
				if(data=="false"){
					alert(bookname+"\n 도서대여가 완료되었습니다.");
				}else{
					alert("도서대여 실패!");
				}
			}
		})
		modal.modal("hide");
		location.href="/book/booksearch";
	})
	
	
	
	
	
	//반납하기 버튼 클릭시 실행될 스크립트
	$("#returnBtn").click(function(e){
		e.preventDefault();
		console.log("도서 반납~~");
		var bookno=$("#bookno").val();
		var bookname=$("#bookname").val();
		$.ajax({
			url:"/book/bookDetail",
			method:"POST",
			data:{"bookno":bookno,
				"bookname":bookname
			},
			success:function(data){
				if(data=="false"){
					alert(bookname+"\n 도서반납이 완료되었습니다.");
					
				}else{
					alert("도서반납 실패!");
				}
			
			}
			
		})
		modal.modal("hide");
		location.href="/book/booksearch";
	})
	
	$("#closeBtn").click(function(e){
		e.preventDefault();
		modal.modal("hide");
	})
	}) 

})
</script>
</html>