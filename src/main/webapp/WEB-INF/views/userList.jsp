<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<!-- 헤더 시작 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<%@ include file="include/header.jsp" %>
<!--  헤더 끝 -->
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
<!-- 네비게이션 시작 -->
<%@ include file="include/left_column.jsp" %>
<!-- 네비게이션 종료 -->
<!-- main_header 시작 -->
<%@ include file="include/main_header.jsp" %>
<!-- main_header 종료 -->
				
				
    <div class="card shadow mb-4">
    <div class="card-header py-3 d-flex justify-content-between flex-grow-1">
        <h6 class="m-0 font-weight-bold text-primary">전체 회원조회</h6>
        <form method="post" id="keyword" name="keyword" action="userSerch">
				<table class="pull-right">
					<tr>
						<td><select class="form-control" name="division">
								<option value="0">선택</option>
								<option value="id">아이디</option>
								<option value="name">이름</option>
								<option value="state">회원상태</option>
								<option value="authority">권한</option>
								<option value="joindate">가입일</option>
						</select></td>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="keyword" maxlength="100"></td>
						<td><button type="submit" class="btn btn-success">검색</button></td>
					</tr>

				</table>
			</form>
        
        </div>
        <div class="input-group">
    <form id="sortForm" action="userSerch" method="post">
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="sortDropdown">
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('id')">아이디↑</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('idDesc')">아이디↓</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('name')">이름↑</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('nameDesc')">이름↓</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('state')">활동중</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('dormancy')">휴면</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('stateDesc')">탈퇴</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('authority')">유저</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('authorityDesc')">관리자</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('joindate')">가입일↑</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('joindateDesc')">가입일↓</a>
        </div>
        <button class="btn dropdown-toggle" type="button" id="sortDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            정렬 기준
        </button>
        <input type="hidden" name="sortBy" id="sortByInput" value="">
    </form>
</div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                
                <thead>
                    <tr>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>회원상태</th>
                        <th>권한</th>
                        <th>가입일</th>
                        <th>상세조회</th>
                    </tr>
                    <c:forEach var="member" items="${userList}">
                        <tr>
                            <td>${member.id}</td>
                            <td>${member.name}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${member.state == 1}">활동중</c:when>
                                    <c:when test="${member.state == 2}">휴면</c:when>
                                    <c:when test="${member.state == 3}">탈퇴</c:when>
                                    <c:otherwise>알 수 없음</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${member.authority == 1}">유저</c:when>
                                    <c:when test="${member.authority == 2}">관리자</c:when>
                                    <c:otherwise>알 수 없음</c:otherwise>
                                </c:choose>
                            </td>
                            <td>${member.joindate}</td>
                            <td>
							  <a href="userDetail?id=${member.id}" class="button">
							    <i class="fas fa-hand-point-right"></i>
							    CLICK
							  </a>
							</td>
                        </tr>
                    </c:forEach>
                </thead>
            </table>
        </div>
    </div>
     <div class="btn-group">
        <a href="${contextPath}/board/adminHome" class="btn btn-primary btn-md">Home</a>
    </div>
</div>
    <!-- 페이징 처리 -->
<div class="pagination">
    <c:choose>
        <c:when test="${currentPage > 1}">
            <a href="${contextPath}/board/userSerch?page=${currentPage - 1}&pageSize=${pageSize}">&laquo; 이전</a>
        </c:when>
        <c:otherwise>
            <span class="disabled">&laquo; 이전</span>
        </c:otherwise>
    </c:choose>
    <c:forEach var="pageNum" begin="1" end="${totalPages}">
        <c:choose>
            <c:when test="${pageNum == currentPage}">
                <span class="active">${pageNum}</span>
            </c:when>
            <c:otherwise>
                <a href="${contextPath}/board/userSerch?page=${pageNum}&pageSize=${pageSize}">${pageNum}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:choose>
        <c:when test="${currentPage < totalPages}">
            <a href="${contextPath}/board/userSerch?page=${currentPage + 1}&pageSize=${pageSize}">다음 &raquo;</a>
        </c:when>
        <c:otherwise>
            <span class="disabled">다음 &raquo;</span>
        </c:otherwise>
    </c:choose>
</div>
<!-- 페이징 처리 끝 -->
    <!-- /.container-fluid -->
</div>
            <!-- End of Main Content -->

            <!-- Footer 시작 -->
            <%@ include file = "include/footer.jsp" %>
            <!-- Footer 끝 -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- 스크롤 최상단 올리기 버튼-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal 시작-->
    <%@ include file = "include/logout_modal.jsp" %>
    <!-- Logout Modal 끝-->

<!-- 자바스크립트 시작 -->
<%@ include file = "include/javascript.jsp" %>
<script>
    // 드롭다운 메뉴에서 항목을 선택했을 때 처리하는 함수
    function handleSortBySelection(sortBy) {
        document.getElementById("sortByInput").value = sortBy;
        document.getElementById("sortForm").submit();
    }
</script>
<style>
    /* 페이징 스타일 */
    .pagination {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
    .pagination a,
    .pagination span {
        padding: 8px 12px;
        margin-right: 5px;
        text-decoration: none;
        color: #333;
        background-color: #f2f2f2;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .pagination a:hover {
        background-color: #e0e0e0;
    }
    .pagination .active {
        background-color: #007bff;
        color: #fff;
    }
    .pagination .disabled {
        pointer-events: none;
        cursor: default;
        background-color: #f2f2f2;
        color: #ccc;
    }
    
    
  /* 폰트 아이콘 스타일링 */
    .fa-hand-point-right {
        color: #FFFFFF;
    }
    
    /* 테이블 스타일링 */
     .card-body {
        padding: 0;
    }
    .table {
        width: 100%;
        border-collapse: collapse;
    }
    .table th,
    .table td {
        padding: 12px 15px;
        text-align: center;
        border: 1px solid #e3e6f0;
    }
    .table th {
        background-color: #f8f9fc;
        font-weight: bold;
        text-transform: uppercase;
    }
    .table tr:nth-child(even) {
        background-color: #f8f9fc;
    }
    
    /* 정렬 스타일링 */
    

	.dropdown-menu {
	  right: 0;
	  left: auto;
	}
    
    .input-group {
        display: flex;
        align-items: center;
        justify-content: flex-end;
    }

    .dropdown-menu {
        min-width: 100px;
        border: none;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .dropdown-item {
        padding: 8px 12px;
        font-size: 14px;
        color: #333;
        transition: background-color 0.3s ease;
    }

    .dropdown-item:hover {
        background-color: #f2f2f2;
    }

    .btn {
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 4px;
        padding: 8px 12px;
        font-size: 14px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .btn:hover {
        background-color: #0056b3;
    }
    
       .button {
  display: inline-block;
  background-color: #000000;
  color: white;
  padding: 5px 10px;
  border: none;
  border-radius: 50px;
  font-size: 8px;
  font-weight: bold;
  text-transform: uppercase;
  text-decoration: none;
  letter-spacing: 1px;
  box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.3);
  cursor: pointer;
  transition: transform 0.2s ease;
}

.button:hover {
  transform: scale(1.05);
}

.fa-hand-point-right,
.fa-trash-alt {
  margin-right: 5px;
}

.fa-hand-point-right {
  animation: rotate 2s infinite;
}

@keyframes rotate {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
  
}
    
</style>

<!-- 자바스크림트 끝 -->

</body>

</html>