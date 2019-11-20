$(function(){
	$("#memberUpdate").validate({
		rules:{			
			name:{
				required:true,
				rangelength:[2,4]
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

$.validator.addMethod("email", function(value) {
	var regEmail=/^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	return regEmail.test(value);
}, '이메일 형식이 다릅니다.');