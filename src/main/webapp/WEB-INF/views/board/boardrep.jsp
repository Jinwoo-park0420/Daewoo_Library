<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div class="container">
    <form id="replyForm" name="replyForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>댓글</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea rows="3" cols="60" id="reply" name="reply" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                                <a href='#' onClick="fn_comment('${result.bno}')" class="btn pull-right btn-light">등록</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="bno" name="bno" value="${result.bno}" />        
    </form>
</div>
<div class="container">
    <form id="replyListForm" name="replyListForm" method="post">
        <div id="replyList">
        </div>
    </form>
</div>
 
<script>
/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(code){
    
    $.ajax({
        type:'POST',
        url : "<c:url value='/board/addreply'/>",
        data:$("#replyForm").serialize(),
        success : function(data){
            if(data=="success")
            {
                getCommentList();
                $("#reply").val("");
            }
        },
        error:function(request,status,error){

        }
        
    });
}
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    
    getCommentList();
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
    
    $.ajax({
        type:'GET',
        url : "<c:url value='/board/boardrep'/>",
        dataType : "json",
        data:$("#replyForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            var str = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                	str += "<div>";
                	str += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong></h6>";
                    str += data[i].comment + "<tr><td></td></tr>";
                    str += "</table></div>";
                    str += "</div>";
                }
                
            } else {
                
            	str += "<div>";
            	str += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
            	str += "</table></div>";
            	str += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#replyList").html(str);
            
        },
        error:function(request,status,error){
            
       }
        
    });
}
 
</script>
</body>
</html>