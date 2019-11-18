<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

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
                <form id='operForm' action="modify">
<table class="table table-striped">
	<thead>${report_select.bno}번 글</thead>
	<tbody>
			<tr>
                <th>제목: </th>
                <td><input type="text"  name="title" class="form-control" /></td>
            </tr>
            <tr>
            	<th>작성자:</th>
                <td><input type="text" value="${report_select.writer}" name="writer" class="form-control" readonly="readonly"/></td>
            </tr>
            <tr>
                <th>내용: </th>
                <td><textarea cols="20" rows="25" name="content" class="form-control"></textarea></td>
            </tr>
            
            <tr>
            	<th>비밀번호:</th>
                <td><input type="password"  name="password" class="form-control" /></td>
            </tr>
            <tr>        
         <th>파일첨부</th>   		
         <td>
		<input type="file" name="uploadFile" id="uploadFile" multiple="multiple" readonly="readonly"/>
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
                    <button data-oper='modify' class="btn btn-light pull-right">수정하기</button>
                    <button data-oper='list' class="btn btn-light pull-left ">목록으로</button>
                
					<input type='hidden' id='bno' name='bno' value="${report_select.bno}"/>					
                </td>
            </tr>     
</tbody>
</table>
				</form>
</div>
<%-- remove와 list를 위한 폼--%>
			<form action="modify" id="formObj">
				<input type="hidden" name="bno" value="${vo.bno}" />
				<input type="hidden" name="pageNum" value="${cri.pageNum}" />
				<input type="hidden" name="amount" value="${cri.amount}" />
				<input type="hidden" name="type" value="${cri.type}" />
				<input type="hidden" name="keyword" value="${cri.keyword}" />
			</form>

   <script src='{% static "js/jquery-1.11.3.min.js" %}'></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
 $(function() {
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e) {
		e.preventDefault();
		operForm.attr('method','post');
		var str="";
		//uploadResult ul li태그에 있는 값 갖고오기
		$(".uploadResult ul li").each(function(i, el){
			var job=$(el);
			str+="<input type='hidden' name='attachList["+i+"].uuid' value='"+job.data("uuid")+"'>";
			str+="<input type='hidden' name='attachList["+i+"].uploadPath' value='"+job.data("path")+"'>";
			str+="<input type='hidden' name='attachList["+i+"].fileName' value='"+job.data("filename")+"'>";
			str+="<input type='hidden' name='attachList["+i+"].fileType' value='"+job.data("type")+"'>";
		})
		operForm.append(str);
		operForm.attr("action", "/book_report/book_reportmodify");
		operForm.submit();
	
	})
	
	$("button[data-oper='list']").on("click", function() {
		operForm.find("#bno").remove();
		
		operForm.attr("action", "/book_report/book_reportmain");
			operForm.submit();
		})
	
 
})
 
</script>
<script>
				$(function(){
					var bno = ${report_select.bno};
					console.log("파일가져오기"+bno);
					//첨부파일 목록 가져오기
					$.getJSON("/book_report/getAttachList",{bno:bno},function(list){
						showFileUploadResult(list);
					})
					
					
					function showFileUploadResult(uploadResultArr){
						var uploadResult = $(".uploadResult ul");
						var str="";
						$(uploadResultArr).each(function(i, element){
							if(!element.fileType){
								var fileCallPath=encodeURIComponent(element.uploadPath+"/"+element.uuid+"_"+element.fileName);
								str+="<li data-path='"+element.uploadPath+"' data-uuid='"+element.uuid+"' ";
								str+="data-filename='"+element.fileName+"' data-type='"+element.fileType+"'>";
								str+="<span>"+element.fileName+"</span>";
								str+="<button type='button' class='btn btn-warning btn-circle btn-sm' data-file='"+fileCallPath+"' data-filetype='file'>";
								str+="<i class='fa fa-times'></i></button><br>";
								//str+="<a href='/<down></down>load?fileName="+fileCallPath+"'>";
								str+="<image data-path='"+element.uploadPath+"' data-uuid='"+element.uuid+"' ";
								str+="data-filename='"+element.fileName+"' data-type='"+element.fileType+"' src='/resources/img/attach.png'>";
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
								str+="<button type='button' class='btn btn-warning btn-circle btn-sm' data-file='"+fileCallPath+"' data-filetype='file'>";
								str+="<i class='fa fa-times'></i></button><br>";
								//str+="<a href=\"javascript:showImage(\'"+fileOriginPath+"\')\">";
								str+="<img data-path='"+element.uploadPath+"' data-uuid='"+element.uuid+"' ";
								str+="data-filename='"+element.fileName+"' data-type='"+element.fileType+"' src='/display?fileName="+fileCallPath+"'>";
								str+="</li>";				
							}
						})
						uploadResult.append(str);
					}
					
					
					$("input[type='file']").on("change",function(){
						console.log("파일 선택 버튼 클릭");
						
						//본문에 form을 만들지 않았기 때문에 폼 역할을 할 객체 생성
						var formData = new FormData();
						
						var inputFiles=$("#uploadFile");
						
						var files=inputFiles[0].files;
						
						
						//확장자 확인 후 업로드
						for(var i =0; i<files.length; i++){
							if(!checkExtension(files[i].name, files[i].size)){
								return false;
							}
							formData.append("uploadFile",files[i]);
						}

						$.ajax({
							url:'/uploadAjax',
							//multipart/form-data역할을 할 수있게 해주는 processData:false,contentType:false
							processData:false,
							contentType:false,
							method:'post',
							data:formData,
							dataType:'json',
							success:function(result){
								console.log(result);
								showFileUploadResult(result);
							},
							error:function(request,status,error){
								alert(error);
							}
						})
					})
					
					
					function checkExtension(filename,fileSize){
						var regex = new RegExp("(.*?)\(exe|sh|zip|alz)$");
						var maxSize = 2485760;
						
						if(fileSize>maxSize){
							alert("파일 크기 초과");
							return false;
						}
						if(regex.test(filename)){
							alert("해당 종류의 확장자 파일은 업로드 할 수 없습니다.");
							return false;
						}
						return true;
					}
					
					
					$(".uploadResult").on("click","img",function(){
						var liObj = $(this);
						var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
						
						if(liObj.data("type")){
							showImage(path.replace(new RegExp(/\\/g),"/"));
						}
						else{
							self.location="/download?fileName="+path;
						}
						});

					$(".bigPictureWrapper").on("click", function(){
						$(".bigPicture").animate({width:'0%', height:'0%'}, 500);
						setTimeout(function(){
							$(".bigPictureWrapper").hide();
						},500);
					});
					
					
					
					//서버에 저장된 파일은 modify버튼을 눌러야 삭제되는 것이며 여기서는 화면에 보이는 것만 삭제
					$(".uploadResult").on("click", "button", function(){
						var targetli=$(this).closest("li");
						if(confirm("파일을 삭제하시겠습니까?")){
							targetli.remove();	
						}
					})
					
				})
				
				
			</script>
		<script>
		function showImage(fileCallPath){
			$(".bigPictureWrapper").css("display","flex").show();
			$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>").animate({width:'100%',height:'100%'}, 1000);
		}
	
		</script>
			
</body>
</html>