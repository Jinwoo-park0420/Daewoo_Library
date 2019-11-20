$(function(){
	$("#applyForm").validate({
		rules:{			
			bookname:{
				required:true,
				rangelength:[1,30]
			},
			writer:{
				required:true,
				rangelength:[1,30]				
			},
			publisher:{
				required:true,
				rangelength:[1,30]		
			},
			price:{
				required:true,
				rangelength:[1,15]
			},
			genre:{
				required:true,
				rangelength:[1,15]			
			
			},
			isbn:{
				required:true,
				rangelength:[13,13]	
			},
			
		},
		messages:{
			bookname:{
				required : "책이름은 필수 입력 요소입니다.",
				rangelength : "책이름을 확인해 주세요."
			},
			writer:{
				required:"작가이름은 필수 입력 요소입니다.",
				rangelength:"작가이름을 확인해 주세요"				
			},
			publisher:{
				required: "출판사이름은 필수 요소입니다.",	
				rangelength : "출판사이름을 확인해 주세요."
			},
			price:{
				required: "가격은 필수 요소입니다. 숫자로 입력해주세요",	
				rangelength : "가격을 확인해 주세요."
			},
			
			genre:{
				required : "장르는 필수입니다.",	
					rangelength : "장르를 확인해 주세요."
			},
			isbn:{
				required: "ISBN은 필수 입력 요소입니다.",
				rangelength : "ISBN을 확인해 주세요."
						
			}
		},		
		errorPlacement:function(error,element){
			$(element).closest("form").find("small[id='"+element.attr("id")+"']").append(error);			
		}
	});
});
