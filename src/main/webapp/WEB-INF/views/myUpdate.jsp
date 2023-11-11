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
				
				
  <!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->


                    <!-- Main content -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">내정보</h6>
                            <div>${msg}</div>
                        </div>
                        
                        <div class="card-body">
                            <div class="table-responsive">
                            <form name="myUpdate" method="post" action="${contextPath}/myUpdate" onsubmit="return validation();">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <tr>
						           <th>아이디</th>
						           <td><span id="id">${MemberDTO.id}</span>
						           <input type="hidden" id="id" name="id" value="${MemberDTO.id}">
						           </td>
						           
						        </tr>
						        <tr>
						           <th>*비밀번호</th>
						           <td><input type="password" id="pw" name="pw" value="${MemberDTO.pw}">
						           </td>
						        </tr>
						   
						        <tr>
						           <th>*이름</th>
						           <td><input type="text" id="name" name="name" value="${MemberDTO.name}"></td>
						        </tr>
						        <tr>
						           <th>생년월일</th>
						           <td><input type="date" id="birth" name="birth" value="${MemberDTO.birth}" min="1900-01-01" max="2023-05-25"></td>
						        </tr>
						        <tr>
						           <th>주소</th>
						           <td>우편번호<input type="text" id="postcode" name="postcode" value="${MemberDTO.postcode}"><br>
						           도로명주소<input type="text" id="roadAddress" name="roadAddress" value="${MemberDTO.roadAddress}" size="35"><br>
						           지번주소<input type="text" id="jibunAddress" name="jibunAddress" value="${MemberDTO.jibunAddress}" size="40"><br>
						           상세주소<input type="text" id="detailAddress" name="detailAddress" value="${MemberDTO.detailAddress}" size="20"><br>
						           참고항목<input type="text" id="extraAddress" name="extraAddress" value="${MemberDTO.extraAddress}" size="10"><br>
						           <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"></td><br>
						        </tr>
						        <tr>
						           <th>*전화번호</th>
						           <td>
						           <select id="tel1" name="tel1" value="">
						              <option value="010" checked>010</option>
						              <option value="011">011</option>
						              <option value="017">017</option>
						              <option value="018">018</option>
						              <option value="019">019</option>
						           </select>
						           <input type="text" id="tel2" name="tel2" maxlength="4" size="3" value="">
						           <input type="text" id="tel3" name="tel3" maxlength="4" size="3" value="">
						           <input type="hidden" id="tel" name="tel" value="${MemberDTO.tel}">
						           </td>
						        </tr>
						        <tr>
						           <th>*이메일</th>
						           <td><input type="email" id="email" name="email" value="${MemberDTO.email}">
						           </td>
						        </tr>
						        <tr>
						        	<th>가입일</th>
						        	<td>
						        	<span id="joindate">${MemberDTO.joindate}</span>
						        	<input type="hidden" id="state" name="state" value="${MemberDTO.state}">
						           <input type="hidden" id="authority" name="authority" value="${MemberDTO.authority}">
						           <input type="hidden" id="agree" name="agree" value="${MemberDTO.agree}">
						           </td>
						        </tr>
						         <tr>
						           <td colspan="5" align="center">
						             <input class="btn btn-primary" type="submit" value="수정하기">
						             <a href="${contextPath}" class="btn btn-primary">취소</a>
						           </td>
						       </tr>
						        </table>
						        </form>
                            </div>
                        </div>
                    </div>

                </div>
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
$(document).ready(function() {
  var tel = document.getElementById("tel").value;
  
  var tel1 = tel.substring(0, 3); // 010
  var tel2 = tel.substring(3, 7); // 1234
  var tel3 = tel.substring(7); // 5678
  
  document.getElementById("tel1").value = tel1;
  document.getElementById("tel2").value = tel2;
  document.getElementById("tel3").value = tel3;
});
</script>
<script>
$(function(){
      $(".btn-primary").click(function(){
        var tel1 = document.getElementById("tel1").value;
        var tel2 = document.getElementById("tel2").value;
        var tel3 = document.getElementById("tel3").value;
        
         $("#tel").attr('value', tel1+tel2+tel3);
      });
})
</script>
<script>
function validation(){
    var name = document.getElementById("name").value;
    var pw = document.getElementById("pw").value;
    var email = document.getElementById("email").value;
    var tel = document.getElementById("tel").value;
    
    var pwRE = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/;
    var emailRE = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    
    if(!pwRE.test(pw)){
        alert("비밀번호 형식이 잘못되었습니다.");
        return false;
    }
    
    if(name==""){
         alert("이름을 입력해주세요.");
         return false;
    }
    
    if(!emailRE.test(email)){
        alert("이메일 형식이 잘못되었습니다.");
        return false;
    }
    
    if (!/^\d+$/.test(tel)) {
    	alert("전화번호는 숫자로만 이루어져야 합니다.");
        return false;
      }
    
    alert("회원정보가 수정되었습니다.");
    
 }
</script>
<!-- 자바스크림트 끝 -->

</body>

</html>