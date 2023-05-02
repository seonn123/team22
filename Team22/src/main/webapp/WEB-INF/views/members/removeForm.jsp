<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/assets/css/styles.css" />
<link rel="stylesheet" type="text/css" href="/resources/assets/css/membersignup.css" />



<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
#addressSearch{
margin-top:5px;
padding: 5px;
}
#m_address_primary{
font-size: 15px;
margin-bottom: 5px;
border: 1px solid #000000;
padding: 6px 12px;
border-radius: 5px;
width: 100%;
color: #000;
font-family: "Noto Sans KR", sans-serif

}
#addressRest{
font-size: 15px; border: 1px solid #000000; padding: 6px 12px;
border-radius: 5px;
width: 100%;
color: #000;
font-family: "Noto Sans KR", sans-serif
}


</style>


<script>
///////////////////////////////////////   아이디   ///////////////////////////////////////////////
//아이디 유효성 검사 함수
function validateId(id) {
  let idRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;
  return idRegex.test(id);
}

// 중복 체크 함수
function checkIdDuplicate() {
  let id = $('#id').val();

  if (!validateId(id)) {
    $("#idcheck_blank").css("color", "red");
    $("#idcheck_blank").text("아이디는 8~16자의 영문과 숫자 조합이어야 합니다.");
    return;
  }

  $.ajax({
    url: "idCheck",
    type: "POST",
    data: JSON.stringify(id),
    contentType: "application/json; charset=UTF-8",
    dataType: "JSON",
    success: function(data) {
      if (data) {
        $("#idcheck_blank").css("color", "red");
        $("#idcheck_blank").text("중복된 아이디입니다.");
        $("#id").val("");
      } else {
        $("#idcheck_blank").css("color", "blue");
        $("#idcheck_blank").text("사용 가능한 아이디입니다.");
      }
    }
  });
}
///////////////////////////////////////   아이디   ///////////////////////////////////////////////

//////닉네임 중복 검사////////
function check_nick(){
	var nickCheck=0;
	var inputed =$('#nickname').val();
	
	$.ajax({
		data : inputed,
		url : "nickCheck",
		type : "POST",
		dataType : "JSON",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if(data){
				$("#nickcheck_blank").css("color", "red");
		    	$("#nickcheck_blank").text("중복된 닉네임입니다.");
		    	nick_check = false;
		    	$("#nickname").val("");
				
			}else{
				$("#nickcheck_blank").css("color", "blue");
		    	$("#nickcheck_blank").text("사용가능한 닉네임입니다.");
				}
			}
	});
};


//////////////////////////////   비밀번호   /////////////////////////////////////////////////
$(document).ready(function() {
	let pw = false;
	let checkPw = false;


$("#pw").blur(function() {
	let pwdCheck= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

	if ($("#pw").val() == "") {
		$("#pwdcheck_blank1").css("color", "red");
		$("#pwdcheck_blank1").text("필수정보예요.");
		pw = false;
	}	
	else if (!pwdCheck.test($("#pw").val())) {
		$("#pwdcheck_blank1").css("color", "red");
		$("#pwdcheck_blank1").text("비밀번호는 영문+숫자+특수문자 조합하여 8~16자리를 사용해야 합니다");
		pw = false;
	}else {
		$("#pwdcheck_blank1").css("color", "blue");
		$("#pwdcheck_blank1").text("안전한 비밀번호 입니다. 아래에 한번 더 입력하세요");
		pw = true;
	}
});

$("#checkPw").blur(function() {
	if($("#checkPw").val() == "") {
		$("#pwdcheck_blank2").css("color", "red");
		$("#pwdcheck_blank2").text("필수정보예요.");
		checkPw = false;
	}
	else if(pw == true && $("#pw").val() == $("#checkPw").val()) {
		$("#pwdcheck_blank2").css("color", "blue");
		$("#pwdcheck_blank2").text("비밀번호가 일치합니다!");
		checkPw = true;
	}else {
		$("#pwdcheck_blank2").css("color", "red");
		$("#pwdcheck_blank2").text("비밀번호를 다시 확인해주세요");
		$("#checkPw").val("");
		checkPw = false;
	}
});
});
//////////////////////////////비밀번호   /////////////////////////////////////////////////



