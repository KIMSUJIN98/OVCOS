
DROP TABLE UPLOAD;
DROP TABLE INQUIRY;
DROP TABLE CUT;
DROP TABLE FOLLOW;
DROP TABLE MEMBER;
DROP SEQUENCE SEQ_INQ_NO;


--------------------------------------------------
--------------     MEMBER 관련	-------------------
--------------------------------------------------
CREATE TABLE MEMBER (
	MEM_ID	VARCHAR(100) CONSTRAINT MEM_ID_PK PRIMARY KEY,
	MEM_PWD	VARCHAR2(20)  NOT NULL,
	MEM_NAME VARCHAR2(15) NOT NULL,
	MEM_NICK VARCHAR2(24) NOT NULL,
	MEM_INTRO VARCHAR2(300),
	MEM_BIRTH DATE,
	MEM_ADMIN_NY CHAR(10) DEFAULT '일반' NOT NULL CONSTRAINT MEM_ADMIN_NY_CK CHECK(MEM_ADMIN_NY IN('일반','관리자')),
	MEM_STATUS VARCHAR2(12) DEFAULT '회원' NOT NULL CONSTRAINT MEM_STATUS_CK CHECK(MEM_STATUS IN('회원','탈퇴','휴먼','일시정지','관리자')),
	MEM_LOC_INFO VARCHAR(200),
	MEM_PUBLIC_NY CHAR(1) DEFAULT 'Y' CONSTRAINT MEM_PUBLIC_NY_CK CHECK(MEM_PUBLIC_NY IN('Y','N')),
	MEM_GOAL_DTN NUMBER DEFAULT 0,
	MEM_CODE_NY	VARCHAR2(20),
	MEM_RPR_CUM	NUMBER DEFAULT 0 NOT NULL,
	MEM_API_TYPE VARCHAR2(30) CONSTRAINT MEM_API_TYPE_CK CHECK(MEM_API_TYPE IN('일반','카카오','네이버','구글')),
	MEM_API_TOKEN VARCHAR2(50),
	MEM_EML	VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN MEMBER.MEM_ID IS '회원 아이디';
COMMENT ON COLUMN MEMBER.MEM_PWD IS '회원 비밀번호';
COMMENT ON COLUMN MEMBER.MEM_NAME IS '이름';
COMMENT ON COLUMN MEMBER.MEM_NICK IS '닉네임';
COMMENT ON COLUMN MEMBER.MEM_INTRO IS '자기소개 글';
COMMENT ON COLUMN MEMBER.MEM_BIRTH IS '생년월일';
COMMENT ON COLUMN MEMBER.MEM_ADMIN_NY IS '관리자/회원';
COMMENT ON COLUMN MEMBER.MEM_STATUS IS '회원상태';
COMMENT ON COLUMN MEMBER.MEM_LOC_INFO IS '위치정보';
COMMENT ON COLUMN MEMBER.MEM_PUBLIC_NY IS '마이페이지 공개여부';
COMMENT ON COLUMN MEMBER.MEM_GOAL_DTN IS '목표거리';
COMMENT ON COLUMN MEMBER.MEM_CODE_NY IS '인증코드';
COMMENT ON COLUMN MEMBER.MEM_RPR_CUM IS '누적 신고수';
COMMENT ON COLUMN MEMBER.MEM_API_TYPE IS '소셜종류';
COMMENT ON COLUMN MEMBER.MEM_API_TOKEN IS '토큰 데이터';
COMMENT ON COLUMN MEMBER.MEM_EML IS '이메일';

INSERT INTO MEMBER VALUES('Qdfca12','qwe123','김기현','Kim_ki','우리 같이 열심히 운동해 봐요','19911013',DEFAULT,DEFAULT,NULL,DEFAULT,DEFAULT,NULL,0,'일반', NULL,'Qdfca12@gamil.com');
INSERT INTO MEMBER VALUES('wSDF23','asd214','박창제','parkCH','안녕하세요','19811013',DEFAULT,DEFAULT,NULL,DEFAULT,DEFAULT,NULL,0,'일반', NULL,'wSDF23@gamil.com');
INSERT INTO MEMBER VALUES('cvxzv34','pouih1!','김준식','flag123','안녕하세요','19711213',DEFAULT,'휴먼','서울특별시 광진구',DEFAULT,120,NULL,2,'카카오', 'adsfqwercva','cvxzv34@gamil.com');
INSERT INTO MEMBER VALUES('vdfety1111','jryff3#','존박','jhon','하이요','19970203',DEFAULT,'일시정지','인천 계양구','N',60,'PYJYJYU',3,'네이버', 'AFCETEDF','vdfety1111@gamil.com');
INSERT INTO MEMBER VALUES('user01','pass01','강지희','kangji','같이 노력해봐요','20001013',DEFAULT,'회원','인천 연수구','Y',70,'afewrq',3,'네이버', 'asdfewr','user01@gamil.com');
INSERT INTO MEMBER VALUES('admin','admin','관리자','관리자','관리를 빡세게 하자',NULL,'관리자','관리자',NULL,DEFAULT,DEFAULT,NULL,0,'일반', NULL,'ADMIN@gamil.com');

--------------------------------------------------
--------------     UPLOAD 관련	-------------------
--------------------------------------------------
CREATE TABLE UPLOAD(
    UPL_ID VARCHAR2(20) NOT NULL,
    UPL_STT VARCHAR2(30) NOT NULL CHECK(UPL_STT IN('challenge','profile','background','gpx','contest')),
    UPL_NO NUMBER NOT NULL,
    UPL_TITLE VARCHAR2(60) NOT NULL,
    UPL_VER CHAR(1) DEFAULT 'F' CHECK(UPL_VER IN('F','T')),
    UPL_DEL_NY CHAR(1) DEFAULT 'N' CHECK(UPL_DEL_NY IN('Y','N'))
);

INSERT INTO UPLOAD VALUES('admin','contest',1,'contest1.img','T','N');
INSERT INTO UPLOAD VALUES('Qdfca12','profile',3,'odfcprofile.img','F','N');
INSERT INTO UPLOAD VALUES('wSDF23','gpx',2,'dmz.gpx','T','N');
INSERT INTO UPLOAD VALUES('cvxzv34','challenge',4,'chal4.img','F','N');
INSERT INTO UPLOAD VALUES('vdfety1111','background',2,'back2.img','F','N');

-- UPLOAD COMMENTS
COMMENT ON COLUMN UPLOAD.UPL_ID IS '업로드한 유저 아이디';
COMMENT ON COLUMN UPLOAD.UPL_STT IS '파일 업로드한 게시글 카테고리';
COMMENT ON COLUMN UPLOAD.UPL_NO IS '게시글 번호';
COMMENT ON COLUMN UPLOAD.UPL_TITLE IS '파일 이름';
COMMENT ON COLUMN UPLOAD.UPL_VER IS '검증여부';

--------------------------------------------------
--------------     INQUIRY 관련	-------------------
--------------------------------------------------
CREATE TABLE INQUIRY(
    INQ_NO NUMBER NOT NULL CONSTRAINT INQ_NO_PK PRIMARY KEY,
    INQ_CTG VARCHAR2(30) NOT NULL CONSTRAINT INQ_CTG_CK CHECK(INQ_CTG IN ('피드', '챌린지', '업로드', '기타')),
    INQ_TITLE VARCHAR2(100) NOT NULL,
    INQ_DATE DATE DEFAULT SYSDATE NOT NULL,
    INQ_CNT VARCHAR2(2000) NOT NULL,
    ANS_CNT VARCHAR(3000),
    INQ_DEL_NY CHAR(1) DEFAULT 'N' CHECK(INQ_DEL_NY IN('N','Y')),
    MEM_ID VARCHAR2(20) NOT NULL REFERENCES MEMBER
    
);

COMMENT ON COLUMN INQUIRY.INQ_NO IS '문의번호';
COMMENT ON COLUMN INQUIRY.INQ_CTG IS '카테고리';
COMMENT ON COLUMN INQUIRY.INQ_TITLE IS '문의제목';
COMMENT ON COLUMN INQUIRY.INQ_DATE IS '문의작성일';
COMMENT ON COLUMN INQUIRY.INQ_CNT IS '문의내용';
COMMENT ON COLUMN INQUIRY.INQ_DEL_NY IS '삭제여부';
COMMENT ON COLUMN INQUIRY.ANS_CNT IS '답변내용';

CREATE SEQUENCE SEQ_INQ_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

INSERT INTO INQUIRY VALUES(SEQ_INQ_NO.NEXTVAL,'피드','이 글 너무 불편합니다',SYSDATE,'음란물 관련내용이 있는거 같습니다. 삭제 부탁드립니다', '회원님 불편을 드려 죄송합니다.해당 글 삭제 처리 되었습니다.', 'N','Qdfca12' );
INSERT INTO INQUIRY VALUES(SEQ_INQ_NO.NEXTVAL,'챌린지','이 대회관련 문의',SYSDATE,'이 대회에 관해 알고 싶은데 정보가 부족한거 같아요.', '회원님 안녕하십니까 말씀하신 대회는 해당 대회 클릭 시 홈페이지로 이동합니다 즐거운 운동되십시오.','N','wSDF23');
INSERT INTO INQUIRY VALUES(SEQ_INQ_NO.NEXTVAL,'업로드','업로드 관련 문의드립니다.',SYSDATE,'파일을 올리려는데 추가가 되지 않습니다.수정부탁드립니다.', '회원님 불편을 드려 죄송합니다. 업로드 오류발생으로 인하여 수정중입니다.','N','cvxzv34');
INSERT INTO INQUIRY VALUES(SEQ_INQ_NO.NEXTVAL,'기타','광고 관련문의',SYSDATE,'광고가 너무 많이 나오는거 같아요', '회원님 불편을 드려 죄송합니다. 제휴회사와 논의하도록 하겠습니다','N','vdfety1111');
INSERT INTO INQUIRY VALUES(SEQ_INQ_NO.NEXTVAL,'피드','광고 문의',SYSDATE,'이 광고를 올리고 싶습니다 관리자와 통화 할 수 있을까요?', '광고를 하지 않습니다.죄송합니다.','N','vdfety1111');

--------------------------------------------------
--------------     CUT 관련	-------------------
--------------------------------------------------
CREATE TABLE CUT(
    MEM_ID VARCHAR2(20) NOT NULL CONSTRAINT MEM_ID_FK REFERENCES MEMBER,
    CUT_ID VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN CUT.MEM_ID IS '유저 아이디';
COMMENT ON COLUMN CUT.CUT_ID IS '차단 아이디';

INSERT INTO CUT VALUES('Qdfca12','wSDF23');
INSERT INTO CUT VALUES('Qdfca12','cvxzv34');
INSERT INTO CUT VALUES('Qdfca12','vdfety1111');
INSERT INTO CUT VALUES('vdfety1111','Qdfca12');
INSERT INTO CUT VALUES('vdfety1111','cvxzv34');

--------------------------------------------------
--------------     FOLLOW 관련	-------------------
--------------------------------------------------
CREATE TABLE FOLLOW(
    MEM_ID VARCHAR2(20) REFERENCES MEMBER,
    FLW_ID VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN FOLLOW.MEM_ID IS '유저 아이디';
COMMENT ON COLUMN FOLLOW.FLW_ID IS '팔로우 아이디';

INSERT INTO FOLLOW VALUES('vdfety1111','wSDF23');
INSERT INTO FOLLOW VALUES('wSDF23','cvxzv34');
INSERT INTO FOLLOW VALUES('user01','wSDF23');
INSERT INTO FOLLOW VALUES('user01','Qdfca12');
INSERT INTO FOLLOW VALUES('user01','vdfety1111');


