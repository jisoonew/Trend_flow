<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>기초</title>

<!-- 부트 스트랩 연결 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- 부트스트랩 CSS만 붙여왔을 때는 드롭다운이 작동을 안함, 그래서 부트스르탭 번들 코드를 붙여넣으니까 작동함 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet" href="/css/basic_product.css">
<script src="${pageContext.request.contextPath}/js/basic_product.js"></script>
</head>
<body>
	<div id="Top_Container">
			<!-- 로고 사진 누르면 홈으로 돌아오기 -->
			<a class="navbar-brand" href="/Trend_flow"> <img
				src="/img/logo_remove.png" id="logo_remove">
			</a>

			<!-- 이름 출력 -->
			<% if((boolean) request.getAttribute("loginInfo")) { %>
			<label id="userName_label"><c:out value="${sessionScope.userName}" /></label>
			<% } else { %>
			<label id="userName_label"></label>
			<% } %>

			<!-- 오른쪽 상단에 내 정보 확인할 수 있는 오프캔버스 버튼 -->
			<!-- 로그인을 하지 않은 상태면 로그인 버튼으로 출력하고 로그인을 한 상태라면 내 정보 버튼으로 출력 -->
			<% if((boolean) request.getAttribute("loginInfo")) { %>
			<button class="btn btn-primary btn-danger" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
				aria-controls="offcanvasRight" id="mybtn">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
        <path fill-rule="evenodd"
						d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
      </svg>
			</button>
			<% } else { %>
			<button type="button" class="btn btn-outline-primary"
				onclick="location.href='login'">로그인</button>
			<% } %>
	</div>
	
	
	<!-- 네비게이션 바 -->
	<nav class="navbar navbar-expand-lg navbar-light navbar-fixed-top"
		id="navbar">
		<div class="container-fluid">

			<!-- Home 버튼 -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<!-- 화장품 드롭다운 -->
					<li class="nav-item dropdown"><a
						class="nav-link" id="allProductBtn" role="button" aria-expanded="false"> 전체 </a>
							</li>
						
					<li class="nav-item dropdown"><a class="nav-link"
						href="bestPro" id="navbarDropdown" role="button"
						aria-expanded="false"> BEST </a></li>

					<li class="nav-item dropdown"><a class="nav-link"
						href="newPro" id="navbarDropdown" role="button"
						aria-expanded="false"> 신상 </a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							화장품 </a>

						<ul class="dropdown-menu" id="dropdown-menu-tab"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/newPro">신제품</a></li>
							<hr class="dropdown-divider">

							<li><a class="dropdown-item" href="/bestPro">인기상품</a></li>
							<hr class="dropdown-divider">

							<!-- <li><a class="dropdown-item" href="#">카테고리</a></li>
              <hr class="dropdown-divider"> -->

							<li><a class="dropdown-item" href="cosmetic.nhn">전체보기</a></li>
						</ul></li>

					<!-- 고객 서비스 드롭다운 -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							고객 서비스 </a>

						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="FAQ.nhn">FAQ</a></li>
							<hr class="dropdown-divider">

							<li><a class="dropdown-item" href="announce.nhn">공지사항</a></li>
							<hr class="dropdown-divider">

							<li><a class="dropdown-item" href="ask.jsp">문의사항</a></li>
						</ul></li>
				</ul>
			</div>
			
			
						<!-- 검색창 -->
			<div class="input-group" id="search">
				<input type="text" class="form-control"
					aria-describedby="button-addon2">
				<button class="btn btn-dark" type="button" id="button-addon2">검색</button>
			</div>
		</div>
	</nav>
	
	<!-- 전체 상품 회색 배경 -->
<div id="all_Product_Bar_backgound"></div>

<!-- 전체 상품 리스트 -->
<div id="all_Product_Bar"></div>

<div id="all_Product_Bar_Content">
    <a href="/basic/basic_product">기초</a>
