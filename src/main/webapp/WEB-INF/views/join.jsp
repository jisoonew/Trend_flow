<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

<script type="text/javascript" src="./js/join.js"></script>

</head>
<body>

	<!-- 회원가입 기능 참고 https://kimvampa.tistory.com/89 -->

	<!-- 회원가입 폼 시작 -->
	<div
		class="container w-10 position-absolute top-10 start-10 translate-middle">

		<!-- /LoginAndJoincontrol을 이용해서 회원가입 시도 -->
		<form:form method="POST" action="/join" modelAttribute="memberDto" onsubmit="return validatePassword()">

			<img id="join_img" src="img/join_person.png">

			<label id="join_text">회원 가입</label>

			<label>Name</label>
			<br>
			<form:input type="text" class="form-control" name="userName" id="userName"
				path="userName" placeholder="이름을 입력해주세요" />
			<form:errors path="userName" cssClass="error" />
			<p></p>

			<label for="name">Id</label>
			<div class="input-group">
				<form:input type="text" name="userId" id="userId"
					placeholder="아이디를 입력해주세요" class="form-control" path="userId" />
			</div>

			<!-- 아이디 중복 확인 -->
			<form:errors path="userId" cssClass="error" />
			
			<!-- 아이디 중복 여부를 나타내는 메시지를 출력할 요소들 -->
<div id="idAvailable" style="display: none; color: blue;">이 아이디는 사용 가능합니다.</div>
<div id="idNotAvailable" style="display: none; color: red;">이미 사용중인 아이디입니다.</div>

			<p></p>

<label for="pwd">Password</label>
<form:input type="password" class="form-control" id="password1"
    path="password" name="password"
    placeholder="비밀번호를 입력해주세요" />

<p></p>

<label for="pwd">Check Password</label>
<input type="password" class="form-control" id="password2"
    name="confirmPassword"
    placeholder="비밀번호 확인을 입력해주세요">

<!-- 비밀번호 중복 체크 문구 -->
<div id="passwordCheckMessage"></div>

<!-- 비밀번호가 일치하지 않는다면 에러 문구 출력 -->
<form:errors path="confirmPassword" cssClass="error" /> <br>

<!-- 서버에서 발생한 에러 메시지 -->
<form:errors path="password" cssClass="error" />

			<p></p>

			<label for="email">Email address</label>
			<div class="input-group">
				<form:input type="text" placeholder="이메일을 입력해주세요"
					class="form-control" path="email" id="email"
					aria-describedby="button-addon2" />
				<button class="btn btn-outline-secondary" type="button"
					id="email_btn">인증</button>
			</div>

			<form:errors path="email" cssClass="error" />

			<p></p>

			<label for="email">Cell Phone</label>
			<form:input type="text" class="form-control" id="cell_phone"
				oninput="autoHyphen(this)" maxlength="13" path="cell_phone"
				name="cell_phone" placeholder="핸드폰 번호를 입력해주세요" />

			<form:errors path="cell_phone" cssClass="error" />
			<p></p>

			<label for="address">address</label>

			<div class="Address">

				<div class="input-group">
    <input type="text" name="zipNo" required readonly
        placeholder="우편 번호" class="form-control" id="zipNo"
        aria-label="Recipient's username" aria-describedby="button-addon2">
    <button class="btn btn-outline-secondary" type="button"
        id="address_btn" onclick="goPopup();">주소 검색</button>
</div>

			</div>

			<input type="text" class="form-control" id="address" name="address"
				required readonly placeholder="주소">
			<input type="text" class="form-control" id="addrDetail"
				name="addrDetail" required readonly placeholder="상세주소">
			<br>

			<div>
				<input type="submit" class="btn btn-primary pull-center"
					id="join_btn" name="join" value="회원가입">
			</div>

		</form:form>
	</div>

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
