
/* 옵션테이블 */
DROP TABLE OPTIONS 
   CASCADE CONSTRAINTS;

/* 사진테이블 */
DROP TABLE PICTURE 
   CASCADE CONSTRAINTS;

DROP TABLE CART 
   CASCADE CONSTRAINTS;

/* 제품리뷰 */
DROP TABLE REVIEW 
   CASCADE CONSTRAINTS;

/* 이벤트 */
DROP TABLE EVENT 
   CASCADE CONSTRAINTS;

/* 커뮤니티 */
DROP TABLE COMMUNITY 
   CASCADE CONSTRAINTS;

/* 결제 */
DROP TABLE PAY 
   CASCADE CONSTRAINTS;

/* 자주묻는질문 */
DROP TABLE FNQ 
   CASCADE CONSTRAINTS;

/* 공지사항 */
DROP TABLE NOBOARD 
   CASCADE CONSTRAINTS;

/* 1:1문의 */
DROP TABLE EMAIL 
   CASCADE CONSTRAINTS;

/* 커뮤니티 리플 */
DROP TABLE commureply 
   CASCADE CONSTRAINTS;

/* 상품테이블 */
CREATE TABLE PRODUCT (
   GOODS_CODE NUMBER NOT NULL, /* 상품코드 */
   GOODS_NAME VARCHAR2(1000) NOT NULL, /* 상품이름 */
   GOODS_PRICE NUMBER, /* 상품가격 */
   GOODS_GROUP1 VARCHAR2(100), /* 카테고리1 */
   GOODS_GROUP2 VARCHAR2(100), /* 카테고리2 */
   GOODS_CONTENT VARCHAR2(4000), /* 상품내용 */
   TOTAL_COUNT NUMBER, /* 총수량 */
   Sel_Count NUMBER DEFAULT 0 /* 판매개수 */
);
drop table product
select * from product

CREATE UNIQUE INDEX PK_PRODUCT
   ON PRODUCT (
      GOODS_CODE ASC
   );

ALTER TABLE PRODUCT
   ADD
      CONSTRAINT PK_PRODUCT
      PRIMARY KEY (
         GOODS_CODE
      );

/* 회원테이블 */
CREATE TABLE MEMBERS (
   ID VARCHAR2(20) NOT NULL, /* 아이디 */
   PASSWORD VARCHAR2(30), /* 비밀번호 */
   NAME VARCHAR2(30) NOT NULL, /* 이름 */
   DATE_OF_BIRTH VARCHAR2(30), /* 생년월일 */
   NICKNAME VARCHAR2(20), /* 닉네임 */
   GENDER VARCHAR2(10), /* 성별 */
   EMAIL VARCHAR2(50), /* 이메일 */
   PHONE VARCHAR2(30), /* 핸드폰번호 */
   POINT NUMBER DEFAULT 0, /* 포인트 */
   MEM_GRADE VARCHAR2(30) DEFAULT 'Bronze', /* 회원등급 */
   JOIN_DATE DATE, /* 가입날짜 */
   ZIPCODE VARCHAR2(10), /* 우편번호 */
   ADDR1 VARCHAR2(100), /* 주소1 */
   ADDR2 VARCHAR2(100), /* 주소2 */
   MEM_GROUP VARCHAR2(30), /* Api로그인 */
   BUY_PRICE NUMBER DEFAULT 0 /* 전체구매금액 */
);
drop table members
CREATE UNIQUE INDEX PK_MEMBERS
   ON MEMBERS (
      ID ASC
   );

ALTER TABLE MEMBERS
   ADD
      CONSTRAINT PK_MEMBERS
      PRIMARY KEY (
         ID
      );

/* 옵션테이블 */
CREATE TABLE OPTIONS (
   GOODS_CODE NUMBER, /* 상품코드 */
   GOODS_COLOR VARCHAR2(1000), /* 상품컬러 */
   GOODS_COUNT NUMBER, /* 상품수량 */
   GOODS_CODE2 NUMBER, /* 상품코드2 */
   GOODS_COLOR_IMG VARCHAR2(1000), /* 상품이미지 */
   Opt_Sel_Count NUMBER DEFAULT 0 /* 판매수량 */
);

/*옵션테이블 code2에 대한 sequence*/
CREATE SEQUENCE code2_seq
START WITH 1
INCREMENT BY 1
NOCYCLE
CACHE 24