</div>


	<!-- 오프 캔버스 버튼 누르면 나오는 작은 페이지 구성 -->
	<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
		aria-labelledby="offcanvasRightLabel">
		<div class="offcanvas-header"
			style="background-color: rgb(247, 157, 157);">
			<h5 class="offcanvas-title" id="offcanvasRightLabel">My Page</h5>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<svg xmlns="http://www.w3.org/2000/svg" width="70" height="70"
				fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
      <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
      <path fill-rule="evenodd"
					d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
    </svg>
			<label>ㅇㅇㅇ님</label> <a href="myData.html" style="color: black;">
				<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
					fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
      <path
						d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z" />
      <path
						d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z" />
    </svg>
			</a>
			<hr>
			<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
				fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
      <path fill-rule="evenodd"
					d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
    </svg>
			<a href="myBookmark.html"
				style="text-decoration-line: none; color: black;"> <label>찜
					목록</label>
			</a>
			<hr>
			<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
				fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
      <path
					d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
    </svg>
			<a href="mybasket.html"
				style="text-decoration-line: none; color: black;"> <label>장바구니</label>
			</a>
			<hr>
			<div class="justify-content-md-end">
				<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
					fill="currentColor" class="bi bi-credit-card" viewBox="0 0 16 16">
      <path
						d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1H2zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7z" />
      <path
						d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1z" />
    </svg>
				<a href="myHistory.html"
					style="text-decoration-line: none; color: black;"> <label>구매내역</label>
				</a>
			</div>
			<hr>
			<form class="d-flex position-absolute bottom-0 end-0 mb-4 me-4"
				role="logout">
				<button id="logout" type="button" class="btn btn-light bg-danger"
					style="color: white;">로그아웃</button>
			</form>
		</div>
	</div>
	<!-- ==================================== 여기까지 상단 네비게이션 바 내용이였음 ======================================== -->
	<div id="bottomContainer">
		<div id="category_name">홈 > 기초</div>

		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
			<li class="category-nav-item" role="presentation">
				<button class="nav-link categoryBtn active" id="pills-home-tab"
					data-bs-toggle="pill" data-bs-target="#pills-home" type="button"
					role="tab" aria-controls="pills-home" aria-selected="true">전체</button>
			</li>
			<li class="category-nav-item" role="presentation">
				<button class="nav-link categoryBtn" id="pills-profile-tab"
					data-bs-toggle="pill" data-bs-target="#pills-profile" type="button"
					role="tab" aria-controls="pills-profile" aria-selected="false">기초</button>
			</li>
			<li class="category-nav-item" role="presentation">
				<button class="nav-link categoryBtn" id="pills-contact-tab"
					data-bs-toggle="pill" data-bs-target="#pills-contact" type="button"
					role="tab" aria-controls="pills-contact" aria-selected="false">메이크업</button>
			</li>
			<li class="category-nav-item" role="presentation">
				<button class="nav-link categoryBtn" id="pills-final-tab"
					data-bs-toggle="pill" data-bs-target="#pills-final" type="button"
					role="tab" aria-controls="pills-final" aria-selected="false">바디/헤어</button>
			</li>
		</ul>
		<div class="tab-content" id="pills-tabContent">
			<div class="tab-pane fade show active" id="pills-home"
				role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
				
				<!-- 화장품 정보 불러오기 -->
				<div id="cosmetic_container">
				<c:forEach var="cosmetic" items="${basic_product}">
				<div id="cosmetic_box">
					<c:forEach var="coverImage" items="${coverImg}">
						<%-- 이미지와 코스메틱의 cosId가 일치하는지 확인 --%>
						<c:if test="${coverImage.cosId eq cosmetic.cos_id}">
							<%-- 일치한다면 이미지 출력 --%>
							<img src="/${coverImage.imgPath}" id="coverImg" alt="코스메틱 이미지">
						</c:if>
					</c:forEach>
					<div id="cosmetic_content">
						<!-- 화장품명 -->
						<div id="cos_name_container">
						<p id="cos_name"><a href="/basic/basic_product/view?cos_id=${cosmetic.cos_id}">${cosmetic.cos_name}</a></p>
						</div>
						
						<!-- 가격 -->
						<div id="cos_price_container">
						<fmt:formatNumber pattern="###,###" value="${cosmetic.cos_price}" />원
						</div>
					</div>
					</div>
				</c:forEach>
				</div>
			</div>
			<div class="tab-pane fade" id="pills-profile" role="tabpanel"
				aria-labelledby="pills-profile-tab" tabindex="0">두번째</div>
			<div class="tab-pane fade" id="pills-contact" role="tabpanel"
				aria-labelledby="pills-contact-tab" tabindex="0">세번쨰</div>
			<div class="tab-pane fade" id="pills-final" role="tabpanel"
				aria-labelledby="pills-final-tab" tabindex="0">...</div>
		</div>
	</div>
	<!-- ==================================== 여기까지 상단 2번째 네비게이션 바 내용이였음 ======================================== -->

</body>
</html>