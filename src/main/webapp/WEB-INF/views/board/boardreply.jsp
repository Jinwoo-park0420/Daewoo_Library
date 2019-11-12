<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form id="replyForm" name="replyForm" method="post">
<table class="table table-striped table-hover">
<tr> 
<td><i class="fa fa-anchor fa-spin"></i> 
댓글 달기</td>
	</tr>
	
	<tr>
	<td>
	<textarea name="reply" cols="50" rows="4"></textarea>
<button id='addReplyBtn' class='btn btn-light pull-right'>댓글</button>
</td>
</tr>
<tr>
<td><i class="fa fa-cog fa-spin fa-fw"></i>댓글</td>
</tr>
	
	<tr>
	   	<td><strong class="primary-font">이찬해</strong>
	   	<p>댓글님 나와주세요</p>
	    <small class="pull-right text-muted">2018-11-06 10:10</small></td>
    	</td>
    	</tr>           						
</table>
</form>

</body>
</html>