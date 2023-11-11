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
				<div class="button-container">
    <form action="${contextPath}/board/userUpdate?id=${userDetail.id}" method="post">
				 <title>회원 정보</title>
 
    <h1>회원 정보</h1>
    <table>
    <tr>
        <th>아이디:</th>
        <td>${userDetail.id}</td>
    </tr>
    <tr>
        <th>비밀번호:</th>
        <td><input type="password" value="${userDetail.pw}" id = "pw" name = "pw" required></td>
    </tr>
    <tr>
        <th>이메일:</th>
        <td><input type="text" value="${userDetail.email}" id = "email" name = "email" required></td>
    </tr>
    <tr>
        <th>생년월일:</th>
        <td><input type="text" value="${userDetail.birth}" id = "birth" name = "birth" required></td>
    </tr>
    <tr>
        <th>이름:</th>
        <td><input type="text" value="${userDetail.name}" id = "name" name = "name" required></td>
    </tr>
    <tr>
        <th>전화번호:</th>
        <td><input type="text" value="${userDetail.tel}" id = "tel" name = "tel" required></td>
    </tr>
    <tr>
        <th>회원상태:</th>
        <td>${userDetail.state}</td>
        <input type="hidden" name="state" value="${userDetail.state}">
    </tr>
    <tr>
        <th>권한:</th>
        <td><input type="text" value="${userDetail.authority}" id = "authority" name = "authority" required></td>
    </tr>
    <tr>
        <th>도로명주소:</th>
        <td><input type="text" value="${userDetail.roadAddress}" id = "roadAddress" name = "roadAddress" required></td>
    </tr>
    <tr>
        <th>지번주소:</th>
        <td><input type="text" value="${userDetail.jibunAddress}" id = "jibunAddress" name = "jibunAddress" required></td>
    </tr>
    <tr>
        <th>상세주소:</th>
        <td><input type="text" value="${userDetail.detailAddress}" id = "detailAddress" name = "detailAddress" required></td>
    </tr>
    <tr>
        <th>참고항목:</th>
        <td><input type="text" value="${userDetail.extraAddress}" id = "extraAddress" name = "extraAddress"></td>
    </tr>
    <tr>
        <th>우편번호:</th>
        <td><input type="text" value="${userDetail.postcode}" id = "postcode" name = "postcode" required></td>
    </tr>
    <tr>
        <th>가입일:</th>
        <td>${userDetail.joindate}</td>
    </tr>
</table>
        <button type="submit" class="btn confirm" onclick="return confirmConfirm()">확인</button>
        <a href="${contextPath}/board/userDetail?id=${userDetail.id}" class="btn cancel" onclick="return confirmCencle()">취소</a>
    </form>
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

    .btn {
        padding: 8px 16px;
        border-radius: 4px;
        font-weight: bold;
        text-transform: uppercase;
        cursor: pointer;
        margin: 5px;
    }

    .cancel {
        background-color: #007bff;
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
function confirmConfirm() {
    if (confirm("수정처리 하시겠습니까?")) {
        alert("해당 정보가 수정되었습니다.");
        return true;  // 정지 처리 진행
    } else {
        alert("취소되었습니다.");
        return false; // 정지 처리 취소
    }
}

function confirmCancel() {
    if (confirm("취소 하시겠습니까?")) {
        alert("취소되었습니다.");
        return true;  // 삭제 처리 진행
    } else {
        alert("취소되었습니다.");
        return false; // 삭제 처리 취소
    }
}

</script>


<!-- 자바스크림트 끝 -->

</body>

</html>