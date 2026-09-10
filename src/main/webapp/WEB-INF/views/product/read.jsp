```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>

<main class="main-content">
${requestDTO.pageLink}
${requestDTO.search.link}
    <div class="container mt-5 mb-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h3 class="fw-bold mb-1">상품 상세</h3>
                <p class="text-muted mb-0">등록된 상품의 상세 정보를 확인합니다.</p>
            </div>
            <span class="badge bg-secondary">상품 번호 ${product.pno}</span>
        </div>

        <div class="card shadow-sm border-0">
            <div class="card-body p-4">
                <div class="row g-4">

                    <div class="col-md-8">
                        <h4 class="fw-bold mb-4">
                            <c:out value="${product.pname}" />
                        </h4>

                        <div class="mb-4">
                            <h6 class="fw-bold text-secondary mb-2">상품 설명</h6>
                            <div class="p-3 bg-light rounded">
                                <c:out value="${product.pdesc}" />
                            </div>
                        </div>

                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="border rounded p-3 h-100">
                                    <div class="text-muted small mb-1">카테고리</div>
                                    <div class="fw-bold">${product.categoryName}</div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="border rounded p-3 h-100">
                                    <div class="text-muted small mb-1">판매자</div>
                                    <div class="fw-bold">${product.sellerName}</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="bg-light rounded p-4 h-100">
                            <h6 class="fw-bold mb-4">판매 정보</h6>

                            <div class="mb-4">
                                <div class="text-muted small mb-1">판매 상태</div>

                                <c:choose>
                                    <c:when test="${product.status == 'SELLING'}">
                                        <span class="badge bg-success">판매중</span>
                                    </c:when>
                                    <c:when test="${product.status == 'SOLD_OUT'}">
                                        <span class="badge bg-secondary">품절</span>
                                    </c:when>
                                    <c:when test="${product.status == 'STOPPED'}">
                                        <span class="badge bg-danger">판매중지</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-secondary">${product.status}</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>

                            <div>
                                <div class="text-muted small mb-1">상품 번호</div>
                                <div class="fw-bold">${product.pno}</div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="card-footer bg-white border-top p-3">
                <div class="d-flex justify-content-between">
                    <a href="${pageContext.request.contextPath}/product/list?${requestDTO.pageLink}" class="btn btn-outline-secondary">목록</a>

                    <a href="${pageContext.request.contextPath}/product/modify/${product.pno}?${requestDTO.pageLink}" class="btn btn-primary">상품 수정</a>
                </div>
            </div>
        </div>
    </div>
</main>

<%@include file="../includes/footer.jsp"%>
```
