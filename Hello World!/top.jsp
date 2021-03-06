<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String session_id = (String)session.getAttribute("user");
boolean isStudent = true;
String url = "http://localhost:8020/dbPortal/JSP/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>숙명여자대학교 수강신청</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <!-- 커스텀 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/custom.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" crossorigin="anonymous">
	<link rel="stylesheet" href="../CSS/custom.css">

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
    	<a class="navbar-brand" href= <%=url + "index.jsp"%>>숙명여자대학교 수강신청</a>
    	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbar">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href= <%=url + "enrollCourse.jsp" %>>수강신청</a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href= <%=url + "index.jsp"%>>시간표</a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href="courseEvaluation.jsp">강의평가</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
						회원 관리
					</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<%if(session_id == null){ %>
							<a class="dropdown-item" href= <%=url + "login.jsp"%>>로그인</a>
							<a class="dropdown-item" href= <%=url + "userManage/userJoin.jsp"%>>회원가입</a>
						<%} %>
						<% if(session_id !=null){ %>
							<a class="dropdown-item" href= <%=url + "userManage/updateUserInfo.jsp"%>>정보수정</a>
							<a class="dropdown-item" href= <%=url + "logout.jsp"%>>로그아웃</a>
						<%} %>
					</div>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요." aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>
		</div>
    </nav>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</body>
</html>