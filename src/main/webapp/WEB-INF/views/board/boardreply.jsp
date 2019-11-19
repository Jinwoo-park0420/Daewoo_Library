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

<section class="replyForm">
<form method="post" role="form">
<table class="table table-striped table-hover">
<tr> 
<td><i class="fa fa-anchor fa-spin"></i> 
댓글 달기(작성자:  <input type="text" value="${vo1.userid}" name="writer" readonly="readonly"/>)</td>
	</tr>
	<input type="hidden" value="${vo.bno}" name="bno"/>
	<tr>
	<td>
	<textarea name="reply" cols="50" rows="4"></textarea>
<button id='addReplyBtn' class='btn btn-light pull-right'>댓글!</button>
</td>
</tr>
<tr>
<td><i class="fa fa-cog fa-spin fa-fw"></i><strong>댓글</strong>[${vo.replycnt}]</td>
</tr>
	<c:forEach items="${repList}" var="repList">
	<tr>
	   	<td>
	   	<strong class="primary-font">${repList.writer}</strong>
	   	<p>${repList.reply}</p>
	    <small class="pull-right text-muted"><fmt:formatDate value="${repList.regdate}" pattern="yyyy-MM-dd"/></small></td>
    	</td>
    	</tr>
    	</c:forEach>          						
</table>
</form>
	<script>	
	var formObj=$(".replyForm form[role='form']");
		
	$(".btn-light").click(function(){
		formObj.attr("action","replyWrite");
		formObj.submit();		
	});	
	</script>
	
	
</section>

</body>
</html>