$(function(){
	$("#contactForm").validate({
		rules:{			
			name:{
				required:true,
				rangelength:[2,4]
			},
			birthYear:{
				required:true,
				rangelength:[8]				
			},
			userid:{
				required:true,
				validId : true
			},
			password:{
				required:true,
				validPwd : true,
				rangelength:[6,15]
			},
			current_password:{
				required:true,
				validPwd : true,				
				equalTo: "#password"
			},
			email:{
				required:true,
				email:true
			},
			phone_number:{
				required:true
			}
		},
		messages:{
			name:{
				required : "이름은 필수 입력 요소입니다.",
				rangelength : "이름은 2~4자리로 입력해야 합니다."
			},
			birthYear:{
				required:"생년월일은 필수 입력 요소입니다.",
				rangelength:"생년월일을 확인해 주세요"				
			},
			userid:{
				required: "필수 입력 요소입니다.",	
				remote : "이 아이디는 사용중입니다."
			},
			password:{
				required:"필수 입력 요소입니다.",				
			},
			current_password:{
				required : "필수 입력 요소입니다.",
				equalTo : "이전 비밀번호와 동일하게 입력해주세요"
			},
			email:{
				required : "이메일은 필수입니다."				
			},
			phone_number:{
				required: "핸드폰 번호는 필수 입력 요소입니다."
			}
		},		
		errorPlacement:function(error,element){
			$(element).closest("form").find("small[id='"+element.attr("id")+"']").append(error);			
		}
	});
});
$.validator.addMethod("validId", function(value) {
	var regId=/(?=.*^[A-Za-z])(?=.*\d)[A-Za-z\d]{4,12}/;
	return regId.test(value);
}, '아이디는 문자,숫자를 사용하여 4~12자리까지 사용가능합니다.');
$.validator.addMethod("email", function(value) {
	var regEmail=/^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	return regEmail.test(value);
}, '이메일 형식이 다릅니다.');
$.validator.addMethod("validPwd", function(value) {
	var regPwd=/^(?=.*^[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/; 
	return regPwd.test(value);
}, '비밀번호는 문자,숫자,특수문자를 사용하여 8~15자리까지 사용가능합니다.');