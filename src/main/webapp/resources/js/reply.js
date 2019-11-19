/**
 *  댓글과 관련된 스크립트
 *  
 *  자바스크립트 모듈화 : 클로저 패턴
 */
var replyService=(function(){//private 개념
	function add(reply,callback){ //js의 중괄호 안에 있는 것을 한꺼번에 가져옴 , 자동호출되는 함수 callback
		console.log("add 호출");
		
		$.ajax({
			type:'post',
			url:'/replies/new',
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(reply),
			success:function(result){
				//console.log(result);
				if(callback){
					callback(result);
				}
			}
		})
	}//add 끝나는 부분
	
	function getList(param,callback){
		var bno=param.bno;
		var page=param.page||1;
		
		//$.ajax({})이렇게 해도 됨
		$.getJSON({ // $.ajax({}) => 가져올 데이터 타입에 대한 지정이 필요한 상태
			url:'/replies/pages/'+bno+'/'+page,
			success:function(data){
				if(callback){
					callback(data.replyCnt,data.list);
				}
			}
		})
	} //getList end
	
	function del(rno,callback){
		$.ajax({
			url:'/replies/'+rno,
			type:'delete',
			success:function(result){
				if(callback){
					callback(result);
				}
			}
		})
	} //remove 종료
	
	function update(param,callback){
		var rno=param.rno;
		var reply=param.reply;
		
		$.ajax({
			url:'/replies/'+rno,
			type:'put',
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(param),
			success:function(result){
				if(callback)
					callback(result);
			}
		})
	}//update 종료
	
	
	function get(rno,callback){ //약식 처리
		$.getJSON("/replies/"+rno,function(result){ //success 면 result로 들어옴
			if(callback){
				callback(result);
			}
		})
	}
	
	function displayTime(timeValue){
		//timeValue=1590121354
		var today=new Date();
		
		var gap=today.getTime() - timeValue;
		
		var dateObj=new Date(timeValue);
		
		var str="";
		
		//오늘날짜와 비교해서 댓글 등록일자가 오늘과 같은 날짜 상태라면 시분초로 나타내고
		//오늘날짜에 작성한 댓글이 아니라면 년/월/일 로 나타내기
		if(gap<(1000*60*60*24)){ 
			var hh=dateObj.getHours();
			var mi=dateObj.getMinutes();
			var ss=dateObj.getSeconds();
			
			return [ (hh>9?'':'0')+hh, ':', (mi>9?'':'0')+mi, ':', (ss>9?'':'0')+ss].join('');
		}else{
			var yy=dateObj.getFullYear();
			var mm=dateObj.getMonth()+1; //0~11
			var dd=dateObj.getDate();
			
			return[ yy,'/',(mm>9?'':'0')+mm,'/',(dd>9?'':'0')+dd].join('');
		}
		
	}
	
	return{
		add:add,
		getList:getList,
		del:del,
		update:update,
		get:get,
		displayTime:displayTime
		};
})(); //익명함수