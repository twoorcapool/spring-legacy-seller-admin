
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../includes/header.jsp"%>

<main class="main-content">
	<div class="container mt-5 mb-5">
		<div class="mb-4">
			<h3 class="fw-bold mb-1">상품 등록</h3>
			<p class="text-muted mb-0">새로운 상품 정보를 등록합니다.</p>
		</div>

		<div class="card shadow-sm border-0">
			<div class="card-body p-4">
				<form action="${pageContext.request.contextPath}/product/add"
					method="post">

					<div class="mb-4">
						<label for="pname" class="form-label fw-bold">상품명</label> <input
							type="text" id="pname" name="pname" class="form-control"
							placeholder="상품명을 입력하세요" required>
					</div>

					<div class="mb-4">
						<label for="pdesc" class="form-label fw-bold">상품 설명</label>
						<textarea id="pdesc" name="pdesc" class="form-control" rows="6"
							placeholder="상품 설명을 입력하세요"></textarea>
					</div>

					<div class="row g-4">
						<div class="col-md-6">
							<label for="price" class="form-label fw-bold">가격</label> <input
								type="number" id="price" name="price" class="form-control"
								placeholder="가격을 입력하세요" min="0" required>
						</div>

						<div class="col-md-6">
							<label for="stock" class="form-label fw-bold">재고</label> <input
								type="number" id="stock" name="stock" class="form-control"
								placeholder="재고 수량을 입력하세요" min="0" required>
						</div>
					</div>

					<div class="row g-4 mt-1">
						<div class="col-md-6">
							<label for="categoryId" class="form-label fw-bold">카테고리</label> <select
								id="categoryId" name="categoryId" class="form-select" required>
								<option value="">카테고리를 선택하세요</option>
								<c:forEach items="${categories}" var="category">
									<option value="${category.categoryId}"><c:out
											value="${category.name}" /></option>
								</c:forEach>
							</select>
						</div>

						<div class="col-md-6">
							<label for="status" class="form-label fw-bold">판매 상태</label> <select
								id="status" name="status" class="form-select" required>
								<option value="">판매 상태를 선택하세요</option>
								<option value="SELLING">판매중</option>
								<option value="SOLD_OUT">품절</option>
								<option value="STOPPED">판매중지</option>
							</select>
						</div>
					</div>

					<div class="d-flex justify-content-between mt-5">
						<a href="${pageContext.request.contextPath}/product/list"
							class="btn btn-outline-secondary">취소</a>
						<button type="submit" class="btn btn-primary px-4">상품 등록</button>
					</div>


				</form>
			</div>
		</div>
	</div>
</main>

<%@include file="../includes/footer.jsp"%>

