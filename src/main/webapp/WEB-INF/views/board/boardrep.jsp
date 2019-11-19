<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
       <!-- 댓글 영역 -->
       <table class="chat table table-striped table-hover">
       <tr>
       <td>
       </tr>
       <tr>       
       <ul class="left clearfix" data-rno='12' style="padding-left: 0">
       <i class="fa fa-anchor fa-spin"></i>댓글</td>
       </tr>
       <tr>
       <td class="header">
    		<strong class="primary-font"></strong>
           	<small class="pull-right text-muted"></small>
      	</td>
           	<td></td>
        </tr>           		     	
      	</ul>
      	</table> 							
            <div class="row">
            	<div class="col-lg-12">
            		<div class="panel panel-default">
            			<div class="panel-heading">	            			
	            			<button id='addReplyBtn' class='btn btn-light btn-xs pull-right'>댓글 쓰기</button>
            			</div><!-- ./ end panel-heading  --> 
            			<div class="panel-body">            				    			
            			</div><!-- ./ end panel-body  -->
            			<div class="panel-footer"><!-- 댓글 페이지 영역 -->
       
            			</div> 
            		</div><!-- ./ end panel panel-default  -->            	
            	</div><!-- ./ end col-lg-12  -->            
            </div><!-- ./ end row  -->    
            <!-- 댓글 등록  버튼 누르면  Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">Reply Modal</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                            	<label>댓글</label>
                            	<input class="form-control" name="reply" value="New Reply">
                            </div>
                            <div class="form-group">
                            	<label>작성자</label>
                            	<input class="form-control" name="replyer" value="replyer">
                            </div>
                            <div class="form-group">
                            	<label>작성 날짜</label>
                            	<input class="form-control" name="replydate" value="">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-light" id="modalModBtn">Modify</button>
                            <button type="button" class="btn btn-light" id="modalRemoveBtn">Remove</button>
                            <button type="button" class="btn btn-light" id="modalRegisterBtn">작성하기</button>
                            <button type="button" class="btn btn-light" id="modalCloseBtn">닫기</button>                            
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->           

<%-- 버튼이 눌러지면 보내질 폼 작성 : 페이지 나누기 와 페이지당 게시물 수와 같은 정보 보내기 --%>
<form action="modify" id="operForm">
	<input type="hidden" name="bno" value="${vo.bno}" />
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
</form>

