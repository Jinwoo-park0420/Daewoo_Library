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
<title>독후감 제출</title>
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
<form action="/book_report/book_reportinsert" id = "operForm" method="post" role="form" >
<table class="table table-striped">
	<thead>독후감 신청</thead>
	<tbody>
			<tr>
                <th>제목: </th>
                <td><input type="text" placeholder="제목을 입력하세요. " name="title" class="form-control" required="required"/></td>
            </tr>
            <tr>
            	<th>작성자:</th>
                <td><input type="text" placeholder="이름을 입력하세요" name="writer" class="form-control" value="${vo1.userid}" readonly="readonly"/></td>
            </tr>
            <tr>
                <th>내용: </th>
                <td><textarea cols="20" rows="25" placeholder="내용을 입력하세요. " name="content" class="form-control" required="required"></textarea></td>
            </tr>
            <tr>
            	<th>비밀번호:</th>
                <td><input type="password" placeholder="비밀번호를 입력하세요" name="password" class="form-control" required="required"/></td>
            </tr>
    
    <tr>        
         <th>파일첨부</th>   		
         <td>
		<input type="file" name="uploadFile" id="uploadFile" multiple="multiple" required="required"/>
		<div class="uploadResult">
		<ul>
		
		</ul>
	</div>
	<div class='bigPictureWrapper'>
	  <div class='bigPicture'>
	  </div>
	</div>
	</td>	
	</tr>
                        <tr>
                <td colspan="2">
		           <button type="submit" class="btn btn-light pull-right ">등록</button>
                    <input type="reset" value="reset" class="btn btn-light pull-left"/>
                    <input type="button" value="글 목록으로... " class="btn btn-light pull-right" onclick="javascript:location.href='/book_report/book_reportmain'"/>
                </td>
            </tr>
</tbody>
</table>
     </form>
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


<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="/resources/js/clean-blog.min.js"></script>
<script>
$(function(){
	

$("button").on("click",function(e){
	e.preventDefault();

	//글 작성한 폼 데이터 갖고오기
	var formObj = $("form[role='form']");
	var str="";
	
	//uploadResult ul li태그에 있는 값 갖고오기
	$(".uploadResult ul li").each(function(i, el){
		var job=$(el);
		
		str+="<input type='hidden' name='attachList["+i+"].uuid' value='"+job.data("uuid")+"'>";
		str+="<input type='hidden' name='attachList["+i+"].uploadPath' value='"+job.data("path")+"'>";
		str+="<input type='hidden' name='attachList["+i+"].fileName' value='"+job.data("filename")+"'>";
		str+="<input type='hidden' name='attachList["+i+"].fileType' value='"+job.data("type")+"'>";
		
	})
	
	formObj.append(str);
	formObj.submit();
})

			$("input[name='uploadFile']").on("change",function(e){
				e.preventDefault();
				console.log("업로드 버튼 클릭");
				alert("파일명 ex) 홍길동_940420");
				//ajax로 폼 전송 가능하게 해주는 객체
				var formData = new FormData();
			
				var inputFiles=$("input[name='uploadFile']");
				var files=inputFiles[0].files;
				//console.log(inputFiles);
				
				//fileList를 폼에 append하기
				for(var i=0;i<files.length;i++){
					if(!checkExtension(files[i].name,files[i].size)){
						return false;	
					}					
					formData.append("uploadFile",files[i]);
				}
				
				//ajax를 이용하여 form 보내기
				$.ajax({
					url:'/uploadAjax',
					processData:false,
					contentType:false,
					type:'post',
					data:formData,
					dataType:'json',
					success:function(result){
						//console.log(result);
						showFileUploadResult(result);
					},
					error:function(request,status,error){
						alert(status);
					}
				})				
			})  // button on end
		
			function checkExtension(fileName,fileSize){
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 12485760;
	if(fileSize>maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
	if(regex.test(fileName)){
		alert("해당 종류의 파일은 업로드 할 수 없습니다.");
		return false;
	}
	return true;
}


			function showFileUploadResult(uploadResultArr){
				//보여줄 영역 가져오기
				var uploadResult=$(".uploadResult ul"); //uploadResult ul태그안에 li를 적음 
				var str="";
				$(uploadResultArr).each(function(i, element) {
					if(!element.fileType){
						var fileCallPath=encodeURIComponent(element.uploadPath+"/"+element.uuid+"_"+element.fileName);
						str+="<li data-path='"+element.uploadPath+"' data-uuid='"+element.uuid+"' ";
						str+="data-filename='"+element.fileName+"' data-type='"+element.fileType+"'>";
						str+="<span>"+element.fileName+"</span>";
						str+="<button type='button' class='btn btn-warning btn-circle btn-sm' data-file='"+fileCallPath+"' data-filetype='file'>";
						str+="<i class='fa fa-times'></i></button><br>";
						str+="<a href='/download?fileName="+fileCallPath+"'>";
						str+="<image src='/resources/img/attach.png'></a>"
						str+="</li>";
					}else{
						//encodeURIComponent이유는 / or \\를 하나의 유형으로 통합시키려고 처리한 것
						var fileCallPath=encodeURIComponent(element.uploadPath+"/s_"+element.uuid+"_"+element.fileName);
						//원본파일 경로 생성
						var fileOriginPath=element.uploadPath+"/"+element.uuid+"_"+element.fileName;
						//경로가 \와/가 섞이게 되는 부분 정리하기!!
						fileOriginPath=fileOriginPath.replace(new RegExp(/\\/g), "/");
						
						str+="<li data-path='"+element.uploadPath+"' data-uuid='"+element.uuid+"' ";
						str+="data-filename='"+element.fileName+"' data-type='"+element.fileType+"'>";
						str+="<span>"+element.fileName+"</span>";
						str+="<button type='button' class='btn btn-warning btn-circle btn-sm' data-file='"+fileCallPath+"' data-filetype='image'>";
						str+="<i class='fa fa-times'></i></button><br>";
						str+="<a href=\"javascript:showImage(\'"+fileOriginPath+"\')\">";
						str+="<img src='/display?fileName="+fileCallPath+"'></a>";
						str+="</li>";				
					}
				})
				uploadResult.append(str);
			}
						
		
			$(".bigPictureWrapper").on("click",function(){
				$(".bigPicture").animate({width:'0%',height:'0%'},1000);
				setTimeout(function(){
					$(".bigPictureWrapper").hide();
				}, 1000);
			})
	
			//x를 누르면 파일 첨부 목록에서 삭제하고
		
			//x가 눌러진 파일에 대한 정보를 서버로 보내는 이벤트
		
			$(".uploadResult").on("click","span",function(){
			//삭제할 대상파일의 경로 및 파일명 가져오기
			var targetfile=$(this).data("file");
			//삭제할 파일의 타입가져오기
			//image인 경우 썸네일과 원본 파일2개를 삭제해야 하기 때문에
			var type=$(this).data("type");
			//첨부목록에서 제거하기 위한 영역 가져오기
			var targetLi=$(this).closest("li");
			
			$.ajax({
				url :'/deleteFile',
				data :{
					fileName:targetfile,
					type:type
				},
				type:'post',
				success:function(result){
					//성공이 돌아오면 첨부파일목록 지우기
					targetLi.remove();
				}
			})
		})

		
		})
		
		
		function showImage(fileCallPath){
		$(".bigPictureWrapper").css("display","flex").show();
		
		$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
		.animate({width:'100%',height:'100%'},1000);
		}
		
		
	</script>
</body>
</html>