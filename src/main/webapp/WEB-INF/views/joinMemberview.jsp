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
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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

<div class="form-container">
<form action="joinMember" method="POST">
  <label for="id">ID: <span id="id-validation" style="color: red; display: none;"></span></label> 
  <input type="text" id="id" name="id"  required>
 <input type="button" onclick="checkDuplicate()" value="중복확인">
 <span id="idErrorMessage" style="color: red; display: none;"> <br></span>

<label for="pw">비밀번호: <span id="pw-validation" style="color: red; display: none;"></span>
<i id="pw-toggle-icon" class="fas fa-eye password-toggle-icon"></i><br></label>
<input type="password" id="pw" name="pw" required>
  
  <label for="name">이름: <span id="name-validation" style="color: red; display: none;"></span></label>
  <input type="text" id="name" name="name" required><br>
  
 <label for="email">이메일: <span id="email-validation" style="color: red; display: none;"></span></label>
<input type="text" id="email" name="email" required>
<input type="text" value="@naver.com" readonly><br>

  
  <label for="tel">전화번호: <span id="tel-validation" style="color: red; display: none;"></span></label>
  <input type="tel" id="tel" name="tel" required><br>
  
   <label for="birth">생년월일:</label>
  <input type="date" id="birth" name="birth" required><br>
  
  <!-- 주소 -->
    <label for="row">주소:</label>
      <input type="text" id="postcode" name="postcode" placeholder="우편번호"  required>
      <input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소"  required>
      <input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소"  required>
      <span id="guide" style="color:#999;display:none"></span>
      <input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
      <input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목"  required>
      <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
    </p>
  </td>
  
  <input type="checkbox" id="agree" name="agree" value="1" required>
<label for="agree">개인정보 동의</label><br>
<input type="hidden" name="agree" value="2">
  
   <button type="submit" onclick="return validateForm()">가입</button>
  <a href="${contextPath}"><input type="button" value="취소"></a>
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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

<script>

// 중복검사 기능
 var idCheck = null;
  
function checkDuplicate() {
  var id = document.getElementById('id').value;

  // Ajax 요청 생성
  var xhr = new XMLHttpRequest();
  xhr.open('POST', 'checkDuplicateId', true);
  xhr.setRequestHeader('Content-Type', 'application/json');

  // 응답 처리
  xhr.onload = function () {
  if (xhr.status === 200) {
    var response = JSON.parse(xhr.responseText);
    if (response === true) {
      // 중복된 경우 처리
      document.getElementById('id-validation').style.display = 'none';
      document.getElementById('idErrorMessage').innerText = '이미 사용 중인 ID입니다.';
      document.getElementById('idErrorMessage').style.display = 'block';
      idCheck = 1;
    } else {
      // 중복되지 않은 경우 처리
      document.getElementById('id-validation').style.display = 'none';
      document.getElementById('idErrorMessage').innerText = '사용 가능한 ID입니다.';
      document.getElementById('idErrorMessage').style.display = 'block';
      idCheck = 2;
    }
  } else {
    // 요청 실패 처리
    console.error('중복 검사 요청 실패');
  }
};
  // 요청 전송
  xhr.send(JSON.stringify({ id: id }));
}


// 페이지 로드 시 자동으로 유효성 검사 수행
window.addEventListener("DOMContentLoaded", function() {
  validateID();
  validatePassword();
  validateName();
  validateEmail();
  validateTel();
});

// 이벤트 리스너 추가
document.getElementById("id").addEventListener("input", function() {
  validateID();
});

document.getElementById("pw").addEventListener("input", function() {
  validatePassword();
});

document.getElementById("name").addEventListener("input", function() {
     validateName();
   });

document.getElementById("email").addEventListener("input", function() {
     validateEmail();
   });
document.getElementById("tel").addEventListener("input", function() {
     validateTel();
   });

// 비밀번호 표시/숨김 토글 기능 추가
var passwordInput = document.getElementById("pw");
var passwordToggleIcon = document.getElementById("pw-toggle-icon");

passwordToggleIcon.addEventListener("click", function() {
  if (passwordInput.type === "password") {
    passwordInput.type = "text";
    passwordToggleIcon.classList.remove("fa-eye");
    passwordToggleIcon.classList.add("fa-eye-slash");
  } else {
    passwordInput.type = "password";
    passwordToggleIcon.classList.remove("fa-eye-slash");
    passwordToggleIcon.classList.add("fa-eye");
  }
});
</script>
<script>
// ID

function validateID() {
  // ID 입력값 가져오기
  var idInput = document.getElementById("id").value;

  // 유효성 검사 메시지 요소 가져오기
  var idvalidationMsg = document.getElementById("id-validation");

  // ID가 비어있는지 확인
  if (idInput.trim() === "") {
    idvalidationMsg.textContent = "ID를 입력해주세요.";
    idvalidationMsg.style.display = "inline";
    return false;
  }

  // ID가 패턴과 일치하는지 확인
  var idPattern = /^[a-z0-9]{5,20}$/;
  if (!idPattern.test(idInput)) {
    idvalidationMsg.textContent = "5~20자의 영문 소문자, 숫자만 사용 가능";
    idvalidationMsg.style.display = "inline";
    return false;
  }

  // ID가 유효한 경우 유효성 검사 메시지 표시
  idvalidationMsg.textContent = "";
  idvalidationMsg.style.display = "none";
  return true;
}

// 비밀번호

