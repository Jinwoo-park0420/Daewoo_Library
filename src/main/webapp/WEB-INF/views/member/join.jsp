<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>

<!-- 우편주소 스크립트 -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>대우 도서관 - 회원가입 페이지입니다.</title>

  <!-- Bootstrap core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

   <!-- Custom styles for this template -->
  <link href="/resources/css/clean-blog.min.css" rel="stylesheet">
  
  <style>
  	label.error{
  		top:0;
  		opacity:1;
  	}
  </style>
 
  <!-- 우편주소 스크립트 -->
  <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
  
  <script>
function dupId(){
	var id = $('#userid').val(); //userid가져오기
	$.ajax({
		type:'post',
		url:'ck_userid',  
		data:{userid:id}, // 파라미터 값 : 사용자가 입력한 값
		success: function(result){
			if(result=="true"){
				$("small[id='userid']").text('사용 가능한 아이디입니다.').removeClass('text-danger').css('color','blue');
			} else {
				$("small[id='userid']").text('사용 불가능한 아이디입니다.').css('color','blue');
			}
		}
	})
}
</script>
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand" href="/member/index">대우 도서관</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
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
  <header class="masthead" style="background-image: url('/resources/img/contact-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1>회원가입</h1>
            <span class="subheading">대우도서관에 방문해주셔서 감사합니다.</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
        <!-- Contact Form - Enter your email address on line 19 of the mail/contact_me.php file to make this form work. -->
        <!-- WARNING: Some web hosts do not allow emails to be sent through forms to common mail hosts like Gmail or Yahoo. It's recommended that you use a private domain email address! -->
        <!-- To use the contact form, your site must be on a live web host with PHP! The form will not work locally! -->
        <form name="sentMessage" id="contactForm" action="/member/join" method="post" role="form">
          <div class="control-group">
            <div class="form-group floating-label-form-group controls">
              <label for="name">이름</label>
              <input type="text" class="form-control" placeholder="이름" id="name" name="name">
              <small class="text-danger" id="name"></small>
            </div>
          </div>
          <!-- 생년월일 추가 -->
          <div class="control-group">
            <div class="form-group col-xs-12 floating-label-form-group controls">
              <label for="birthYear">생년월일</label>
              <input type="tel" class="form-control birthYear" placeholder="ex) 19990101" id="birthYear" name="birthYear">
              <small class="text-danger" id="birthYear"></small>
            </div>
          </div>    	
          <div class="control-group">
            <div class="form-group floating-label-form-group controls">
              <label for="userid">아이디</label>
              <!-- <input type="text" class="form-control userid" placeholder="아이디" id="userid" name="userid" required data-validation-required-message="아이디를 입력 바랍니다."> -->
              <input type="text" class="form-control userid" placeholder="아이디" id="userid" name="userid">
              <button type="button" style="width:75px; height:32px;" onclick="dupId()" id="ck_userid" value="중복체크">중복체크</button>
              <small class="text-danger" id="userid"></small>
            </div>
          </div>
          <div class="control-group">
            <div class="form-group col-xs-12 floating-label-form-group controls">
              <label for="password">비밀번호</label>
              <input type="password" class="form-control password" placeholder="비밀번호" id="password" name="password">
              <small class="text-danger" id="password"></small>
            </div>
          </div>
          
          <div class="control-group">
            <div class="form-group col-xs-12 floating-label-form-group controls">
              <label for="current_password">비밀번호 확인</label>
              <input type="password" class="form-control password" placeholder="비밀번호 확인" id="current_password" name="current_password">
              <small class="text-danger" id="current_password"></small>
            </div>
          </div>
          <div class="control-group">
            <div class="form-group col-xs-12 floating-label-form-group controls">
             <label for="email">E-Mail</label>
              <input type="email" class="form-control" placeholder="E-Mail" id="email" name="email">
              <small class="text-danger" id="email"></small>
            </div>
          </div>
          <div class="control-group">
            <div class="form-group col-xs-12 floating-label-form-group controls">
              <label for="zip">주소</label>
	 			 우편번호 : <input type="text" name="zip" style="width:80px; height:26px;" id="zip"/>
				<button type="button" style="width:60px; height:32px;" onclick="openZipSearch()">검색</button><br>
				주소 : <input type="text" name="addr1" style="width:300px; height:30px;" readonly id="addr1"/><br>
				상세 : <input type="text" name="addr2" style="width:300px; height:30px;" id="addr2"/>
              <small class="text-danger" ></small>
            </div>
          </div>
          <div class="control-group">
            <div class="form-group col-xs-12 floating-label-form-group controls">
              <label for="phone_number">핸드폰 번호</label>
              <input type="tel" class="form-control phone_number" placeholder="핸드폰 번호 '-' 없이 번호만 입력해 주세요" id="phone_number" name="phone_number">
              <small class="text-danger" id="phone_number"></small>
            </div>
          </div>
          <div id="success"></div>
          <div class="form-group">
            <button type="submit" class="btn btn-primary" id="sendMessageButton">Send</button>
            <button type="reset" class="btn btn-primary" id="sendMessageButton">Reset</button>
          </div>
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

  <!-- Contact Form JavaScript -->
  <!-- <script src="/resources/js/jqBootstrapValidation.js"></script>
  <script src="/resources/js/contact_me.js"></script> -->

  <!-- Custom scripts for this template -->
  <script src="/resources/js/clean-blog.min.js"></script>

  <!-- validation 라이브러리 삽입 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
  <!-- validation 사용자 작성 코드 삽입-->
  <script src="/resources/js/join.js"></script>
<script>
//우편주소찾기
function openZipSearch() {
	new daum.Postcode({
		oncomplete: function(data) {
			$('[name=zip]').val(data.zonecode); // 우편번호 (5자리)
			$('[name=addr1]').val(data.address);
			$('[name=addr2]').val(data.buildingName);
		}
	}).open();
}

</script>
</body>

</html>