////////////////////////////// 주소    //////////////////////////////////////////////////
function exePost() {
	 new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           //바꿔줘야 하는 부분~
           $("[name=member_address]").val(data.zonecode);
           $("[name=m_address_primary]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
//////////////////////////////주소    //////////////////////////////////////////////////
function exePost() {
	 new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           //바꿔줘야 하는 부분~
           $("[name=member_address]").val(data.zonecode);
           $("[name=member_address2]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
//////////////////////////////주소    //////////////////////////////////////////////////


//////////////////////////  이메일 ///////////////////////////////

/**
 *  회원가입 관련 처리
 */
 
 function fn_join(){
	var f = $('#join_frm');
	var formData = f.serialize();
		
	$.ajax({
		type : "POST",
		url : "/join",
		data : formData,
		success: function(data){
			if(data == "Y"){
				alert("회원가입이 완료되었습니다.");	
				location.href="/"
			}else{
				alert("회원가입에 실패하였습니다.");
			}
		},
		error: function(data){
			alert("회원가입 에러 발생!");
			console.log(data);
		}
	});
 }
 

</script>   

</head>
<body>

		<div class="main-content">	

			<h2 class="member-title text-center">회원수정</h2>

			<!-- Form 시작 -->
			<form class="form-signup" id="join" method="post" name="joinform" role="form" enctype="multipart/form-data">
			<input type="hidden" name="member_num" value="${memberInfo.member_num }">
			<input type="hidden" name="member_pay" value="${memberInfo.member_pay }">
				<!-- 닉네임 -->
				<div class="form-label-group">
					<label for="nickname">닉네임</label>
					<br>
					<div class="form-input-box">
						<input type="text" id="nickname" name="member_nickname" class="form-control" value=${memberInfo.member_nickname } required=""> 
						<button type="submit" class="btn btn-info btn-sm" onclick="check_nick();">중복확인</button>
					</div>
					<span id="nickcheck_blank"></span>
					
				</div>

				<!-- 아이디 -->
				<div class="form-label-group">
					<label for="id">아이디</label>
					<br>
					<div id="id_Confirm" class="form-input-box">
						<input type="text" id="id" name="member_id" class="form-control"  value="${memberInfo.member_id }" readonly maxlength="16" size="30" required=""> 
					</div>
					<span id="idcheck_blank"></span>
				</div>
				
				<!-- 비밀번호 -->
				<div class="form-label-group">
					<label for="pwd">비밀번호</label>
					<br>
					<input type="password" id="pw" name="member_pass" class="form-control form-margin-top" placeholder="영문,숫자,특수문자 조합하여 8자~16자" size="30" maxlength="16" required=""> 
				</div>
						<span id="pwdcheck_blank1"></span>
				
				<tr>
		<td></td><td colspan="2" style="font-size: 3px" id="pwdcheck_blank1"></td>
	</tr>
				
				
				<div class="form-label-group">
					<label for="pwdcheck">비밀번호 재확인</label>	
					<br>						
					<input type="password" id="checkPw" name="confirm-password" class="form-control form-margin-top" placeholder="비밀번호 재확인" required="">
				</div>
				<span id="pwdcheck_blank2"></span>
				
				<div class="form-label-group">
					<label for="member_name">이름</label>
					<br>
					<input type="text"  id="name" name="member_name" class="form-control form-margin-top" value="${memberInfo.member_name }" readonly required> 
				</div>
				
				<div class="form-label-group">
					<label for="member_pic">이미지</label>
					<input type="file"  id="name" name="file" class="form-control form-margin-top" value="${memberInfo.member_name }" required> 
					<img alt="" width="150px" height="100px" src="${memberInfo.member_pic }">
					<input type="hidden" name="member_pic" value="${memberInfo.member_pic }">
				</div>
				
				
				
				<div class="form-label-group">
					<label for="addr">우편번호</label>
					<br>
					<input type="text" name="member_address" class="form-control form-margin-top"  value="${memberInfo.member_address }" size="30" readonly="readonly"> 					
					<button type="button" class="btn btn-info btn-sm"onclick="exePost()" id="addressSearch">주소검색</button>	
				</div>
		
		
			<div>
			<tr>		
		<td></td><td colspan="2"><input type="text" id="m_address_primary" name="member_address2" size="50" readonly="readonly" value="${memberInfo.member_address2 }"></td>
		
	</tr>
		<tr>		
		<td></td><td colspan="2"><input type="text" size="50" name="member_address3" value="${memberInfo.member_address3 }"id="addressRest"></td>
	</tr>
			</div>
		
		


				<!-- 문제의 input 부분 -->
			<!-- 	<div class="form-label-group">
					<label for="email">이메일</label>
					<br>		
					<input type="email" id="email" name="member_email" class="form-control form-margin-top" placeholder="이메일"> 
				</div> -->
					<tr>
	<!-- 	<td>이메일</td><td><input type="text" name="member_email" id="email" size="30"></td><td><input type="button" value="인증코드 발송" onclick="sendEmail()"></td>
	</tr>
	<tr>
		<td></td><td><input type="text" id="codeInput" size="30" placeholder="인증번호 입력" disabled="disabled"></td><td></td>
	</tr>
	<tr>
		<td></td><td colspan="2" style="font-size: 3px" id="codecheck_blank"></td>
	</tr> -->
	

				 <div class="form-label-group btn-sign-up-margin">
					<label for="phone">연락처</label>
					<br>	
					<input type="text" id="phone" name="member_phone" class="form-control form-margin-top" value="${memberInfo.member_phone }" required=""> 
				</div>
				 <div class="form-label-group btn-sign-up-margin">
					<label for="phone">이메일</label>
					<br>	
					<input type="text" id="email" name="member_email" class="form-control form-margin-top" value="${memberInfo.member_email }" required=""> 
				</div>
				 
				
				
				<button type="submit" class="btn btn-default">
					<p class="btn-sign-up">
						회원탈퇴
					</p>
				</button>
			</form>
		</div>
<script type="text/javascript">
	//alert("${result}");
	var result = "${result}";
	
	if(result == "O"){
		alert("비밀번호가 일치합니다.");		
	}
	
</script>

</body>
</html>