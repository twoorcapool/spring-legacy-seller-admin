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
		<a href="${pageContext.request.contextPath}/product/add"
			class="btn btn-dark"> + 상품 등록 </a>
	</div>


	<!-- 검색 영역 -->
	<div class="card mb-4">

		<div class="card-body">

			<form action="${pageContext.request.contextPath}/product/list"
				method="get">

				<div class="row g-2">
					<div class="search-box">

						<!-- 키워드검색 -->
						<div class="search-row">
							<c:set var="keyword">
								<c:out value="${searchDTO.keyword}" />
							</c:set>
							<label>상품 검색</label> <input type="text" name="keyword"
								value="<c:out value='${keyword}'/>"
								placeholder="상품명 또는 설명을 입력하세요">
						</div>

						<!-- 카테고리 검색 -->
						<div class="search-row">
							<label>카테고리</label>
							<div class="dropdown" data-bs-auto-close="outside">
								<button class="btn btn-outline-secondary dropdown-toggle"
									type="button" data-bs-toggle="dropdown">카테고리 선택</button>
								<div class="dropdown-menu categoryList">
									<c:forEach items="${categories}" var="category">
										<label class="dropdown-item"><input type="checkbox"
											name="categoryId" value="${category.categoryId}"
											data-name="${category.name}"> <c:out
												value="${category.name}" /></label>
									</c:forEach>
								</div>
							</div>
						</div>

						<!-- 판매상태 검색 -->
						<div class="search-row">
							<label>판매 상태</label>
							<div class="dropdown">
								<button class="btn btn-outline-secondary dropdown-toggle"
									type="button" data-bs-toggle="dropdown">상태 선택</button>
								<div class="dropdown-menu status-search">
									<label class="dropdown-item"><input type="checkbox"
										name="status" value="SELLING" data-name="판매중"> 판매중</label> <label
										class="dropdown-item"><input type="checkbox"
										name="status" value="SOLD_OUT" data-name="품절"> 품절</label> <label
										class="dropdown-item"><input type="checkbox"
										name="status" value="STOPPED" data-name="판매중지"> 판매중지</label>
								</div>
							</div>
						</div>

						<!-- 선택된 카테고리/상태  -->
						<div id="selectedFilters" class="selected-items"></div>

					</div>
					<div class="row mt-3">
						<div class="col-md-2">
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
									href="${pageContext.request.contextPath}/product/read/${product.pno}?${requestDTO.pageLink}"
									class="text-decoration-none fw-semibold"> ${product.pname}
								</a></td>

								<td>${product.categoryName}</td>

								<td>${product.sellerName}</td>

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
						<li class="page-item"><a class="page-link"
							href="/product/list?page=${responseDTO.start - 1}&size=${requestDTO.size}${searchDTO.link}">
								이전 </a></li>
					</c:if>
					<!-- 페이지 번호 -->
					<c:forEach begin="${responseDTO.start}" end="${responseDTO.end}"
						var="num">
						<li class="page-item ${requestDTO.page == num ? 'active' : ''}">
							<a class="page-link"
							href="/product/list?page=${num}&size=${requestDTO.size}${searchDTO.link}">
								${num} </a>
						</li>
					</c:forEach>
					<!-- Next -->
					<c:if test="${responseDTO.next}">
						<li class="page-item"><a class="page-link"
							href="/product/list?page=${responseDTO.end + 1}&size=${requestDTO.size}${searchDTO.link}">
								다음 </a></li>
					</c:if>
				</ul>
			</nav>

		</div>

	</div>

	<script>
	
		/* Filter Chip 함수 */
		function selectedFilters(containerClass){
			
			const selected = document.querySelector("#selectedFilters");
			
			selected.innerHTML = "";
			
			document.querySelectorAll(`${containerClass} input:checked`).forEach(checkbox => {
		        const span = document.createElement("span");
		        span.innerHTML = checkbox.dataset.name + " × ";
		        selected.appendChild(span);
		    });
			
		}
		
		/* 카테고리 선택 */
		document.querySelector(".categoryList").addEventListener("click", e => {
			 if (!e.target.closest(".dropdown-item")) return;
			 selectedFilters(".categoryList");
		},false)
		
		/* 상품선택 */
		document.querySelector(".status-search").addEventListener("click", e => {
			 if (!e.target.closest(".dropdown-item")) return;
			 selectedFilters(".status-search");
		},false)
				
		
	
	</script>

</main>

<%@include file="../includes/footer.jsp"%>