<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/login.css">
<title>LOGIN</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>

<body>

  <!-- 로그인 기능 참고
  https://velog.io/@zl0zb/spring-%EB%A1%9C%EA%B7%B8%EC%9D%B8-%ED%8E%98%EC%9D%B4%EC%A7%80-%EB%A7%8C%EB%93%A4%EA%B8%B0-1 -->

  <!-- 로그인 폼 시작 -->
  <div class="container">
  <form method="post" action="/login">
    <h1 style="text-align: center;">로그인</h1>

    <br>

    <div>
        <label id="idLabel">아이디</label>
  <input type="text" name="userId" class="form-control" id="idText" placeholder="아이디를 입력해 주세요.">

      <div>
        <label id="pwLabel">비밀번호</label>
        <input type="password" name="password" class="form-control" id="passwordText" placeholder="비밀번호를 입력해 주세요.">
        <!-- <label>6글자 이상 입력해주세요</label> -->
      </div>
    </div>
    <br>
    <br>

      <button type="submit" id="loginBtn" class="btn btn-warning">로그인</button>

       <a href="/join">
      <button type="button" id="joinBtn" class="btn btn-warning ">회원가입</button>
      </a>

    <br>
    <br>

    <label>아이디가 기억나지 않으십니까?</label><a href="findID.jsp"><label class="ms-2" style="color:rgb(48, 188, 253);">아이디 찾기</label></a>
    <label>비밀번호가 기억나지 않으십니까?</label><a href="findPW.jsp"><label class="ms-2" style="color:rgb(48, 188, 253);">비밀번호 찾기</label></a>

    </form>
   </div>
   
   
   	<%
	String messageContent = null;
	if (session.getAttribute("messageContent") != null) {
		messageContent = (String) session.getAttribute("messageContent");
	}

	String messageType = null;
	if (session.getAttribute("messageType") != null) {
		messageType = (String) session.getAttribute("messageType");
	}

	if (messageContent != null) {
	%>
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content"
					<%if (messageType.equals("오류 메시지"))
							out.println("panel-warning");
							else
							out.println("panel-success");%>>
					<div class="modal-helper panel-heading">
					<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span>
					<span class="sr-only">close</span>
					</button>
						<h4 class="modal-title">
							<%=messageType%>
						</h4>
					</div>
					<div class="modal-body">
						<%=messageContent%>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#messageModal').modal("show");
	</script>
	<%
	session.removeAttribute("messageContent");
	session.removeAttribute("messageType");
	}
	%>
</body>

</html>