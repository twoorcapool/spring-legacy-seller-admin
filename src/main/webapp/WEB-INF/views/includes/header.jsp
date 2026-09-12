<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Admin System</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/styles.css">
<link rel="stylesheet"
	href="https://cdn.ckeditor.com/ckeditor5/48.4.0/ckeditor5.css"
	crossorigin>
</script>

</head>

<body>		
		
	<!-- NavBar -->
	<nav class="navbar navbar-dark bg-dark fixed-top">
		<div class="container-fluid">

			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/main"> Admin System </a>

			<div class="d-flex align-items-center">
				<span class="text-white me-3"> 관리자님 </span>

				<button class="btn btn-outline-light btn-sm">로그아웃</button>
			</div>

		</div>
	</nav>


	<!-- SideBar -->
	<aside class="sidebar">

		<div class="menu-title">MANAGEMENT</div>

		<nav class="nav flex-column">

			<a class="nav-link active"
				href="${pageContext.request.contextPath}/main"> 대시보드 </a> <a
				class="nav-link"
				href="${pageContext.request.contextPath}/member/list"> 회원 관리 </a> <a
				class="nav-link"
				href="${pageContext.request.contextPath}/product/list"> 상품 관리 </a> <a
				class="nav-link"
				href="${pageContext.request.contextPath}/order/list"> 주문 관리 </a> <a
				class="nav-link" href="${pageContext.request.contextPath}/qna/list">
				Q&A · 신고 관리 </a>

		</nav>


		<div class="menu-title mt-4">ADMINISTRATION</div>

		<nav class="nav flex-column">

			<a class="nav-link"
				href="${pageContext.request.contextPath}/admin/account"> 관리자 계정
			</a>

		</nav>

	</aside>