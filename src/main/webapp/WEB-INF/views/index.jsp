<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>대우 도서관</title>
<!-- 검색박스용 -->
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

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
<link href="/resources/css/button-select.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/button-select.css"
	type="text/css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
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
<script>
$(function(){
	var message='${message}';
	if(message!="" && message.length !=0){
		alert(message);
		
	}
	
	
})

</script>
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
						<li class="nav-item"><a class="nav-link">${vo1.userid}님</a></li>
					</ul>
				</c:if>
			</div>
		</div>
	</nav>

	<!-- Page Header -->
	<header class="masthead"
		style="background-image: url('/resources/img/home-bg.jpg')">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="site-heading">

						<div class="navbar">
							<br>
							<li class="menu"><a href="/book/booksearch">자료 검색</a>
								<ul class="hide">
									<li><a href="#">신간 자료</a></li>
									<li><a href="#">베스트셀러</a></li>
									<li><a href="#">청소년 권장도서</a></li>
								</ul></li>

							<li class="menu"><a href="board/boardinfo">소통 참여</a>
								<ul class="hide">
									<li><a href="/board/boardmain">건의사항</a></li>
									<li><a href="#">도서 신청</a></li>
									<li><a href="/boardcompetition/boardcompetition">독후감 대회</a></li>
								</ul></li>
							<li class="menu"><a href="/book/bookapply" class="applyBook">도서
									신청</a>
						</div>
						<div class="container">
							<br />
						</div>
						<div class="row justify-content-center">
							<div class="col-12 col-md-10 col-lg-8">
								<form action="/book/booksearch" id="searchForm" method="get">
							<select name="type" id="">
								<option value="">---</option>
								<option value="bookname" <c:out value="${pageVO.cri.type eq 'bookname'?'selected':'' }"/>>도서명</option>
								<option value="writer" <c:out value="${pageVO.cri.type eq 'writer'?'selected':'' }"/>>저 자</option>
								<option value="publisher" <c:out value="${pageVO.cri.type eq 'publisher'?'selected':'' }"/>>출판사</option>
							</select> 
							<input type="text" name="keyword" value="" placeholder="검색어를 입력하세요" />
							<button class="btn btn-outline-light" type="submit">Search</button>
						</form>
							
							<!--end of col-->
						</div>
					</div>

				</div>
				<br>


			</div>
		</div>
	
	</header>

	<!-- Main Content -->



	<div class="container" style="margin-left: 15%">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="post-preview" style="width: 1000px">
				<hr>
					<a href="/book/newbook">
						<h2 class="post-title">신규도서</h2>
					</a>
					<a href="<c:out value='21'/>" class="move">
						<img src="/resources/thumb/21.jpg" width="150px" height="210px" style="margin-left: 20px">
					</a>
					<a href="<c:out value='22'/>" class="move">
						<img src="/resources/thumb/22.jpg" width="150px" height="210px" style="margin-left: 20px">
					</a>
					<a href="<c:out value='23'/>" class="move">	
						<img src="/resources/thumb/23.jpg" width="150px" height="210px" style="margin-left: 20px">
					</a>
					<a href="<c:out value='24'/>" class="move">
						<img src="/resources/thumb/24.jpg" width="150px" height="210px" style="margin-left: 20px">
					</a>
					<a href="<c:out value='25'/>" class="move">
						<img src="/resources/thumb/25.jpg" width="150px" height="210px" style="margin-left: 20px">
					</a>
				</div>
				<hr>
				<div class="post-preview" style="width: 1000px">
					<a href="/book/popularbook">
						<h2 class="post-title">인기도서</h2>
					</a>
					<a href="<c:out value='1'/>" class="move">
						<img src="/resources/thumb/1.jpg" width="150px" height="210px" style="margin-left: 20px">
					</a>
					<a href="<c:out value='2'/>" class="move">
						<img src="/resources/thumb/2.jpg" width="150px" height="210px" style="margin-left: 20px">
					</a>
					<a href="<c:out value='3'/>" class="move">
						<img src="/resources/thumb/3.jpg" width="150px" height="210px" style="margin-left: 20px">
					</a>
					<a href="<c:out value='4'/>" class="move">
						<img src="/resources/thumb/4.jpg" width="150px" height="210px" style="margin-left: 20px">
					</a>
					<a href="<c:out value='5'/>" class="move">	
						<img src="/resources/thumb/5.jpg" width="150px" height="210px" style="margin-left: 20px">
					</a>
				</div>
				<hr>
				<div class="post-preview" style="width: 1000px">
					<a href="/book/recommandbook">
						<h2 class="post-title">추천도서</h2>
					</a>
					<a href="<c:out value='31'/>" class="move">
						<img src="/resources/thumb/31.jpg" width="150px" height="210px" style="margin-left: 20px">
					</a>
					<a href="<c:out value='32'/>" class="move">
						<img src="/resources/thumb/32.jpg" width="150px" height="210px" style="margin-left: 20px">
					</a>
					<a href="<c:out value='33'/>" class="move">
						<img src="/resources/thumb/33.jpg" width="150px" height="210px" style="margin-left: 20px">
					</a>
					<a href="<c:out value='34'/>" class="move">
						<img src="/resources/thumb/34.jpg" width="150px" height="210px" style="margin-left: 20px">
					</a>
					<a href="<c:out value='35'/>" class="move">
						<img src="/resources/thumb/35.jpg" width="150px" height="210px" style="margin-left: 20px">
					</a>
				</div>
				<hr>

				<!-- Pager -->
				<div class="clearfix" style="margin-left: 119.5%">
					<a class="btn btn-primary float-right" href="/book/booksearch">도서목록 보기 &rarr;</a>
				</div>
			</div>
		</div>
	</div>
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
      		<input type="text" class="form-control" id="bookname" name="bookname" style="font-size:14pt; border:0px; width:550px; height:30px; padding-left:8px;" readonly />
      	</div>
      	<div class="form-group">
      		<label for="writer" style="margin-bottom:1px;">저 자 : </label>
      		<input type="text" class="form-control" id="writer" name="writer" style="font-size:14pt; border:0px; width:500px; height:30px; padding-left:8px;" readonly />
      	</div>
      	<div class="form-group">
      		<label for="publisher" style="margin-bottom:1px;">출판사 : </label>
      		<input type="text" class="form-control" id="publisher" name="publisher" style="font-size:14pt; border:0px; width:500px; height:30px; padding-left:8px;" readonly />
      	</div>
      	<div class="form-group">
      		<label for="genre" style="margin-bottom:1px;">장 르 : </label>
      		<input type="text" class="form-control" id="genre" name="genre" readonly />
      	</div>
      	<div class="form-group">
      		<label for="isbn" style="margin-bottom:1px;">isbn : </label>
      		<input type="text" class="form-control" id="isbn" name="isbn" readonly />
      	</div>
      	<div class="form-group">
      		<label for="status" style="margin-bottom:1px;">도서상태 : </label>
      		<input type="text" class="form-control" id="status" name="status" readonly />
      	</div>
      	<div class="form-group">
      		<label for="bookno" style="margin-bottom:1px;">${vo.bookno}</label>
      		<input type="hidden" class="form-control" id="bookno" name="bookno" value="${vo.bookno}"/>
      	</div>
      	<div class="form-group">
      		<label for="userid" style="margin-bottom:1px;">${vo.userid }</label>
      		<input type="hidden" class="form-control" id="userid" name="userid" value="${vo.userid }"/>
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

	<hr>

	<h1>대우 도서관 찾아오시는 길</h1>
 	<div id="mapdiv">

		<div id="map"></div>

	</div> 
	<label> 주소: 서울특별시 노원구 공릉1동 동일로 1082 </label>
	<br>

	<label>전화: 02-987-0012</label>
	<br>
	<br>
	<!-- Footer -->
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

