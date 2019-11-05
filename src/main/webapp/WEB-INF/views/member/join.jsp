<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand" href="/index">대우 도서관</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
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
        <form name="sentMessage" id="contactForm" action="/member/join" method="post" novalidate>
          <div class="control-group">
            <div class="form-group floating-label-form-group controls">
              <label>이름</label>
              <input type="text" class="form-control" placeholder="이름" id="name" name="name" required data-validation-required-message="이름을 입력 바랍니다.">
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <div class="control-group">
            <div class="form-group floating-label-form-group controls">
              <label>주민등록번호</label>
    
             <input type="tel"  placeholder="주민등록번호" id="jumin1"  maxlength=6>
              -
              <input type="password"  placeholder="주민등록번호" id="jumin2" maxlength=7> 
              
              <input type="button" onclick="checks();" value="검사"/>

              <p class="help-block text-danger"></p>
            </div>
          </div>
          <div class="control-group">
            <div class="form-group floating-label-form-group controls">
              <label>아이디</label>
              <input type="text" class="form-control" placeholder="아이디" id="userid" name="userid" required data-validation-required-message="아이디를 입력 바랍니다.">
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <div class="control-group">
            <div class="form-group col-xs-12 floating-label-form-group controls">
              <label>비밀번호</label>
              <input type="password" class="form-control" placeholder="비밀번호" id="password" name="password" required data-validation-required-message="비밀번호를 입력 바랍니다.">
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <div class="control-group">
            <div class="form-group col-xs-12 floating-label-form-group controls">
              <label>비밀번호 확인</label>
              <input type="password" class="form-control" placeholder="비밀번호 확인" id="current_password" name="current_password" required data-validation-required-message="비밀번호를 입력 바랍니다.">
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <div class="control-group">
            <div class="form-group col-xs-12 floating-label-form-group controls">
              <label>E-Mail</label>
              <input type="email" class="form-control" placeholder="E-Mail" id="email" name="email" required data-validation-required-message="이메일을 입력 바랍니다.">
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <div class="control-group">
            <div class="form-group col-xs-12 floating-label-form-group controls">
              <label>주소</label>
                  
	  우편번호 : <input type="text" name="zip" style="width:80px; height:26px;" />
	<button type="button" style="width:60px; height:32px;" onclick="openZipSearch()">검색</button><br>
	주소 : <input type="text" name="addr1" style="width:300px; height:30px;" readonly /><br>
	상세 : <input type="text" name="addr2" style="width:300px; height:30px;" />
          
              <p class="help-block text-danger"></p>
            </div>
          </div>
          <div class="control-group">
            <div class="form-group col-xs-12 floating-label-form-group controls">
              <label>핸드폰 번호</label>
              <input type="tel" class="form-control" placeholder="핸드폰 번호" id="phone_number" name="phone_number" required data-validation-required-message="핸드폰번호를 입력 바랍니다.">
              <p class="help-block text-danger"></p>
            </div>
          </div>
        
      
          <div id="success"></div>
          <div class="form-group">
            <button type="submit" class="btn btn-primary" id="sendMessageButton">Send</button>
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
  <script src="/resources/js/jqBootstrapValidation.js"></script>
  <script src="/resources/js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/resources/js/clean-blog.min.js"></script>
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

//주민등록번호 검사
function check_jumin() { 
 var jumin=document.getElementById('jumin1').value+document.getElementById('jumin2').value;

 //주민등록 번호 13자리를 검사한다.
  var fmt = /^\d{6}[1234]\d{6}$/;  //포멧 설정
  if (!fmt.test(jumin)) {
   return false;
  }

 

  // Check Sum 코드의 유효성 검사
  var buf = new Array(13);
  for (var i = 0; i < 13; i++) buf[i] = parseInt(jumin.charAt(i));
 
  multipliers = [2,3,4,5,6,7,8,9,2,3,4,5];
  for (var sum = 0, i = 0; i < 12; i++) sum += (buf[i] *= multipliers[i]);

  if ((11 - (sum % 11)) % 10 != buf[12]) {
     return false;
  }

 	jumin.attr("action","/join");
  return true;
}

function checks(){
 if(check_jumin())//올바른 값이 들어왔을 때 실행될 코드
  alert("올바른  주민번호입니다.");
 else//올바른 갑이 들어오지 않았을 때 실행될 코드
  alert("올바르지 않은 주민번호입니다. 다시입력해주세요.");
}

//앞의 텍스트박스에 6자리 글씨가 써지면 자동으로 다음 칸으로 커서가 넘어간다.
function nextgo(e){ 
  if (e.value.length>=6) {
   document.getElementById('jumin2').focus();
  }
}






</script>
</body>

</html>
