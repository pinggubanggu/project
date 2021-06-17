<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>login</title>
<style>
.error 
{
	padding: 10px;
	color: red;
}

.msg 
{
	padding:10px;
	color:red;
}

#login-box 
{
	width: 400px;
	padding: 30px;
	margin: 0px auto;
	background: #fff;
	border: 1px solid #333;
}

#login-tbl 
{
	width: 90%;
	margin: auto;
	 
}

#login-tbl td{
	padding : 7px;
}
						
</style>

<!-- css,js -->
<%@ include file="../include/include-header.jspf" %>


<script>
	$(document).ready(function() {
		
		 // 필드 공백 제거
		 $("#username").val().replace(/\s/g, "");
		 $("#password").val().replace(/\s/g, "");
		 
		 $("#login").click(function() {
			
			// 공백 여부 점검
			if ($.trim($("#username").val()) == "" || 
				$.trim($("#password").val()) == "")   {
				
				alert("공백이 입력되었습니다. 다시 입력하십시오.");
				$("#username").val("");
				$("#password").val("");
				
			} else {
				$("form#loginForm").submit();
			} // if
	    	
	    }) // login
	    
	}) //
</script>
</head>
<body>

	<div id="login-box">

		<h3>Login</h3>
		
	<%-- 		
		<c:if test="${error eq 'true'}">
			<div class="msg">${msg}</div>
		</c:if> 
	--%>

		<c:if test="${error eq 'true'}">
			<div class="msg">${msg}</div>
			메시지 :${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}<br>
			메시지 :${msg.message}<br>
		</c:if>
﻿

		<form id="loginForm" 
			  name="loginForm" 
			  action="<c:url value='/login?${_csrf.parameterName}=${_csrf.token}' />"
			  method="POST">
	 
			<table id="login-tbl">
				<tr>
					<td><label for="username" class="mt-2">ID : </label></td>
					<td><input type="text" 
							   id = "username"	
							   name="username" 
							   class="form-control"/>
					</td>
				</tr>
				<tr>
					<td><label for="password" class="mt-2">PW : </label></td>
					<td><input type="password" 
							   id="password"
							   name="password" 
							   class="form-control"/>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						
						<input id="login"
							   name="login" 
							   type="button" 
							   class="btn btn-light pl-3 pr-3"
							   value="로그인" />
						&nbsp;
						<input name="reset" 
							   type="reset" 
							   class="btn btn-light pl-3 pr-3"
							   value="취소" />
					    &nbsp;
						<input id="joinbtn"
					    	   name="joinbtn" 	
					    	   type="button"
					    	   class="btn btn-light pl-3 pr-3"
							   value="회원가입"
							   onclick="location.href='${pageContext.request.contextPath}/member/join'" />	   
					</td>
				</tr>
			</table>
			
			<!-- csrf -->
			<%-- <input type="hidden"                        
				   name="${_csrf.parameterName}"
				   value="${_csrf.token}"/>  --%>
	 
		</form>
	
 	</div> <!-- login box -->	
</body>
</html>