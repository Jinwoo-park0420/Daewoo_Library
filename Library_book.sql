create table bookList(
	bookno number(10) not null primary key,
	bookname nvarchar2(100) not null,
	genre nvarchar2(20) not null,
	writer nvarchar2(50) not null,
	publisher nvarchar2(20) not null,
	status nvarchar2(10) not null,
	isbn number(20) not null
);

select * from bookList order by bookno;
drop table bookList;
delete from booklist where bookno=2;

create sequence seq_bookno;
drop sequence seq_bookno;

-- 인기 도서 10개
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'82년생 김지영 :조남주 장편소설','한국문학','조남주','민음사',0,'9788937473135');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'나미야 잡화점의 기적 :히가시노 게이고 장편소설','일본문학','히가시노 게이고 ;옮긴이: 양윤옥','현대문학',0,'9788972756194');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'언어의 온도 :말과 글에는 나름의 따뜻함과 차가움이 있다','한국문학','이기주','한글터',0,'9791195522125');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'돌이킬 수 없는 약속 :야쿠마루 가쿠 장편소설','일본문학','야쿠마루 가쿠 ;옮긴이: 김성미','Book plaza(북플라자)',0,'9788998274795');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'죽고 싶지만 떡볶이는 먹고 싶어 :백세희 에세이','한국문학','백세희','흔',0,'9791196394509');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'나는 나로 살기로 했다 :냉담한 현실에서 어른살이를 위한 to do list','한국문학','김수현','마음의 숲',0,'9791187119845');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'아몬드 (양장 특별 한정판)','한국문학','손원평','창비',0,'9788936434267');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'추리 천재 엉덩이 탐정 5 - 유적에서 날아온 SOS 사건','어린이','트롤','아이세움',0,'9791162332542');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'채식주의자:한강 연작소설','한국문학','한강','창비',0,'9788936433598');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'당신이 옳다 :정혜신의 적정심리학','심리학','정혜신','해냄',0,'9788965746669');

-- 대출급상승 도서
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'마법천자문 :손오공의 한자 대탐험','어린이','스튜디오시리얼,홍거북','아울북',0,'9788950975739');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'혼자가 혼자에게','산문집','이병률','달',0,'9791158161026');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'개인주의자 선언 :판사 문유석의 일상유감','사회과학','문유석','문학동네',0,'9788954637756');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'104층 나무 집','어린이','앤디 그리피스 (지은이), 테리 덴톤 (그림), 신수진 (옮긴이)','시공주니어',0,'9788952795090');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'여자 둘이 살고 있습니다 :혼자도 결혼도 아닌, 조립식 가족의 탄생','한국문학','김하나,황선우','위즈덤 하우스',0,'9791189709815');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'21세기를 위한 21가지 제언 :더 나은 오늘은 어떻게 가능한가','역사','지은이: 유발 하라리 ;옮긴이: 전병근','김영사',0,'9788934982975');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'사하맨션 :조남주 장편소설','한국문학','조남주','민음사',0,'9788937441257');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'놓지 마 과학!','자연과학','글·그림: 신태훈,나승훈','위즈덤 하우스',0,'9788960863545');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'숨 :테드 창 소설','영미문학','지은이: 테드 창 ;옮긴이: 김상훈','북하우스 퍼블리셔스',0,'9791164050277');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'가면산장 살인사건','일본문학','지은이: 히가시노 게이고 ;옮긴이: 김난주','재인',0,'9788990982575');

