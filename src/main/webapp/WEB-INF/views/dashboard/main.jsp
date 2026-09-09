<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<!-- Main Content -->
<main class="main-content">

	<div class="d-flex justify-content-between align-items-center mb-4">

		<div>
			<h2 class="fw-bold mb-1">대시보드</h2>
			<p class="text-muted mb-0">관리자 시스템의 주요 현황을 확인할 수 있습니다.</p>
		</div>

	</div>


	<!--Summary Cards-->
	<div class="row g-4 mb-4">

		<div class="col-md-6 col-xl-3">
			<div class="card dashboard-card">
				<div class="card-body">
					<div class="card-title">전체 회원</div>
					<div class="card-value">1,248</div>
					<small class="text-muted"> 전체 가입 회원 </small>
				</div>
			</div>
		</div>


		<div class="col-md-6 col-xl-3">
			<div class="card dashboard-card">
				<div class="card-body">
					<div class="card-title">판매 상품</div>
					<div class="card-value">326</div>
					<small class="text-muted"> 현재 판매 중인 상품 </small>
				</div>
			</div>
		</div>


		<div class="col-md-6 col-xl-3">
			<div class="card dashboard-card">
				<div class="card-body">
					<div class="card-title">오늘 주문</div>
					<div class="card-value">42</div>
					<small class="text-muted"> 오늘 접수된 주문 </small>
				</div>
			</div>
		</div>


		<div class="col-md-6 col-xl-3">
			<div class="card dashboard-card">
				<div class="card-body">
					<div class="card-title">미처리 문의</div>
					<div class="card-value">7</div>
					<small class="text-muted"> 답변이 필요한 문의 </small>
				</div>
			</div>
		</div>

	</div>


	<!--Recent Data-->
	<div class="row g-4">

		<!-- Recent Orders -->
		<div class="col-lg-7">

			<div class="card section-card">

				<div class="card-header bg-white py-3">
					<div class="d-flex justify-content-between align-items-center">

						<h5 class="mb-0 fw-semibold">최근 주문</h5>

						<a href="${pageContext.request.contextPath}/order/list"
							class="btn btn-sm btn-outline-secondary"> 전체보기 </a>

					</div>
				</div>


				<div class="card-body p-0">

					<div class="table-responsive">

						<table class="table table-hover mb-0">

							<thead class="table-light">
								<tr>
									<th>주문번호</th>
									<th>상품</th>
									<th>금액</th>
									<th>상태</th>
								</tr>
							</thead>

							<tbody>

								<tr>
									<td>ORD-10024</td>
									<td>원목 식탁</td>
									<td>350,000원</td>
									<td><span class="badge bg-primary"> 주문완료 </span></td>
								</tr>

								<tr>
									<td>ORD-10023</td>
									<td>패브릭 소파</td>
									<td>780,000원</td>
									<td><span class="badge bg-warning text-dark"> 배송중 </span></td>
								</tr>

								<tr>
									<td>ORD-10022</td>
									<td>수납장</td>
									<td>220,000원</td>
									<td><span class="badge bg-success"> 배송완료 </span></td>
								</tr>

							</tbody>

						</table>

					</div>

				</div>

			</div>

		</div>


		<!-- Recent Q&A -->
		<div class="col-lg-5">

			<div class="card section-card">

				<div class="card-header bg-white py-3">

					<div class="d-flex justify-content-between align-items-center">

						<h5 class="mb-0 fw-semibold">최근 문의</h5>

						<a href="${pageContext.request.contextPath}/qna/list"
							class="btn btn-sm btn-outline-secondary"> 전체보기 </a>

					</div>

				</div>


				<div class="card-body p-0">

					<ul class="list-group list-group-flush">

						<li class="list-group-item py-3">
							<div class="fw-semibold">배송은 언제 시작되나요?</div> <small
							class="text-muted"> user01 · 10분 전 </small>
						</li>

						<li class="list-group-item py-3">
							<div class="fw-semibold">상품 교환 문의드립니다.</div> <small
							class="text-muted"> user02 · 30분 전 </small>
						</li>

						<li class="list-group-item py-3">
							<div class="fw-semibold">상품에 문제가 있습니다.</div> <small
							class="text-muted"> user03 · 1시간 전 </small>
						</li>

					</ul>

				</div>

			</div>

		</div>

	</div>

</main>



<%@include file="../includes/footer.jsp"%>