/* 사진테이블 */
CREATE TABLE PICTURE (
   GOODS_CODE NUMBER NOT NULL, /* 상품코드 */
   GOODS_NAME VARCHAR2(1000) NOT NULL, /* 상품이름 */
   GOODS_MAIN VARCHAR2(1000), /* 메인사진 */
   GOODS_DETAIL VARCHAR2(1000) /* 상세설명 */
);

CREATE UNIQUE INDEX PK_PICTURE
   ON PICTURE (
      GOODS_CODE ASC
   );

ALTER TABLE PICTURE
   ADD
      CONSTRAINT PK_PICTURE
      PRIMARY KEY (
         GOODS_CODE
      );

/* 장바구니 */
CREATE TABLE CART (
   CART_NUM NUMBER NOT NULL, /* 바구니번호 */
   GOODS_CODE NUMBER NOT NULL, /* 상품코드 */
   GOODS_CODE2 NUMBER, /* 옵션코드 */
   GOODS_NAME VARCHAR2(50) NOT NULL, /* 상품이름 */
   ID VARCHAR2(20) NOT NULL, /* 아이디 */
   PROD_COUNT NUMBER, /* 제품수량 */
   GOODS_PRICE NUMBER /* 가격 */
);

/*장바구니 cart_num에 대한 시퀀스*/
CREATE SEQUENCE cart_seq
START WITH 1
INCREMENT BY 1
NOCYCLE
CACHE 24

CREATE UNIQUE INDEX PK_CART
   ON CART (
      CART_NUM ASC
   );

ALTER TABLE CART
   ADD
      CONSTRAINT PK_CART
      PRIMARY KEY (
         CART_NUM
      );

/* 제품리뷰 */
CREATE TABLE REVIEW (
   REVIEW_NUM NUMBER NOT NULL, /* 글번호 */
   GOODS_CODE NUMBER NOT NULL, /* 상품코드 */
   ID VARCHAR2(20) NOT NULL, /* 아이디 */
   NICKNAME VARCHAR2(20) NOT NULL, /* 닉네임 */
   CHK DATE, /* 날짜 */
   REVIEW_CONTENT VARCHAR2(500), /* 내용 */
   RATE NUMBER, /* 평가 */
   GOODS_OPTION VARCHAR2(50) NOT NULL, /* 상품옵션 */
   SUB VARCHAR2(50) /* 제목 */
);

/*리뷰테이블의 review_num에 대한 시퀀스*/
create sequence review_seq 
start with 1
increment by 1
nocache
nocycle;
drop sequence review_seq
CREATE UNIQUE INDEX PK_REVIEW
   ON REVIEW (
      REVIEW_NUM ASC
   );

ALTER TABLE REVIEW
   ADD
      CONSTRAINT PK_REVIEW
      PRIMARY KEY (
         REVIEW_NUM
      );
/*이벤트보드*/
CREATE TABLE EVENTBOARD(
Event_Num number,
Event_Name varchar2(100),
Event_Mainpic varchar2(1000),
Event_Content varchar2(500),
Event_Date date
);

/*이벤트넘에 대한 시퀀스*/
create sequence Event_Num_seq
start with 1
increment by 1
nocache
nocycle;
      
/* 이벤트 */
CREATE TABLE EVENT (
   EVENT_NUM NUMBER NOT NULL, /* 이벤트번호 */
   EVENT_NAME VARCHAR2(100) NOT NULL, /* 제목 */
   EVENT_MAINPIC VARCHAR2(1000) NOT NULL, /* 메인&썸네일 */
   EVENT_CONTENT VARCHAR2(500), /* 내용 */
   EVENT_DATE DATE /* 등록날짜 */
);

/*이벤트테이블 eventnum에 대한 시퀀스*/
create sequence Event_Num_seq
start with 1
increment by 1
nocache
nocycle;
drop sequence Event_Num_seq
CREATE UNIQUE INDEX PK_EVENT
   ON EVENT (
      EVENT_NUM ASC
   );

ALTER TABLE EVENT
   ADD
      CONSTRAINT PK_EVENT
      PRIMARY KEY (
         EVENT_NUM
      );

/* 커뮤니티 */
CREATE TABLE COMMUNITY (
   commuNum NUMBER NOT NULL, /* 글번호 */
   nickname VARCHAR2(20), /* 닉네임 */
   id VARCHAR2(20), /* 아이디 */
   email VARCHAR2(50), /* 이메일 */
   subject VARCHAR2(100), /* 제목 */
   regdate DATE, /* 등록날짜 */
   category VARCHAR2(100), /*카테고리*/
   readcount NUMBER DEFAULT 0, /* 조회수 */
   content VARCHAR2(500), /* 내용 */
   Upload VARCHAR2(100) /* 첨부파일 */
);
select * from members
drop sequence commu_rno_seq