-- 신간 도서(2019 검색)
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'여행의 이유 :김영하 산문','한국문학','김영하','문학동네',0,'9788954655972');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'천년의 질문 :조정래 장편소설','한국문학','조정래','해냄',0,'9788965746829');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'직지 :김진명 장편소설','한국문학','김진명','쌤앤파커스',0,'9788965708322');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'아주 작은 습관의 힘 :최고의 변화는 어떻게 만들어지는가','심리학/영미문학','제임스 클리어 지음 ;이한이 옮김','비즈니스북스',0,'9791162540640');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'진이, 지니 :정유정 장편소설','한국문학','정유정','은행나무',0,'9791189982140');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'빛의 과거','한국문학','은희경','문학과지성사 ',0,'9791164131914');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'죽음 :베르나르 베르베르 장편소설','프랑스문학','지은이: 베르나르 베르베르 ;옮긴이: 전미연','열린책들',0,'9788932919676');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'(50대 사건으로 보는) 돈의 역사 =The history of money','경제학','홍춘욱','Rok Media(로크미디어)',0,'9791135422225');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'인어가 잠든 집','일본문학','지은이: 히가시노 게이고 ;옮긴이: 김난주','재인',0,'9788990982773');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'유럽도시기행','지리','지은이: 유시민','아름다운사람들',0,'9788965135586');

-- 추천도서
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'해리포터와 혼혈왕자','영미문학','조앤 K. 롤링 저;최인자 옮김','문학수첩',0,'9788983921994');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'해리포터와 죽음의 성물','영미문학','조앤 K 롤링 지음 ;최인자 옮김','문학수첩',0,'9788983922557');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'해리포터와 불사조 기사단','영미문학','조앤 K. 롤링 저;최인자 옮김','문학수첩',0,'9788983921475');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'해리포터와 불의 잔','영미문학','조앤 K. 롤링 지음;최인자 [공]옮김','문학수첩',0,'9788983920959');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'해리포터와 아즈카반의 죄수','영미문학','조앤 K. 롤링 지음;김혜원 옮김','문학수첩',0,'9788983920737');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'해리포터와 비밀의 방','영미문학','조앤 K. 롤링 지음;김혜원 옮김','문학수첩',0,'9788983920713');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'해리포터와 마법사의 돌','영미문학','조앤 K. 롤링 지음;김혜원 옮김','문학수첩',0,'9788983920690');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'메이즈 러너','영미문학','제임스 대시너 지음 ;공보경 옮김','문학수첩',0,'9788983924469');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'윔피 키드','영미문학','글, 그림: 제프 키니 ;양진성','푸른날개',0,'9788965590262');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'데스 큐어','영미문학','제임스 대시너 지음 ;공보경 옮김','문학수첩',0,'9788983925251');

insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'타라덩컨','프랑스문학','소피 오두인 마미코니안 지음;이원희 옮김','소담출판사',0,'9788973818587');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'헝거게임','영미문학','수잔 콜린스 지음 ;이원열 옮김','미래엔컬처그룹',0,'9788937832611');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'어린이 과학 형사대 CSI','자연과학','글: 고희정 ;그림: 서용남','가나출판사',0,'9788957364390');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'음유시인 비들 이야기','영미문학','조앤 K. 롤링 지음','문학수첩 리틀북',0,'9788959760435');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'모킹제이','영미문학','수잔 콜린스 지음 ;이원열 옮김','미래엔',0,'9788937833229');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'캣칭 파이어','영미문학','수잔 콜린스 지음 ;이원열 옮김','미래엔 컬처그룹',0,'9788937832994');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'퍼시잭슨과 올림포스의 신','영미문학','릭 라이어던 지음 ;이수현 옮김','서울교육',0,'9788983781345');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'창문 넘어 도망친 100세 노인 :요나스 요나손 장편소설','독일문학','지은이: 요나스 요나손 ;옮긴이: 임호경','열린책들 ',0,'9788932916194');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'(제로니모의) 환상모험','이탈리아문학','글: 제로니모 스틸턴 ;이승수','이퍼블릭',0,'9791155092354');
insert into BOOKLIST(bookno, bookname, genre, writer, publisher, status, isbn) 
values(seq_bookno.nextVal,'소년 셜록 홈즈','영미문학','앤드루 레인 글 ;김경희 옮김','랜덤하우스코리아',0,'9788925543222');


