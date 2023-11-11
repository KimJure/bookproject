<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
				 
    

<html lang="en">
<!-- 헤더 시작 -->
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
				
				 <title>회원 정보</title>
 
    <h1>회원 정보</h1>
    <table>
        <tr>
            <th>아이디:</th>
            <td>${userDetail.id}</td>
        </tr>
          <tr>
            <th>비밀번호:</th>
           <td>${userDetail.pw}</td>
        </tr>
        <tr>
            <th>이메일:</th>
            <td>${userDetail.email}</td>
        </tr>
        <tr>
            <th>생년월일:</th>
            <td>${userDetail.birth}</td>
        </tr>
        <tr>
            <th>이름:</th>
            <td>${userDetail.name}</td>
        </tr>
        <tr>
            <th>전화번호:</th>
            <td>${userDetail.tel}</td>
        </tr>
        <tr>
            <th>회원상태:</th>
            <td>${userDetail.state}</td>
        </tr>
        <tr>
            <th>권한:</th>
            <td>${userDetail.authority}</td>
        </tr>
        <tr>
            <th>도로명주소:</th>
            <td>${userDetail.roadAddress}</td>
        </tr>
        <tr>
            <th>지번주소:</th>
            <td>${userDetail.jibunAddress}</td>
        </tr>
        <tr>
            <th>상세주소:</th>
            <td>${userDetail.detailAddress}</td>
        </tr>
        <tr>
            <th>참고항목:</th>
            <td>${userDetail.extraAddress}</td>
        </tr>
        <tr>
            <th>우편번호:</th>
            <td>${userDetail.postcode}</td>
        </tr>
        <tr>
            <th>가입일:</th>
            <td>${userDetail.joindate}</td>
            </tr>
    </table>
     <div class="button-container">
    <a href="${contextPath}/board/userUpdateview?id=${userDetail.id}" class="btn update">수정</a>
    <c:if test="${userDetail.state == 3}">
        <form method="post" action="${contextPath}/board/userDrop?id=${userDetail.id}" style="display: inline;" onsubmit="return confirmDrop();">
            <button type="submit" class="btn Drop">회원삭제</button>
        </form>
    </c:if>
     <c:if test="${userDetail.state == 2}">
        <form method="post" action="${contextPath}/board/userRelease?id=${userDetail.id}" style="display: inline;" onsubmit="return confirmRelease();">
            <button type="submit" class="btn Release">휴면해제</button>
        </form>
    </c:if>
    <c:if test="${userDetail.state != 2 && userDetail.state != 3}">
        <form method="post" action="${contextPath}/board/userDelete?id=${userDetail.id}" style="display: inline;" onsubmit="return confirmDelete();">
            <button type="submit" class="btn delete">회원탈퇴</button>
        </form>
    </c:if>
    <a href="${contextPath}/board/userSerch" class="btn confirm">확인</a>
</div>
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
<style>
    body {
        align-items: center;
        justify-content: center;
        font-family: 'Arial', sans-serif;
        background-color: #f5f5f5;
    }

    .button-container {
        text-align: center;
    }
    
	 .btn.Release {
        background-color: orange;
        color: white;
    }
    
    .btn.Drop {
        background-color: #dc3545;
        color: white;
    }
    
    .btn {
        padding: 8px 16px;
        border-radius: 4px;
        font-weight: bold;
        text-transform: uppercase;
        cursor: pointer;
        margin: 5px;
    }

    .update {
        background-color: #007bff;
        color: #fff;
        border: none;
    }

    .delete {
        background-color: #000080;
        color: #fff;
        border: none;
    }

    .confirm {
        background-color: #28a745;
        color: #fff;
        border: none;
    }

    h1 {
        text-align: center;
        color: #333;
        font-family: 'Montserrat', sans-serif;
        font-size: 36px;
        font-weight: bold;
        text-transform: uppercase;
        letter-spacing: 2px;
        margin-top: 0;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        max-width: 600px;
        margin: 20px auto;
        background-color: #fff;
        border-collapse: collapse;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }

    th {
        text-align: left;
        background-color: #f5f5f5;
        font-weight: bold;
    }

    td {
        vertical-align: top;
    }
</style>
<script>
function confirmDelete() {
    if (confirm("탈퇴처리 하시겠습니까?")) {
        alert("해당 계정이 탈퇴처리되었습니다.");
        return true;  // 정지 처리 진행
    } else {
        alert("취소되었습니다.");
        return false; // 정지 처리 취소
    }
}

function confirmDrop() {
    if (confirm("삭제처리 하시겠습니까?")) {
        alert("해당 계정이 삭제처리되었습니다.");
        return true;  // 삭제 처리 진행
    } else {
        alert("취소되었습니다.");
        return false; // 삭제 처리 취소
    }
}

function confirmRelease() {
    if (confirm("휴면해제 처리 하시겠습니까?")) {
        alert("해당 계정이 휴면해제 처리되었습니다.");
        return true;  // 휴면해제 처리 진행
    } else {
        alert("취소되었습니다.");
        return false; // 휴면해제 처리 취소
    }
}
</script>

<!-- 자바스크림트 끝 -->

</body>

</html>