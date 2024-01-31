<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head profile="http://www.w3.org/2005/10/profile">
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/join.css">
<title>JOIN</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	// 아이디 중복 체크를 위한 ajax 시작
	function registerCheckFunction() {
		var id = $('#id').val();
		$
				.ajax({
					type : 'POST',
					url : './JoinCheckController',
					data : {
						id : id
					},
					success : function(result) {
						if (result == 1) {
							$('#checkMessage').html('사용할 수 있는 아이디입니다.');
							$('#checkType').attr('class',
									'modal-content panel-success');
							$('#idCheckMessage').html('사용 가능한 아이디입니다.');
							document.getElementById("idCheckMessage").style.color = "blue";
						} else {
							$('#checkMessage').html('사용할 수 없는 아이디입니다.');
							$('#checkType').attr('class',
									'modal-content panel-warning');
							$('#idCheckMessage').html('사용할 수 없는 아이디입니다.');
							document.getElementById("idCheckMessage").style.color = "red";
						}
						$('#checkModal').modal("show");
					}
				})
	}
	//아이디 중복 체크를 위한 ajax 끝

	function passwordCheckFunction() {
		var password = $('#password1').val();
		var check_password = $('#password2').val();
		if (password != check_password) {
			$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
			document.getElementById("passwordCheckMessage").style.color = "red";
		}
		if (password == check_password) {
			$('#passwordCheckMessage').html('비밀번호가 일치합니다.');
			document.getElementById("passwordCheckMessage").style.color = "blue";
		}
	}
</script>
</head>
<body>

	<!-- 회원가입 기능 참고
  https://kimvampa.tistory.com/89 -->


	<!-- 회원가입 폼 시작 -->
	<div
		class="container w-10 position-absolute top-10 start-10 translate-middle">

		<!-- /LoginAndJoincontrol을 이용해서 회원가입 시도 -->
		<form method="POST" action="/join" th:object="${memberDto}">

			<img id="join_img" src="img/join_person.png">
			
			<label id="join_text">회원 가입</label>
			
			<label>Name</label>
			<br> 
			<input type="text" class="form-control" name="user_name" placeholder="이름을 입력해주세요">

			<p></p>

			<label for="name">Id</label>
			<div class="input-group mb-3">
				<input type="text" name="id" placeholder="아이디를 입력해주세요"
					class="form-control" placeholder="Recipient's username"
					aria-label="Recipient's username" aria-describedby="button-addon2">
				<button class="btn btn-outline-secondary" type="button"
					id="idCheck_btn" onclick="registerCheckFunction();">중복</button>
			</div>

			<!-- 아이디 체크 버튼 -->
			<h5 id="idCheckMessage"></h5>

			<p></p>

			<label for="pwd">Password</label> <input type="password"
				class="form-control" id="password1" name="password"
				onkeyup="passwordCheckFunction();" placeholder="비밀번호를 입력해주세요">

			<p></p>

			<label for="pwd">Check Password</label> <input type="password"
				class="form-control" id="password2" name="password2"
				onkeyup="passwordCheckFunction();" placeholder="비밀번호 확인을 입력해주세요">

			<!-- 비밀번호 중복 체크 문구 -->
			<h5 id="passwordCheckMessage"></h5>

			<p></p>

<label for="email">Email address</label> 
<div class="input-group mb-3">
    <input type="text" th:field="*{email}" placeholder="이메일을 입력해주세요"
           class="form-control" placeholder="Recipient's username"
           aria-label="Recipient's username" aria-describedby="button-addon2">
    <button class="btn btn-outline-secondary" type="button" id="email_btn">인증</button>
</div>

<div th:if="${#fields.hasErrors('email')}" class="error-class" th:errors="*{email}"></div>
    <div th:if="${#fields.hasErrors('password')}" class="error-class" th:errors="*{password}"></div>
    
			<p></p>

			<label for="email">Cell Phone</label> <input type="text"
				class="form-control" id="cell_phone" name="cell_phone"
				placeholder="핸드폰 번호를 입력해주세요">

			<p></p>

			<label for="address">address</label>

			<div class="Address">

				<div class="input-group mb-3">
					<input type="text" name="zipNo" required readonly
						placeholder="우편 번호" class="form-control"
						aria-label="Recipient's username" aria-describedby="button-addon2">
					<button class="btn btn-outline-secondary" type="button"
						id="address_btn" onclick="goPopup();">주소 검색</button>
				</div>
			</div>

			<input type="text" class="form-control" id="address" name="address"
				required readonly placeholder="주소"> <input type="text"
				class="form-control" id="addrDetail" name="addrDetail" required
				readonly placeholder="상세주소"> <br>

			<div>
				<input type="submit" class="btn btn-primary pull-center"
					id="join_btn" name="join" value="회원가입">
			</div>

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
							<span aria-hidden="true">&times;</span> <span class="sr-only">close</span>
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

	<div class="modal fade" id="checkModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div id="checkType" class="modal-content panel-info">
					<div class="modal-helper panel-heading">
						<h4 class="modal-title">확인 메시지</h4>
					</div>
					<div class="modal-body" id="checkMessage"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 주소 검색 팝업 -->
	<script>
		// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
		//document.domain = "abc.go.kr";

		function goPopup() {
			// 주소검색을 수행할 팝업 페이지를 호출합니다.
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
			var pop = window.open("spring2/../address/jusoPopup.jsp", "pop",
					"width=570,height=420, scrollbars=yes, resizable=yes");

			// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
			//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
		}

		function jusoCallBack(roadAddrPart1, addrDetail, zipNo) {
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			var addressEl = document.querySelector("#address");
			var addrDetailEl = document.querySelector("#addrDetail");
			var zipNoEl = document.querySelector("#zipNo");
			addressEl.value = roadAddrPart1;
			addrDetailEl.value = addrDetail;
			zipNoEl.value = zipNo;

		}
	</script>
</body>
</html>