<!-- 세션이 없을 경우 도서신청 하면 alter뜨게 나옴 후 login페이지로 이동시킬예정  -->
<!-- 	<script>
		$(function() {
			
			var applybook = $(".applybook");
			$(".applyBook").click(function(e) {
				e.preventDefault();
				alert("로그인 후에 이용하세요 ");
				applybook.action="/member/login";
				applybook.submit();
			})
		})
	</script>
 --> 	
 
 <script>
		//GoogleMap//
		function initMap() {
			var latitude = 37.626636;
			var longitude = 127.072824;

			var seoul = {
				lat : latitude,
				lng : longitude
			};
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 15,
				center : seoul
			})

			var marker = new google.maps.Marker({
				position : seoul,
				map : map,
				title : "대우 도서관"
			});
			marker.setMap(map);

		}
		
		
		$(function(){
		//검색 버튼이 눌러지면 작동할 스크립트
		$(".btn-outline-light").click(function(){
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
	})
	
	</script>
 
 	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBzDGpcVk6NFENgr5AwQdXCxu2o9vauvY4&callback=initMap"></script>
 
</body>
<script>
//대여하기 버튼 클릭시 실행될 스크립트
$("#rentalBtn").click(function(e){
	var session="${vo1.userid}";
	e.preventDefault();
	console.log("도서 대여~~");
	var bookno=$("#bookno").val();
	var bookname=$("#bookname").val();
	if(session!="" && session.length !=0){
	$.ajax({
		url:"/book/bookRental",
		method:"GET",
		data:{"bookno":bookno,
			"bookname":bookname,
			"userid":session
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
	location.href="/";
	}
	else{
		alert("로그인이 필요합니다.");
		location.href="/member/login";
	}
})

//반납하기 버튼 클릭시 실행될 스크립트
$("#returnBtn").click(function(e){
	var session="${vo1.userid}";
	e.preventDefault();
	console.log("도서 반납~~");
	if(session!="" && session.length !=0){
	var bookno=$("#bookno").val();
	var bookname=$("#bookname").val();
	$.ajax({
		url:"/book/bookDetail",
		method:"POST",
		data:{"bookno":bookno,
			"bookname":bookname,
			"userid":session
		},
		success:function(data){
							
			if(data=="false"){
				alert(bookname+"\n 도서반납이 완료되었습니다.");
				
			}else{
				alert(session+"님이 대여한 도서가 아닙니다.");
			}
			
		
		}
		
	})
	modal.modal("hide");
	location.href="/";
	}else{
		alert("로그인이 필요합니다.");
		location.href="/member/login";
	}
})

$("#closeBtn").click(function(e){
	e.preventDefault();
	modal.modal("hide");
})


//썸네일을 클릭하면 실행될 스크립트
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
			var userid = result.userid;
				
			$("#exampleModalCenterTitle").val(exampleModalCenterTitle);
			$("#bookno").val(bookno);	
			$("#bookname").val(bookname);
			$("#writer").val(writer);
			$("#genre").val(genre);
			$("#publisher").val(publisher);
			$("#status").val(status);
			$("#userid").val(userid);
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
	})
</script>
</html>