<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../board/header.jsp"%>

<div class='row'>
	<div class="col-lg-12">
    <!-- /.panel -->
		<div class="panel panel-default">
			<div class="panel-heading">
			  <i class="fa fa-comments fa-fw"></i>댓글
			  <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>댓글 달기</button>
			</div>      
	      	<!-- /.panel-heading -->
		<div class="panel-body">        
			<ul class="chat">

			</ul>
        	<!-- ./ end ul -->
		</div>
      	<!-- /.panel .chat-panel -->

	<div class="panel-footer"></div>

		</div>
	</div>
  <!-- ./ end row -->
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">댓글</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>댓글</label> <input class="form-control" name='reply'
						value='댓글 내용 입력'>
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name='replyer'
						value='작성자'>
				</div>
				<div class="form-group">
					<label>작성 날짜</label> <input class="form-control"
						name='replyDate' value='2018-01-01 13:13'>
				</div>

			</div>
			<div class="modal-footer">
				<button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
				<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
				<button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
				<button id='modalCloseBtn' type="button" class="btn btn-default">닫기</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>
	$(document).ready(function() {
		var bnoValue = '<c:out value="${board.bno}"/>';
		var replyUL = $(".chat");
		  
		showList(1);
		
		// 댓글 목록 처리
		function showList(page){
			console.log("show list "+ page);
		      
			replyService.getList({bno:bnoValue,page: page|| 1 }, function(replyCnt, list) {
		        
				console.log("replyCnt: "+ replyCnt);
				console.log("list: "+ list);
				console.log(list);
			
				if(page == -1){
					pageNum = Math.ceil(replyCnt/10.0);
					showList(pageNum);
					return;
				}
			
				var str="";
			        
				if(list == null || list.length == 0){
					replyUL.html("");
					return;
				}
				for (var i = 0, len = list.length || 0; i < len; i++) {
					str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
					str +="  <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>"; 
					str +="    <small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
					str +="    <p>"+list[i].reply+"</p></div></li>";
				}
				replyUL.html(str);
				showReplyPage(replyCnt);
			});//end function
		}
		
		// 댓글 목록 상단의 댓글달기 버튼을 클릭하면 모달창이 뜨도록
		var modal = $(".modal");
	    var modalInputReply = modal.find("input[name='reply']");
	    var modalInputReplyer = modal.find("input[name='replyer']");
	    var modalInputReplyDate = modal.find("input[name='replyDate']");
	    
	    var modalModBtn = $("#modalModBtn");
	    var modalRemoveBtn = $("#modalRemoveBtn");
	    var modalRegisterBtn = $("#modalRegisterBtn");
	    
	    $("#modalCloseBtn").on("click", function(e){
	    	modal.modal('hide');
	    });
	    
	    $("#addReplyBtn").on("click", function(e){
	      modal.find("input").val("");
	      modalInputReplyDate.closest("div").hide();
	      modal.find("button[id !='modalCloseBtn']").hide();
	      modalRegisterBtn.show();
	      
	      $(".modal").modal("show");
	      
	    });
	    
		// 새로운 댓글 추가 이벤트
		modalRegisterBtn.on("click",function(e){
			var reply = {
			      reply: modalInputReply.val(),
			      replyer:modalInputReplyer.val(),
			      bno:bnoValue
			    };
			replyService.add(reply, function(result){
			  alert(result);
			  modal.find("input").val("");
			  modal.modal("hide");
		
			  showList(-1);
			  
			});
	        
		});
		
		// 댓글 클릭 이벤트
		$(".chat").on("click", "li", function(e){
			var rno = $(this).data("rno");
			replyService.get(rno, function(reply){
			      
		        modalInputReply.val(reply.reply);
		        modalInputReplyer.val(reply.replyer);
		        modalInputReplyDate.val(replyService.displayTime( reply.replyDate))
		        .attr("readonly","readonly");
		        modal.data("rno", reply.rno);
		        
		        modal.find("button[id !='modalCloseBtn']").hide();
		        modalModBtn.show();
		        modalRemoveBtn.show();
		        
		        $(".modal").modal("show");
		            
			});
			
		});
		
		// 댓글 수정
		modalModBtn.on("click", function(e){
			var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
			replyService.update(reply, function(result){
		            
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			});
		});
		
		// 댓글 삭제
		modalRemoveBtn.on("click", function (e){
			var rno = modal.data("rno");
			replyService.remove(rno, function(result){
		  	        
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			});
		});
		
	// 댓글 페이지 번호를 출력하는 로직
	var pageNum = 1;
	var replyPageFooter = $(".panel-footer");
	   
	function showReplyPage(replyCnt){
		var endNum = Math.ceil(pageNum / 10.0) * 10;  
		var startNum = endNum - 9; 
		var prev = startNum != 1;
		var next = false;
	     
		if(endNum * 10 >= replyCnt){
			endNum = Math.ceil(replyCnt/10.0);
		}
		if(endNum * 10 < replyCnt){
			next = true;
		}
		var str = "<ul class='pagination pull-right'>";
	     
		if(prev){
			str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
		}
	     
		for(var i = startNum ; i <= endNum; i++){
			var active = pageNum == i? "active":"";
			str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
		if(next){
			str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
		}
		str += "</ul></div>";
		console.log(str);
		replyPageFooter.html(str);
	}
    
    // 페이지 번호를 클릭했을 때 새로운 댓글을 가져오도록 하는 부분
	replyPageFooter.on("click","li a", function(e){
		e.preventDefault();
		console.log("page click");
      
		var targetPageNum = $(this).attr("href");
		console.log("targetPageNum: " + targetPageNum);
      
		pageNum = targetPageNum;
		showList(pageNum);
	}); 
	
});
</script>

<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/board/modify").submit();
		});

		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/list")
			operForm.submit();
		});

	});
</script>