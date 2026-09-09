<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>

<main class="main-content">

	<!-- 페이지 제목 -->
	<div class="d-flex justify-content-between align-items-center mb-4">

		<div>
			<h2 class="fw-bold mb-1">상품 관리</h2>
			<p class="text-muted mb-0">등록된 상품을 조회하고 관리합니다.</p>
		</div>

		<a href="${pageContext.request.contextPath}/product/register"
			class="btn btn-dark"> + 상품 등록 </a>

	</div>


	<!-- 검색 영역 -->
	<div class="card mb-4">

		<div class="card-body">

			<form action="${pageContext.request.contextPath}/product/list"
				method="get">

				<div class="row g-2">

					<!-- 검색어 -->
					<div class="col-md-4">
						<label class="form-label">상품명</label> <input type="text"
							name="keyword" class="form-control" placeholder="상품명을 입력하세요"
							value="${pageRequestDTO.keyword}">
					</div>


					<!-- 카테고리 -->
					<div class="col-md-3">
						<label class="form-label">카테고리</label> <select name="categoryId"
							class="form-select">

							<option value="">전체 카테고리</option>

							<option value="1"
								${pageRequestDTO.categoryId == 1 ? 'selected' : ''}>소파</option>

							<option value="2"
								${pageRequestDTO.categoryId == 2 ? 'selected' : ''}>의자</option>

							<option value="3"
								${pageRequestDTO.categoryId == 3 ? 'selected' : ''}>테이블
							</option>

							<option value="4"
								${pageRequestDTO.categoryId == 4 ? 'selected' : ''}>수납장
							</option>

							<option value="5"
								${pageRequestDTO.categoryId == 5 ? 'selected' : ''}>조명</option>

						</select>
					</div>


					<!-- 상태 -->
					<div class="col-md-3">
						<label class="form-label">판매 상태</label> <select name="status"
							class="form-select">

							<option value="">전체 상태</option>

							<option value="SELLING"
								${pageRequestDTO.status == 'SELLING' ? 'selected' : ''}>
								판매중</option>

							<option value="SOLD_OUT"
								${pageRequestDTO.status == 'SOLD_OUT' ? 'selected' : ''}>
								품절</option>

							<option value="STOPPED"
								${pageRequestDTO.status == 'STOPPED' ? 'selected' : ''}>
								판매중지</option>

						</select>
					</div>


					<!-- 검색 버튼 -->
					<div class="col-md-2 d-flex align-items-end">
						<button type="submit" class="btn btn-dark w-100">검색</button>
					</div>

				</div>

			</form>

		</div>

	</div>


	<!-- 상품 목록 -->
	<div class="card">

		<div class="card-body">

			<!-- 목록 상단 -->
			<div class="d-flex justify-content-between align-items-center mb-3">

				<div>
					전체 상품 <strong>${responseDTO.total}</strong>개
				</div>

				<select class="form-select form-select-sm" style="width: 100px;"
					onchange="changeSize(this.value)">

					<option value="10" ${requestDTO.size == 10 ? 'selected' : ''}>
						10개</option>

					<option value="20" ${requestDTO.size == 20 ? 'selected' : ''}>
						20개</option>

					<option value="50" ${requestDTO.size == 50 ? 'selected' : ''}>
						50개</option>

				</select>

			</div>


			<!-- 상품 테이블 -->
			<div class="table-responsive">

				<table class="table table-hover align-middle">

					<thead class="table-light">
						<tr>
							<th>번호</th>
							<th>상품명</th>
							<th>카테고리</th>
							<th>판매자</th>
							<th>가격</th>
							<th>재고</th>
							<th>상태</th>
							<th>등록일</th>
						</tr>
					</thead>


					<tbody>

						<c:forEach items="${responseDTO.dtoList}" var="product">

							<tr>

								<td>${product.pno}</td>

								<td><a
									href="${pageContext.request.contextPath}/product/read?pno=${product.pno}"
									class="text-decoration-none fw-semibold"> ${product.pname}
								</a></td>

								<td>${product.categoryId}</td>

								<td>${product.sellerId}</td>

								<td><fmt:formatNumber value="${product.price}"
										pattern="#,###" />원</td>

								<td>${product.stock}</td>

								<td><c:choose>

										<c:when test="${product.status == 'SELLING'}">
											<span class="badge text-bg-success"> 판매중 </span>
										</c:when>

										<c:when test="${product.status == 'SOLD_OUT'}">
											<span class="badge text-bg-secondary"> 품절 </span>
										</c:when>

										<c:when test="${product.status == 'STOPPED'}">
											<span class="badge text-bg-warning"> 판매중지 </span>
										</c:when>

										<c:otherwise>
											<span class="badge text-bg-danger"> 삭제 </span>
										</c:otherwise>

									</c:choose></td>

								<td>${product.regDate.toString().replace('T', ' ')}</td>

							</tr>

						</c:forEach>


						<!-- 조회 결과 없음 -->
						<c:if test="${empty responseDTO.dtoList}">

							<tr>
								<td colspan="8" class="text-center py-5 text-muted">조회된 상품이
									없습니다.</td>
							</tr>

						</c:if>

					</tbody>

				</table>

			</div>


			<!-- 페이지네이션 -->
			<nav class="mt-4">
				<ul class="pagination justify-content-center">
					<!-- Prve -->
					<c:if test="${responseDTO.prev}">
						<li class="page-item">
							<a class="page-link" href="/product/list?page=${responseDTO.start - 1}&size=${requestDTO.size}">
								이전 
							</a>
						</li>
					</c:if>
					<!-- 페이지 번호 -->
					<c:forEach begin="${responseDTO.start}" end="${responseDTO.end}" var="num">
						<li class="page-item ${requestDTO.page == num ? 'active' : ''}">
							<a class="page-link" href="/product/list?page=${num}&size=${requestDTO.size}">
								${num} 
							</a>
						</li>
					</c:forEach>
					<!-- Next -->
					<c:if test="${responseDTO.next}">
						<li class="page-item">
							<a class="page-link" href="/product/list?page=${responseDTO.end + 1}&size=${requestDTO.size}">
								다음 
							</a>
						</li>
					</c:if>
				</ul>
			</nav>

		</div>

	</div>
<!-- 

	<script>
		function changeSize(size) {

			const urlParams = new URLSearchParams(location.search);

			urlParams.set('page', '1');
			urlParams.set('size', size);

			location.href = '${pageContext.request.contextPath}/product/list?'
					+ urlParams.toString();
		}
	</script> -->

</main>

<%@include file="../includes/footer.jsp"%>