<script>
$(function(){
	var operForm = $("#operForm");
	
	$(".btn-info").click(function(){
		operForm.find("input[name='bno']").remove();
		operForm.attr("action","list");
		operForm.submit();
	})
	$(".btn-default").click(function(){
		operForm.submit();
	})
})
</script>          
<script src="/resources/js/reply.js"></script>
<script>
$(function(){
	//bno 가져오기
	var bno=${vo.bno};
	
	//댓글 목록을 보여줄 영역 가져오기
	var replyUL = $(".chat");
	//댓글을 보여줄 함수 호출하기
	showList(1);
	
	$("#modalRegisterBtn").click(function(){
		var reply={bno:bno,reply:modalInputReply.val(),replyer:modalInputReplyer.val()};
		
		replyService.add(reply,function(result){
			if(result){
				//댓글 작성이 성공되면
				//input 태그 내용 없애기
				modal.find("input").val("");
				//모달 창 종료
				modal.modal("hide");
				//댓글 리스트 함수 호출
				showList(-1);
				
			}
		});
	}) //add 종료
	
	function showList(page){
	 replyService.getList({bno:bno,page:page||1},function(total,list){
		console.log("list-length : "+list.length+" total : "+total);
		
		//새글 등록시
		if(page==-1){
			pageNum=Math.ceil(total/10.0);
			showList(pageNum);
			return;
		}		
		
		if(list==null||list.length==0){
			replyUL.html("");
			return;
		}
		
		var str="";
		for(var i=0,len=list.length||0;i<len;i++){
			str+="<ul class='left clearfix' data-rno='"+list[i].rno+"'>";			
			str+="<td class='header'><strong class='primary-font'><i class='fa fa-cog fa-spin fa-fw'></i>"+list[i].replyer+"</strong>";
			str+="<small class='pull-right text-muted'>"+replyService.displayTime(list[i].regdate)+"</small>";
			str+="</td><tr><td>"+list[i].reply+"</td></tr></ul>";
		}
		replyUL.html(str);
		showReplyPage(total);	//댓글 총 갯수		
	}); //getList 종료
	}
	//댓글 페이지 영역 가져오기
	var replyPageFooter=$(".panel-footer");
	var pageNum=1;
	function showReplyPage(total){
		//마지막 페이지 계산
		var endPage=Math.ceil(pageNum/10.0)*10;
		//시작페이지 계산
		var startPage=endPage-9;
		//이전 버튼
		var prev=startPage!=1;
		//다음 버튼
		var next=false;
		
		if(endPage*10 >=total){
			endPage=Math.ceil(total/10.0);
		}
		if(endPage*10<total){
			next=true;
		}
		
		var str="<ul class='pagination pull-left'>";
		if(prev){
			str+="<li class='page-item'><a class='page-link'";
			str+=" href='"+(startPage-1)+"'>Previoues</a></li>";
		}
		
		for(var i=startPage;i<=endPage;i++){
			var active=pageNum==i?"active":"";
			str+="<li class='page-item "+active+"'>";  //현재페이지 디자인만 좀 다르게
			str+="<a class='page-link' href='"+i+"'>"+i;
			str+="</a></li>";
		}				
		
		if(next){
			str+="<li class='page-item'><a class='page-link'";
			str+=" href='"+(endPage+1)+"'>Next</a></li>";
		}
		str+="</ul></div>";
		replyPageFooter.html(str);
	}
	
	
	//페이지 번호를 클릭하면 동작할 스크립트
	//현재 존재하는 태그가 아니기 때문에 이벤트 위임의 형태로 이벤트 발생
	replyPageFooter.on("click","li a",function(e){
		e.preventDefault(); //a태그 동작 막기
		
		pageNum=$(this).attr("href");
		showList(pageNum);
	})
	
	$("#modalRemoveBtn").click(function(){
	
		replyService.del(modal.data("rno"),function(result){
		if(result){
			modal.modal("hide");
			showList(-1);
		}
		});
	})//del 종료 
	
	//modalModBtn.on("click",funtion())
	$("#modalModBtn").on("click",function(){//이벤트 거는 정식 방법
		
		var replyupdate={
			rno:modal.data("rno"),
			reply:modalInputReply.val()
	};
	 	replyService.update(replyupdate,function(result){
			if(result==='success'){ //===문자 타입까지 비교
				//alert("수정 성공");
			modal.modal("hide"); //현재창 닫기
			//showList(1);//1페이지 띄우기
			showList(pageNum);
			}
		})
	}) 
	
	//이벤트 위임
	replyUL.on("click","li",function(){
		
		//댓글 등록시 감췄던 replydate 요소 다시 보이게 만들기
		modalInputReplyDate.closest("div").show();
		var rno=$(this).data("rno");		
		
		replyService.get(rno,function(result){
			//넘겨받은 데이터 modal 창에 보여주기
			modalInputReply.val(result.reply);
			modalInputReplyer.val(result.replyer);
			modalInputReplyDate.val(replyService.displayTime(result.replydate)).attr("readonly","readonly");
			//modalInputReplyDate.attr("readonly","readonly");
			
			modal.data("rno",result.rno);
			//console.log(result);
			
			//버튼 숨기기
			
			modal.find("button[id!='modalCloseBtn']").hide();
			modalModBtn.show();
			modalRemoveBtn.show();
			//modalInputReplyDate.closest("div").show();
			modal.modal("show");
		})
	})	
	
	var modal=$(".modal");
	//모달 창이 가지고 잇는 input 영역 가져오기
	var modalInputReply=modal.find("input[name='reply']");
	var modalInputReplyer=modal.find("input[name='replyer']");
	var modalInputReplyDate=modal.find("input[name='replydate']");
	//모달 창이 가지고 있는 버튼 가져오기
	var modalModBtn=$("#modalModBtn");
	var modalRemoveBtn=$("#modalRemoveBtn");
	var modalRegisterBtn=$("#modalRegisterBtn");
	
	//댓글 모달창과 관련된 스크립트
	$("#addReplyBtn").click(function(){
		//input태그가 가지고 있는 내용 없애주기
		modal.find("input").val("");
		
		modalInputReplyDate.closest("div").hide();
		//close 버튼만 제외하고 모든 버튼을 숨기기
		modal.find("button[id!='modalCloseBtn']").hide();
		//등록버튼 보여주기
		modalRegisterBtn.show();
		
		//모달창 보여주기
		modal.modal("show"); //숨길땐 hide
	})
	
	//모달창 close 버튼이 눌리면 창 닫기
	$("#modalCloseBtn").click(function(){
		
		modal.modal("hide");
		
		
	})
})
</script>

<!-- Bootstrap core JavaScript -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Custom scripts for this template -->
<script src="/resources/js/clean-blog.min.js"></script>
</body>
</html>