select * from COMMUNITY
/*커뮤니티테이블의 comu_num에 대한 시퀀스*/
CREATE sequence commu_rno_seq
start with 1
increment by 1
nocache
nocycle;

CREATE UNIQUE INDEX PK_COMMUNITY
   ON COMMUNITY (
      COMU_NUM ASC
   );

ALTER TABLE COMMUNITY
   ADD
      CONSTRAINT PK_COMMUNITY
      PRIMARY KEY (
         COMU_NUM
      );

/* 결제 */
CREATE TABLE PAY (
   PAY_NUM NUMBER NOT NULL, /* 결제코드 */
   PROD_NAME VARCHAR2(1000) NOT NULL, /* 상품이름 */
   GOODS_CODE NUMBER NOT NULL, /* 상품코드 */
   GOODS_CODE2 NUMBER, /* 상품코드2 */
   GOODS_COLOR VARCHAR2(100) DEFAULT NULL, /* 옵션이름 */
   PAY_COUNT NUMBER NOT NULL, /* 주문상품수량 */
   GOODS_PRICE NUMBER NOT NULL, /* 개당가격 */
   TOTAL_PRICE NUMBER NOT NULL, /* 결제된 가격 */
   ID VARCHAR2(20), /* 주문자 아이디 */
   REC_NAME VARCHAR2(100) NOT NULL, /* 수령자 이름 */
   REC_PHONE VARCHAR2(100) NOT NULL, /* 수령자 연락처 */
   ZIPCODE VARCHAR2(10) NOT NULL, /* 우편번호 */
   ADDR1 VARCHAR2(100) NOT NULL, /* 주소1 */
   ADDR2 VARCHAR2(100) NOT NULL, /* 주소2 */
   DEL_SUB VARCHAR2(1000), /* 배송요청사항 */
   PAY_DATE DATE DEFAULT sysdate, /* 결제날짜 */
   PAY_STATE VARCHAR2(100) DEFAULT '결제완료' /* 주문상태 */
);
select * from pay
alter table pay add order_name VARCHAR2(200)
CREATE UNIQUE INDEX PAY
   ON PAY (
      PAY_NUM ASC
   );

ALTER TABLE PAY
   ADD
      CONSTRAINT PAY
      PRIMARY KEY (
         PAY_NUM
      );

/* 자주묻는질문 */
CREATE TABLE FNQ (
   FNQNUM NUMBER NOT NULL, /* 글번호 */
   FNQCATE VARCHAR2(50), /* 카테고리 */
   fnqQuest VARCHAR2(100), /* 질문 */
   FNQCONTENT VARCHAR2(300) /* 답변내용 */
);

/*fnq테이블에 fnqNum에 대한 시퀀스*/
create sequence fnq_seq 
start with 1 
increment by 1
nocache
nocycle;

CREATE UNIQUE INDEX PK_FNQ
   ON FNQ (
      FNQ_NUM ASC
   );

ALTER TABLE FNQ
   ADD
      CONSTRAINT PK_FNQ
      PRIMARY KEY (
         FNQ_NUM
      );

/* 공지사항 */
CREATE TABLE NOBOARD (
   NONUM NUMBER NOT NULL, /* 글번호 */
   NOCATE VARCHAR2(50), /* 카테고리 */
   NOTITLE VARCHAR2(100), /* 제목 */
   NOCONTENT VARCHAR2(1000), /* 내용 */
   REG_DATE DATE, /* 등록날짜 */
   READCOUNT NUMBER /* 조회수 */
);

/*공지사항테이블의 nonum에 대한 시퀀스*/
create sequence nobo_seq 
start with 1 
increment by 1
nocache
nocycle;

CREATE UNIQUE INDEX PK_NOBOARD
   ON NOBOARD (
      NONUM ASC
   );

ALTER TABLE NOBOARD
   ADD
      CONSTRAINT PK_NOBOARD
      PRIMARY KEY (
         NONUM
      );

/* 1:1문의 */
CREATE TABLE EMAIL (
   E_NUM NUMBER NOT NULL, /* 글번호 */
   ID VARCHAR2(20), /* 아이디 */
   E_MAIL VARCHAR2(50), /* 메일주소 */
   E_TITLE VARCHAR2(100), /* 제목 */
   E_CONTENT VARCHAR2(1000), /* 내용 */
   E_DATE DATE /* 등록날짜 */
);

