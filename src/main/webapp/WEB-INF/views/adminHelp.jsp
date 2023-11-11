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
        <h6 class="m-0 font-weight-bold text-primary">문의사항 관리</h6>
       
        
        </div>
        <div class="input-group">
    <form id="sortForm" action="adminHelp" method="post">
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="sortDropdown">
           <a class="dropdown-item" href="#" onclick="handleSortBySelection('default')">기본값</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('id')">아이디↑</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('idDesc')">아이디↓</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('title')">제목↑</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('titleDesc')">제목↓</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('complete')">답변완료</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('wating')">대기중</a>
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('hdate')">작성일↑</a>     
            <a class="dropdown-item" href="#" onclick="handleSortBySelection('hdateDesc')">작성일↓</a>
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
                <colgroup>
        <col style="width: 5%;" />
        <col style="width: 5%;" /> 
        <col style="width: 40%;" />
         <col style="width: 5%;" />
        <col style="width: 16%;" />
        <col style="width: 5%;" />
        <col style="width: 5%;" />
    </colgroup>
                <thead>
                    <tr>
                       <th>번호</th>
                        <th>아이디</th>
                        <th>제목</th>
                        <th>상태</th>
                        <th>작성일</th>
                        <th>답변</th>
                        <th>삭제</th>
                    </tr>
                    <c:forEach var="help_board" items="${adminHelp}">
                        <tr>
                           <td>${help_board.hno}</td>
                            <td>${help_board.id}</td>
                            <td>${help_board.title}</td>
                            <td>
                            <c:choose>
                                    <c:when test="${help_board.state == 1}">대기중</c:when>
                                    <c:when test="${help_board.state == 2}">답변완료</c:when>
                                    <c:otherwise>알 수 없음</c:otherwise>
                                </c:choose>
                                </td>
                            <td>${help_board.hdate}</td>
                            <td>
                       <a href="helpAnswer?hno=${help_board.hno}" class="button">
                         <i class="fas fa-hand-point-right"></i>
                         Help
                       </a>
                     </td>
                     <td>
                       <form method="post" action="helpDelete">
                         <input type="hidden" name="hno" value="${help_board.hno}">
                         <button type="submit" class="button" onclick="return deleteCheck()">
                           <i class="fas fa-trash-alt"></i>
                           Delete
                         </button>
                       </form>
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
            <a href="${contextPath}/board/adminHelp?page=${currentPage - 1}&pageSize=${pageSize}">&laquo; 이전</a>
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
                <a href="${contextPath}/board/adminHelp?page=${pageNum}&pageSize=${pageSize}">${pageNum}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:choose>
        <c:when test="${currentPage < totalPages}">
            <a href="${contextPath}/board/adminHelp?page=${currentPage + 1}&pageSize=${pageSize}">다음 &raquo;</a>
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

<script>
  function goToNextPage() {
    document.getElementById("nextPageForm").submit();
  }
  
  function deleteCheck() {
       if (confirm("정말 삭제 하시겠습니까?")) {
           alert("삭제 되었습니다.");
           return true;  // 정지 처리 진행
       } else {
           alert("취소되었습니다.");
           return false; // 정지 처리 취소
       }
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

.fa-hand-point-right,
.fa-trash-alt {
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