
$(function(){
	$("#chPwd").validate({
		rules:{			
			new_password:{
				required:true,
				validPwd : true,
				rangelength:[6,15]
			},
			confirm_password:{
				required:true,
				validPwd : true,				
				equalTo: "#new_password"
			}			
		},
		messages:{			
			new_password:{
				required:"새로운 비밀번호를 입력해 주세요.",				
			},
			confirm_password:{
				required : "필수 입력 요소입니다.",
				equalTo : "이전 비밀번호와 동일하게 입력해주세요"
			}
		},
		errorPlacement:function(error,element){
			$(element).closest("form").find("small[id='"+element.attr("id")+"']").append(error);
		}
	});
});
$.validator.addMethod("validPwd", function(value) {
	var regPwd=/^(?=.*^[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/; 
	return regPwd.test(value);
}, '비밀번호는 문자,숫자,특수문자를 사용하여 8~15자리까지 사용가능합니다.');