function validatePassword() {
  // 비밀번호 입력값 가져오기
  var pwInput = document.getElementById("pw").value;

  // 비밀번호 유효성 검사 메시지 요소 가져오기
  var pwValidationMsg = document.getElementById("pw-validation");

  // 비밀번호가 비어있는지 확인
  if (pwInput.trim() === "") {
    pwValidationMsg.textContent = "비밀번호를 입력해주세요.";
    pwValidationMsg.style.display = "inline";
    return false;
  }

  // 비밀번호가 패턴과 일치하는지 확인
  var pwPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;
  if (!pwPattern.test(pwInput)) {
    pwValidationMsg.textContent = "8~16자 대소문자, 숫자, 특수문자 포함 사용";
    pwValidationMsg.style.display = "inline";
    return false;
  }

  // 비밀번호가 유효한 경우 유효성 검사 메시지 숨김 처리
  pwValidationMsg.textContent = "";
  pwValidationMsg.style.display = "none";
  return true;
}

//이름

function validateName() {
  var nameInput = document.getElementById("name").value;
  var nameValidationMsg = document.getElementById("name-validation");

  if (nameInput.trim() === "") {
    nameValidationMsg.textContent = "이름을 입력해주세요.";
    nameValidationMsg.style.display = "inline";
    return false;
  }
  
  var namePattern = /^[가-힣]{1,10}$/;
  if (!namePattern.test(nameInput)) {
    nameValidationMsg.textContent = "이름을 정확히 입력해주세요.";
    nameValidationMsg.style.display = "inline";
    return false;
  }
  
  nameValidationMsg.textContent = "";
  nameValidationMsg.style.display = "none";
  return true;
}

//email

function validateEmail() {
  // email 입력값 가져오기
  var emailInput = document.getElementById("email").value;

  // email 유효성 검사 메시지 요소 가져오기
  var emailValidationMsg = document.getElementById("email-validation");

  // email 비어있는지 확인
  if (emailInput.trim() === "") {
    emailValidationMsg.textContent = "이메일을 입력해주세요.";
    emailValidationMsg.style.display = "inline";
    return false;
  }
  
  var emailPattern = /^[a-zA-Z0-9]+$/;
  if (!emailPattern.test(emailInput)) {
    emailValidationMsg.textContent = "이메일을 정확히 입력해주세요.";
    emailValidationMsg.style.display = "inline";
    return false;
  }

  // email 유효한 경우 유효성 검사 메시지 표시
  emailValidationMsg.textContent = "";
  emailValidationMsg.style.display = "none";
  return true;
}

//전화번호

function validateTel() {
  // 전화번호 입력값 가져오기
  var telInput = document.getElementById("tel").value;

  // 전화번호 유효성 검사 메시지 요소 가져오기
  var telValidationMsg = document.getElementById("tel-validation");

  // 전화번호가 비어있는지 확인
  if (telInput.trim() === "") {
    telValidationMsg.textContent = "전화번호를 입력해주세요.";
    telValidationMsg.style.display = "inline";
    return false;
  }

  // 전화번호가 패턴과 일치하는지 확인
  var telPattern = /^\d{11}$/;
  if (!telPattern.test(telInput)) {
    telValidationMsg.textContent = "'-'을 제외하고 입력해주세요";
    telValidationMsg.style.display = "inline";
    return false;
  }

  // 전화번호가 유효한 경우 유효성 검사 메시지 표시
  telValidationMsg.textContent = "";
  telValidationMsg.style.display = "none";
  return true;
}


//전체 폼 유효성 검사 함수
function validateForm() {
  var isValid = true;
  var idValid = validateID();
  var pwValid = validatePassword();
  var nameValid = validateName();
  var emailValid = validateEmail();
  var telValid = validateTel();
   
  if (idCheck === null) {
       alert('아이디 중복 체크를 확인해주세요.');
       return false;
     } else if (idCheck === 1) {
       alert('다른 아이디를 입력해주세요.');
       return false;
     }
  
  // 각 필드별 유효성 검사 함수 호출
  if (!idValid || !pwValid || !nameValid || !emailValid || !telValid) {
    isValid = false;
    alert('항목을 양식에 맞게 입력해주세요.');
    event.preventDefault(); // 이벤트 막기
  }
  else{
  alert('가입이 완료되었습니다.');
  return isValid;
  }
}
   
</script>

 <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
    }
    
    .form-container {
      max-width: 450px;
      margin: 0 auto;
      padding: 20px;
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 5px;
    }
    
    label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
      color: #555;
    }
    
    input[type="text"],
    input[type="password"],
    input[type="email"],
    input[type="tel"],
    input[type="date"] {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 3px;
      font-size: 14px;
      margin-bottom: 10px;
      box-sizing: border-box;
    }
    
    input[type="button"],
    input[type="submit"] {
      padding: 10px 20px;
      border: none;
      background-color: #555;
      color: #fff;
      font-size: 14px;
      cursor: pointer;
      border-radius: 3px;
    }
    
    input[type="button"]:hover,
    input[type="submit"]:hover {
      background-color: #333;
    }
    
    input[type="checkbox"] {
      margin-top: 10px;
    }
    
    button[type="submit"] {
      padding: 10px 20px;
      border: none;
      background-color: #555;
      color: #fff;
      font-size: 14px;
      cursor: pointer;
      border-radius: 3px;
      }
    
    .form-title {
      text-align: center;
      font-size: 24px;
      margin-bottom: 20px;
      color: #555;
    }
    
    <style>
  .password-toggle-icon {
    cursor: pointer;
    margin-left: 5px;
  }
</style>
  </style>
<!-- 자바스크림트 끝 -->

</body>

</html>