/*이메일테이블에 e_num에 대한 시퀀스*/
create sequence email_seq 
start with 1 
increment by 1
nocache
nocycle;

CREATE UNIQUE INDEX PK_EMAIL
   ON EMAIL (
      E_NUM ASC
   );

ALTER TABLE EMAIL
   ADD
      CONSTRAINT PK_EMAIL
      PRIMARY KEY (
         E_NUM
      );

/* 커뮤니티 리플 */
CREATE TABLE commureply (
   replyNum NUMBER NOT NULL, /* 리플번호 */
   COMMUNUM NUMBER, /* 글번호 */
   reply VARCHAR2(700), /* 리플 */
   replyWriter VARCHAR2(100), /* 리플작성자 */
   reRegdate DATE /* 등록날짜 */
);

drop sequence reply_reno_seq
/*커뮤니티리플테이블에  replyNum에 대한 시퀀스*/
create sequence reply_reno_seq
start with 1
increment by 1
nocache
nocycle;

CREATE UNIQUE INDEX PK_commureply
   ON commureply (
      replyNum ASC
   );

ALTER TABLE commureply
   ADD
      CONSTRAINT PK_commureply
      PRIMARY KEY (
         replyNum
      );

ALTER TABLE OPTIONS
   ADD
      CONSTRAINT FK_PRODUCT_TO_OPTIONS
      FOREIGN KEY (
         GOODS_CODE
      )
      REFERENCES PRODUCT (
         GOODS_CODE
      );

ALTER TABLE PICTURE
   ADD
      CONSTRAINT FK_PRODUCT_TO_PICTURE2
      FOREIGN KEY (
         GOODS_CODE
      )
      REFERENCES PRODUCT (
         GOODS_CODE
      );

ALTER TABLE CART
   ADD
      CONSTRAINT FK_MEMBERS_TO_CART
      FOREIGN KEY (
         ID
      )
      REFERENCES MEMBERS (
         ID
      );

ALTER TABLE CART
   ADD
      CONSTRAINT FK_PRODUCT_TO_CART2
      FOREIGN KEY (
         GOODS_CODE
      )
      REFERENCES PRODUCT (
         GOODS_CODE
      );

ALTER TABLE REVIEW
   ADD
      CONSTRAINT FK_PRODUCT_TO_REVIEW
      FOREIGN KEY (
         GOODS_CODE
      )
      REFERENCES PRODUCT (
         GOODS_CODE
      );

ALTER TABLE REVIEW
   ADD
      CONSTRAINT FK_MEMBERS_TO_REVIEW
      FOREIGN KEY (
         ID
      )
      REFERENCES MEMBERS (
         ID
      );

ALTER TABLE EVENT
   ADD
      CONSTRAINT FK_MEMBERS_TO_EVENT
      FOREIGN KEY (
         ID
      )
      REFERENCES MEMBERS (
         ID
      );

ALTER TABLE COMMUNITY
   ADD
      CONSTRAINT FK_MEMBERS_TO_COMMUNITY
      FOREIGN KEY (
         ID
      )
      REFERENCES MEMBERS (
         ID
      );

ALTER TABLE PAY
   ADD
      CONSTRAINT FK_PRODUCT_TO_PAY
      FOREIGN KEY (
         GOODS_CODE
      )
      REFERENCES PRODUCT (
         GOODS_CODE
      );

ALTER TABLE PAY
   ADD
      CONSTRAINT FK_MEMBERS_TO_PAY
      FOREIGN KEY (
         ID
      )
      REFERENCES MEMBERS (
         ID
      );


ALTER TABLE EMAIL
   ADD
      CONSTRAINT FK_MEMBERS_TO_EMAIL
      FOREIGN KEY (
         ID
      )
      REFERENCES MEMBERS (
         ID
      );

ALTER TABLE commureply
   ADD
      CONSTRAINT FK_COMMUNITY_TO_commureply
      FOREIGN KEY (
         COMMUNUM
      )
      REFERENCES COMMUNITY (
         COMMUNUM
      );
      
      
CREATE TABLE EVENTBOARD(
Event_Num number,
Event_Name varchar2(100),
Event_Mainpic varchar2(1000),
Event_Content varchar2(500),
Start_Date varchar2(20),
End_Date varchar2(20)
);

select * from eventboard;
drop table eventBoard;