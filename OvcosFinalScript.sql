-- CREATE USER OVCOS IDENTIFIED BY OVCOS;
-- GRANT CONNECT, RESOURCE TO OVCOS;

-- 서버 계정 권한 부여하기
-- CREATE USER OVCOS1 IDENTIFIED BY OVCOS1;
-- GRANT CONNECT, RESOURCE TO OVCOS1;

-- 기존의 데이터를 삭제하기 위한 DROP문 (CHALLENGE 테이블 >> CONTEST_CHALLENGE 테이블로 변경됨)
-- DROP TABLE CHALLENGE;
-- DROP TABLE CONTEST;
-- DROP TABLE MEMBER;

----------------------------------------------
---------------- DROP TABLE  -----------------
----------------------------------------------
DROP TABLE FOLLOW_REQUEST;
DROP TABLE FEED_COMMENTS;
DROP TABLE GPX_FILES;
DROP TABLE INQUIRY;
DROP TABLE BOOKMARK;
DROP TABLE UPLOAD;
DROP TABLE CMN_HISTORY;
DROP TABLE GENERAL_HISTORY;
DROP TABLE BK_HISTORY;
DROP TABLE WITHDRAWAL;
DROP TABLE NOTICE;
DROP TABLE FEED;
DROP TABLE CUT;
DROP TABLE FOLLOW;
DROP TABLE ENTRY_LIST; -- 자식테이블 먼저 삭제
DROP TABLE NENTRY_LIST;
DROP TABLE CHLG_COMMENTS;
DROP TABLE NCHLG_COMMENTS;
DROP TABLE CONTEST_CHALLENGE;
DROP TABLE CONTEST;
DROP TABLE NORMAL_CHALLENGE;
DROP TABLE LOCAL;
DROP TABLE MEMBER;


----------------------------------------------
---------------- DROP SEQUENCE ---------------
----------------------------------------------
DROP SEQUENCE SEQ_CNTS_NO;
DROP SEQUENCE SEQ_CHLG_NO;
DROP SEQUENCE SEQ_NCHLG_NO;
DROP SEQUENCE SEQ_CHLG_CMN_NO;
DROP SEQUENCE SEQ_NCHLG_CMN_NO;
DROP SEQUENCE SEQ_NTC_NO;
DROP SEQUENCE SEQ_INQ_NO;
DROP SEQUENCE SEQ_FEED_INDEX;
DROP SEQUENCE SEQ_FEED_CMN_NO;
DROP SEQUENCE SEQ_CMN_HIST_NO;
DROP SEQUENCE SEQ_GEN_HIST_NO;
DROP SEQUENCE SEQ_GPX_FILES;


--------------------------------------------------
--------------     MEMBER 관련	------------------
--------------------------------------------------
CREATE TABLE MEMBER (
	MEM_ID	VARCHAR2(20) CONSTRAINT MEM_ID_PK PRIMARY KEY,
	MEM_PWD	VARCHAR2(20)  NOT NULL,
	MEM_NAME VARCHAR2(15) NOT NULL,
	MEM_NICK VARCHAR2(24) NOT NULL,
	MEM_INTRO VARCHAR2(300),
	MEM_BIRTH VARCHAR2(10),
	MEM_STATUS NUMBER DEFAULT 1 NOT NULL CONSTRAINT MEM_STATUS_CK CHECK(MEM_STATUS IN(1,2,3,4,5)), -- 회원1/정지2/휴면3/탈퇴4/관리자5
	MEM_LOC_INFO VARCHAR(200),
	MEM_PUBLIC_NY CHAR(1) DEFAULT 'Y' CONSTRAINT MEM_PUBLIC_NY_CK CHECK(MEM_PUBLIC_NY IN('Y','N')),
	MEM_GOAL_DTN NUMBER DEFAULT 0,
	MEM_CODE_NY	VARCHAR2(20),
	MEM_RPR_CUM	NUMBER DEFAULT 0 NOT NULL,
	MEM_API_TYPE NUMBER CONSTRAINT MEM_API_TYPE_CK CHECK(MEM_API_TYPE IN(1,2,3,4)), -- 일반1/카카오2/네이버3/구글4
	MEM_API_TOKEN VARCHAR2(50),
	MEM_EML	VARCHAR2(100) NOT NULL,
    MARKET_NY CHAR(1) DEFAULT 'Y' NOT NULL CONSTRAINT MARKET_NY_CK CHECK(MARKET_NY IN('Y','N')) -- 마케팅 정보공유 동의 여부
);

COMMENT ON COLUMN MEMBER.MEM_ID IS '회원 아이디';
COMMENT ON COLUMN MEMBER.MEM_PWD IS '회원 비밀번호';
COMMENT ON COLUMN MEMBER.MEM_NAME IS '이름';
COMMENT ON COLUMN MEMBER.MEM_NICK IS '닉네임';
COMMENT ON COLUMN MEMBER.MEM_INTRO IS '자기소개 글';
COMMENT ON COLUMN MEMBER.MEM_BIRTH IS '생년월일';
COMMENT ON COLUMN MEMBER.MEM_STATUS IS '회원상태';
COMMENT ON COLUMN MEMBER.MEM_LOC_INFO IS '위치정보';
COMMENT ON COLUMN MEMBER.MEM_PUBLIC_NY IS '마이페이지 공개여부';
COMMENT ON COLUMN MEMBER.MEM_GOAL_DTN IS '목표거리';
COMMENT ON COLUMN MEMBER.MEM_CODE_NY IS '인증코드';
COMMENT ON COLUMN MEMBER.MEM_RPR_CUM IS '누적 신고수';
COMMENT ON COLUMN MEMBER.MEM_API_TYPE IS '소셜종류';
COMMENT ON COLUMN MEMBER.MEM_API_TOKEN IS '토큰 데이터';
COMMENT ON COLUMN MEMBER.MEM_EML IS '이메일';
COMMENT ON COLUMN MEMBER.MARKET_NY IS '개인정보활용동의';

INSERT INTO MEMBER VALUES('Qdfca12','qwe123','김기현','Kim_ki','우리 같이 열심히 운동해 봐요','19911013',DEFAULT,NULL,DEFAULT,DEFAULT,NULL,0,1, NULL,'Qdfca12@gamil.com','N');
INSERT INTO MEMBER VALUES('wSDF23','asd214','박창제','parkCH','안녕하세요','19811013',DEFAULT,NULL,DEFAULT,DEFAULT,NULL,0,1, NULL,'wSDF23@gamil.com','N');
INSERT INTO MEMBER VALUES('cvxzv34','pouih1!','김준식','flag123','안녕하세요','19711213',3,'서울특별시 광진구',DEFAULT,120,NULL,2,2, 'adsfqwercva','cvxzv34@gamil.com','Y');
INSERT INTO MEMBER VALUES('vdfety1111','jryff3#','존박','jhon','하이요','19970203',2,'인천 계양구','N',60,'PYJYJYU',3,3, 'AFCETEDF','vdfety1111@gamil.com','N');
INSERT INTO MEMBER VALUES('user01','pass01','강지희','kangji','같이 노력해봐요','20001013',1,'인천 연수구','Y',70,'afewrq',3,3, 'asdfewr','user01@gamil.com','N');
INSERT INTO MEMBER VALUES('admin','admin','관리자','관리자','관리를 빡세게 하자',NULL,5,NULL,DEFAULT,DEFAULT,NULL,0,1, NULL,'ADMIN@gamil.com','Y');


----------------------------------------------
----------------- CONTEST 관련 ----------------
----------------------------------------------
CREATE TABLE CONTEST (
    CNTS_NO NUMBER CONSTRAINT CNTS_NO_PK PRIMARY KEY,
    CNTS_NAME VARCHAR2(60) NOT NULL,
    CNTS_DATE DATE NOT NULL,
    CNTS_URL VARCHAR2(100) NOT NULL,
    DEL_STATUS CHAR(1) DEFAULT 'N' NOT NULL CONSTRAINT DEL_STATUS_CK CHECK(DEL_STATUS IN('Y','N'))
);

-- CONTEST SEQUENCE
CREATE SEQUENCE SEQ_CNTS_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

INSERT INTO CONTEST VALUES(SEQ_CNTS_NO.NEXTVAL,'신춘마라톤대회',TO_DATE('202212311400','YYYYMMDDHH24MI'),'http://irunman.kr/sub1_1.php?uid=79',DEFAULT);
INSERT INTO CONTEST VALUES(SEQ_CNTS_NO.NEXTVAL,'코리아오픈레이스',TO_DATE('202303180800','YYYYMMDDHH24MI'),'http://www.koreaopenrace.com/dorun/',DEFAULT);
INSERT INTO CONTEST VALUES(SEQ_CNTS_NO.NEXTVAL,'서울마라톤',TO_DATE('202303190800','YYYYMMDDHH24MI'),'https://seoul-marathon.com/',DEFAULT);
INSERT INTO CONTEST VALUES(SEQ_CNTS_NO.NEXTVAL,'서울신문하프마라톤',TO_DATE('202305200820','YYYYMMDDHH24MI'),'https://marathon.seoul.co.kr/',DEFAULT);
INSERT INTO CONTEST VALUES(SEQ_CNTS_NO.NEXTVAL,'JTBC마라톤',TO_DATE('202311050900','YYYYMMDDHH24MI'),'https://marathon.jtbc.com/',DEFAULT); --시간이 안나온 경우는..?

-- CONTEST COMMENT
COMMENT ON COLUMN CONTEST.CNTS_NO IS '대회번호';
COMMENT ON COLUMN CONTEST.CNTS_NAME IS '대회명';
COMMENT ON COLUMN CONTEST.CNTS_DATE IS '대회날짜';
COMMENT ON COLUMN CONTEST.CNTS_URL IS '대회사이트주소';
COMMENT ON COLUMN CONTEST.DEL_STATUS IS '삭제여부';


--------------------------------------------------
--------------     UPLOAD 관련	------------------
--------------------------------------------------
CREATE TABLE UPLOAD(
    UPL_ID VARCHAR2(20) NOT NULL,
    UPL_MENU NUMBER NOT NULL CHECK(UPL_MENU IN(1,2,3,4)), -- 대회1/챌린지2/프로필3/배경이미지4
    UPL_NO NUMBER NULL,
    ORIGIN_NAME VARCHAR2(60) NOT NULL,
    CHANGE_NAME VARCHAR2(60) NOT NULL,
    VER_STATUS CHAR(1) DEFAULT 'N' CHECK(VER_STATUS IN('Y','N')),
    DEL_STATUS CHAR(1) DEFAULT 'N' CHECK(DEL_STATUS IN('Y','N'))
);

--INSERT INTO UPLOAD VALUES('admin',1,1,'contest1.img','20221225081523-c_15684.png','Y','N');
--INSERT INTO UPLOAD VALUES('Qdfca12',3,3,'odfcprofile.img','20230125155854-m_54320.png','N','N');
--INSERT INTO UPLOAD VALUES('wSDF23',3,2,'dmz.gpx','20230218234856-m_03598.jpg','Y','N');
--INSERT INTO UPLOAD VALUES('cvxzv34',2,4,'chal4.img','20230227142832-c_23548.png','N','N');
--INSERT INTO UPLOAD VALUES('vdfety1111',4,2,'back2.img','20230317172554-mk_55489.jpg','N','N');

-- UPLOAD COMMENTS
COMMENT ON COLUMN UPLOAD.UPL_ID IS '업로드한 유저 아이디';
COMMENT ON COLUMN UPLOAD.UPL_MENU IS '카테고리 분류';
COMMENT ON COLUMN UPLOAD.UPL_NO IS '게시글 번호';
COMMENT ON COLUMN UPLOAD.ORIGIN_NAME IS '원본 파일명';
COMMENT ON COLUMN UPLOAD.CHANGE_NAME IS '수정 파일명';
COMMENT ON COLUMN UPLOAD.VER_STATUS IS '검증여부';
COMMENT ON COLUMN UPLOAD.DEL_STATUS IS '삭제여부';


--------------------------------------------------
--------------     INQUIRY 관련	------------------
--------------------------------------------------
CREATE TABLE INQUIRY(
    INQ_NO NUMBER NOT NULL CONSTRAINT INQ_NO_PK PRIMARY KEY,
    INQ_MENU NUMBER NOT NULL CONSTRAINT INQ_MENU_CK CHECK(INQ_MENU IN (1,2,3,4,5)), -- 피드1/탐색2/챌린지3/마이페이지4/기타5
    INQ_TITLE VARCHAR2(100) NOT NULL,
    INQ_DATE DATE DEFAULT SYSDATE NOT NULL,
    INQ_CNT VARCHAR2(2000) NOT NULL,
    ANS_CNT VARCHAR(3000),
    INQ_DEL_NY CHAR(1) DEFAULT 'N' CHECK(INQ_DEL_NY IN('N','Y')),
    MEM_ID VARCHAR2(20) NOT NULL REFERENCES MEMBER
);

COMMENT ON COLUMN INQUIRY.INQ_NO IS '문의번호';
COMMENT ON COLUMN INQUIRY.INQ_MENU IS '카테고리';
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

INSERT INTO INQUIRY VALUES(SEQ_INQ_NO.NEXTVAL,1,'이 글 너무 불편합니다',SYSDATE,'음란물 관련내용이 있는거 같습니다. 삭제 부탁드립니다', '회원님 불편을 드려 죄송합니다.해당 글 삭제 처리 되었습니다.', 'N','Qdfca12' );
INSERT INTO INQUIRY VALUES(SEQ_INQ_NO.NEXTVAL,3,'이 대회관련 문의',SYSDATE,'이 대회에 관해 알고 싶은데 정보가 부족한거 같아요.', '회원님 안녕하십니까 말씀하신 대회는 해당 대회 클릭 시 홈페이지로 이동합니다 즐거운 운동되십시오.','N','wSDF23');
INSERT INTO INQUIRY VALUES(SEQ_INQ_NO.NEXTVAL,5,'업로드 관련 문의드립니다.',SYSDATE,'파일을 올리려는데 추가가 되지 않습니다.수정부탁드립니다.', '회원님 불편을 드려 죄송합니다. 업로드 오류발생으로 인하여 수정중입니다.','N','cvxzv34');
INSERT INTO INQUIRY VALUES(SEQ_INQ_NO.NEXTVAL,5,'광고 관련문의',SYSDATE,'광고가 너무 많이 나오는거 같아요', '회원님 불편을 드려 죄송합니다. 제휴회사와 논의하도록 하겠습니다','N','vdfety1111');
INSERT INTO INQUIRY VALUES(SEQ_INQ_NO.NEXTVAL,1,'광고 문의',SYSDATE,'이 광고를 올리고 싶습니다 관리자와 통화 할 수 있을까요?', '광고를 하지 않습니다.죄송합니다.','N','vdfety1111');


--------------------------------------------------
--------------     CUT 관련	----------------------
--------------------------------------------------
CREATE TABLE CUT(
    MEM_ID VARCHAR2(20) NOT NULL CONSTRAINT MEM_ID_FK REFERENCES MEMBER,
    CUT_ID VARCHAR2(20) NOT NULL,
    CUT_STATUS CHAR(1) DEFAULT 'Y' CHECK(CUT_STATUS IN('Y','N'))
);

COMMENT ON COLUMN CUT.MEM_ID IS '유저 아이디';
COMMENT ON COLUMN CUT.CUT_ID IS '차단 아이디';

INSERT INTO CUT VALUES('Qdfca12','wSDF23','Y');
INSERT INTO CUT VALUES('Qdfca12','cvxzv34','N');
INSERT INTO CUT VALUES('Qdfca12','vdfety1111','Y');
INSERT INTO CUT VALUES('vdfety1111','Qdfca12','Y');
INSERT INTO CUT VALUES('vdfety1111','cvxzv34','N');


--------------------------------------------------
--------------     FOLLOW 관련	------------------
--------------------------------------------------
CREATE TABLE FOLLOW(
    MEM_ID VARCHAR2(20) REFERENCES MEMBER,
    FLW_ID VARCHAR2(20) NOT NULL,
    FLW_DATE DATE DEFAULT SYSDATE,
    FLW_STATUS CHAR(1) DEFAULT 'Y' CHECK(FLW_STATUS IN('Y','N'))
);

COMMENT ON COLUMN FOLLOW.MEM_ID IS '유저 아이디';
COMMENT ON COLUMN FOLLOW.FLW_ID IS '팔로우 아이디';

INSERT INTO FOLLOW VALUES('vdfety1111','wSDF23',DEFAULT,DEFAULT);
INSERT INTO FOLLOW VALUES('wSDF23','cvxzv34',DEFAULT,DEFAULT);
INSERT INTO FOLLOW VALUES('user01','wSDF23',DEFAULT,DEFAULT);
INSERT INTO FOLLOW VALUES('user01','Qdfca12',DEFAULT,DEFAULT);
INSERT INTO FOLLOW VALUES('user01','vdfety1111',DEFAULT,DEFAULT);

--------------------------------------------------
--------------     FOLLOW REQUEST	--------------
--------------------------------------------------

CREATE TABLE FOLLOW_REQUEST (
    SEND_ID VARCHAR(20) NOT NULL,
    RESPONSE_ID VARCHAR2(20) NOT NULL,
    REQUEST_STATUS CHAR(1) DEFAULT 'Y' CHECK(REQUEST_STATUS IN('Y','N'))
);


COMMENT ON COLUMN FOLLOW_REQUEST.SEND_ID IS '팔로요청보낸아이디';
COMMENT ON COLUMN FOLLOW_REQUEST.RESPONSE_ID IS '팔로요청받는아이디';
COMMENT ON COLUMN FOLLOW_REQUEST.REQUEST_STATUS IS '요청상태';

--------------------------------------------------
--------------     FEED 관련	----------------------
--------------------------------------------------
CREATE TABLE FEED (  
    FEED_INDEX NUMBER CONSTRAINT FEED_INDEX_PK PRIMARY KEY, 
    FEED_DATE DATE DEFAULT SYSDATE NOT NULL,  
    FEED_TITLE VARCHAR2(60) NOT NULL,--제목
    FEED_CNT VARCHAR2(4000) NOT NULL,--내용
    FEED_EVAL NUMBER  NOT NULL ,--별점 (타입숫자맞는지?)
    FEED_PUBLIC_TYPE VARCHAR2(20)  DEFAULT '전체' NOT NULL CONSTRAINT FEED_PUBLIC_TYPE_CK CHECK(FEED_PUBLIC_TYPE IN('전체','친구','비공개')) , -- 피드공개여부
    FEED_PATH_NY CHAR(3)  DEFAULT 'N' NOT NULL CONSTRAINT FEED_PATH_NY_CK CHECK(FEED_PATH_NY IN('Y','N')), --경로등록여부
    FEED_RPR_NY CHAR(3) DEFAULT 'N' NOT NULL CONSTRAINT FEED_RPR_NY_CK CHECK(FEED_RPR_NY IN('Y','N')), --신고여부
    FEED_RPR_DATE DATE , --신고시간
    DISTANCE NUMBER,
    START_LAT NUMBER,
    START_LON NUMBER,
    FEED_DEL_NY CHAR(3)  DEFAULT 'N' NOT NULL CONSTRAINT FEED_DEL_NY_CK CHECK(FEED_DEL_NY IN('Y','N')),--피드삭제여부
    MEM_ID VARCHAR(255) NOT NULL REFERENCES MEMBER,  --포린키 작성자아이디
    HIT NUMBER DEFAULT 0 NOT NULL
);

COMMENT ON COLUMN FEED.FEED_INDEX IS '피드번호';
COMMENT ON COLUMN FEED.FEED_DATE IS '작성일자';
COMMENT ON COLUMN FEED.FEED_TITLE IS '피드제목';
COMMENT ON COLUMN FEED.FEED_CNT IS '피드내용';
COMMENT ON COLUMN FEED.FEED_EVAL IS '별점';
COMMENT ON COLUMN FEED.FEED_PUBLIC_TYPE IS '피드 공개여부';
COMMENT ON COLUMN FEED.FEED_PATH_NY IS '경로등록여부';
COMMENT ON COLUMN FEED.FEED_RPR_NY IS '피드신고여부';
COMMENT ON COLUMN FEED.FEED_RPR_DATE IS '피드신고시간';
COMMENT ON COLUMN FEED.DISTANCE IS '경로 길이';
COMMENT ON COLUMN FEED.START_LAT IS '시작 위도';
COMMENT ON COLUMN FEED.START_LON IS '시작 경도';
COMMENT ON COLUMN FEED.FEED_DEL_NY IS '피드삭제여부';
COMMENT ON COLUMN FEED.MEM_ID IS '회원 아이디';

CREATE SEQUENCE SEQ_FEED_INDEX
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

--INSERT INTO FEED VALUES(SEQ_FEED_INDEX.NEXTVAL, SYSDATE, '오늘 뛴 호수공원 코스 추천합니다','뷰도 좋고 사람도 많지 않아서 좋네요',5,'전체','Y','N',null,12.5,3.123,12.321,'N','Qdfca12');
--INSERT INTO FEED VALUES(SEQ_FEED_INDEX.NEXTVAL, SYSDATE, '오늘의 기록','안양천,30분',4,'친구','Y','N',null,12.5,3.123,12.321,'N','wSDF23');
--INSERT INTO FEED VALUES(SEQ_FEED_INDEX.NEXTVAL, SYSDATE, '2023/02/05 달리기 ','1시간 달렸는데 개빡셌다. 페이스조절해야지 ',3.5 ,'친구','N','N',null,12.5,3.123,12.321,'N','cvxzv34');
--INSERT INTO FEED VALUES(SEQ_FEED_INDEX.NEXTVAL, DEFAULT, '2021 안양공원 달리기 코스 ','날씨가 춥긴 춥다',3,'비공개','N','N',null,12.5,3.123,12.321,'N','vdfety1111');
--INSERT INTO FEED VALUES(SEQ_FEED_INDEX.NEXTVAL, SYSDATE, '한강달리기는 옳다','갓생사는기분',5,DEFAULT,'Y','N',null,12.5,3.123,12.321,DEFAULT,'wSDF23');


--------------------------------------------------
--------------     FEED_COMMENTS 관련--------------
--------------------------------------------------
CREATE TABLE FEED_COMMENTS(
    FEED_CMN_NO NUMBER PRIMARY KEY,
    FEED_CMN_ID VARCHAR2(15) NOT NULL,
    FEED_CMN_DATE DATE NOT NULL,
    FEED_CMN_CNT VARCHAR2(300) NOT NULL,
    FEED_CMN_RPR CHAR(1) DEFAULT 'N' NOT NULL CONSTRAINT FEED_CMN_RPR_CK CHECK(FEED_CMN_RPR IN ('N','Y')),
    FEED_CMN_RPR_DATE DATE,
    FEED_CMN_DEL_NY CHAR(1) DEFAULT 'N' NOT NULL CONSTRAINT FEED_CMN_DEL_NY CHECK(FEED_CMN_DEL_NY IN ('N','Y')),
    FEED_INDEX NUMBER NOT NULL REFERENCES FEED
);

COMMENT ON COLUMN FEED_COMMENTS.FEED_CMN_NO IS '댓글 인덱스';
COMMENT ON COLUMN FEED_COMMENTS.FEED_CMN_ID IS '댓글 작성자 아이디';
COMMENT ON COLUMN FEED_COMMENTS.FEED_CMN_DATE IS '댓글 작성일자';
COMMENT ON COLUMN FEED_COMMENTS.FEED_CMN_CNT IS '댓글 내용';
COMMENT ON COLUMN FEED_COMMENTS.FEED_CMN_RPR IS '댓글 신고 여부';
COMMENT ON COLUMN FEED_COMMENTS.FEED_CMN_RPR_DATE IS '댓글 신고 시간';
COMMENT ON COLUMN FEED_COMMENTS.FEED_CMN_DEL_NY IS '댓글 삭제 여부';
COMMENT ON COLUMN FEED_COMMENTS.FEED_INDEX IS '피드 번호';

CREATE SEQUENCE SEQ_FEED_CMN_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

--INSERT INTO FEED_COMMENTS VALUES(SEQ_FEED_CMN_NO.NEXTVAL,'qwerty8912',SYSDATE,'뛰고 나면 기분이 좋아지는 것 같아요 ㅎㅎ', DEFAULT, SYSDATE, 'Y', 5);
--INSERT INTO FEED_COMMENTS VALUES(SEQ_FEED_CMN_NO.NEXTVAL,'holyhs364',SYSDATE,'집 근처인데 한 번 뛰어봐야겠네요~', DEFAULT, SYSDATE, DEFAULT, 1);
--INSERT INTO FEED_COMMENTS VALUES(SEQ_FEED_CMN_NO.NEXTVAL,'ohjopo0009',SYSDATE,'저도 내일은 꼭 달리러 나가야겠어요!', DEFAULT, SYSDATE, 'Y', 5);
--INSERT INTO FEED_COMMENTS VALUES(SEQ_FEED_CMN_NO.NEXTVAL,'followme7777',SYSDATE,'겨우 이걸로 힘들다니..ㅋㅋ', 'Y', SYSDATE, DEFAULT, 2);
--INSERT INTO FEED_COMMENTS VALUES(SEQ_FEED_CMN_NO.NEXTVAL,'rogen0',SYSDATE,'저도 맨날 페이스 조절 실패하는데...ㅋㅋㅋ', 'N', SYSDATE, DEFAULT, 3);


--------------------------------------------------
------------     GPX_FILES 관련	------------------
--------------------------------------------------
CREATE TABLE GPX_FILES(
    GPX_NO NUMBER PRIMARY KEY,
    FEED_INDEX NUMBER REFERENCES FEED,
    ORIGIN_NAME VARCHAR2(255) NOT NULL,
    CHANGE_NAME VARCHAR2(255) NOT NULL,
    FILE_PATH VARCHAR2(1000) NOT NULL,
    UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
    STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N'))
);

COMMENT ON COLUMN GPX_FILES.GPX_NO IS '파일번호';
COMMENT ON COLUMN GPX_FILES.FEED_INDEX IS '피드번호';
COMMENT ON COLUMN GPX_FILES.ORIGIN_NAME IS '기존이름';
COMMENT ON COLUMN GPX_FILES.CHANGE_NAME IS '변경된이름';
COMMENT ON COLUMN GPX_FILES.FILE_PATH IS '파일경로';
COMMENT ON COLUMN GPX_FILES.UPLOAD_DATE IS '업로드날';
COMMENT ON COLUMN GPX_FILES.STATUS IS '상태';

CREATE SEQUENCE SEQ_GPX_FILES
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

--INSERT INTO GPX_FILES VALUES(SEQ_GPX_FILES.NEXTVAL, 1, 'ADSF','ADSF','ADSF',SYSDATE,'Y');
--COMMIT;


--------------------------------------------------
------------     GENERAL_HISTORY 관련	----------
--------------------------------------------------
CREATE TABLE GENERAL_HISTORY (  --게시글 히스토리
    GEN_HIST_MENU NUMBER CONSTRAINT GEN_HIST_MENU_CK CHECK(GEN_HIST_MENU IN (1,2,3)) , -- 피드1/대회2/일반3
    GEN_HIST_NO NUMBER NOT NULL , --알람 객체 고유번호(시퀀스생성)
    GEN_HIST_RPR_NY CHAR(1) DEFAULT'N' NOT NULL CONSTRAINT GEN_HIST_RPR_NY_CK CHECK(GEN_HIST_RPR_NY IN('Y','N')),--신고여부
    GEN_HIST_DATE DATE DEFAULT SYSDATE NOT NULL -- 신고들어온시간
);

COMMENT ON COLUMN GENERAL_HISTORY.GEN_HIST_MENU IS '카테고리';
COMMENT ON COLUMN GENERAL_HISTORY.GEN_HIST_NO IS '알람번호';
COMMENT ON COLUMN GENERAL_HISTORY.GEN_HIST_RPR_NY IS '신고여부';
COMMENT ON COLUMN GENERAL_HISTORY.GEN_HIST_DATE IS '알람시간';

CREATE SEQUENCE SEQ_GEN_HIST_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;


--게시물 히스토리 INSERT문 
--INSERT INTO GENERAL_HISTORY VALUES (1, SEQ_GEN_HIST_NO.NEXTVAL,'Y',SYSDATE);
--INSERT INTO GENERAL_HISTORY VALUES (2, SEQ_GEN_HIST_NO.NEXTVAL,'Y',SYSDATE);
--INSERT INTO GENERAL_HISTORY VALUES (3, SEQ_GEN_HIST_NO.NEXTVAL,'Y',SYSDATE);
--INSERT INTO GENERAL_HISTORY VALUES (1, SEQ_GEN_HIST_NO.NEXTVAL,'Y',SYSDATE);
--INSERT INTO GENERAL_HISTORY VALUES (1, SEQ_GEN_HIST_NO.NEXTVAL,'Y',SYSDATE);


--------------------------------------------------
--------------    CMN_HISTORY 관련	--------------
--------------------------------------------------
--댓글히스토리 테이블
CREATE TABLE CMN_HISTORY (
    CMN_HIST_MENU NUMBER NOT NULL CONSTRAINT CMN_HIST_MENU_CK CHECK(CMN_HIST_MENU IN (1,2,3)), -- 피드1/대회2/일반3
    CMN_HIST_NO NUMBER NOT NULL,
    CMN_HIST_RPR_NY CHAR(1) DEFAULT 'N' NOT NULL CONSTRAINT CMN_HIST_RPR_NY_CK CHECK(CMN_HIST_RPR_NY IN ('Y', 'N')),
    CMN_HIST_NEW_NY CHAR(1) DEFAULT 'Y' NOT NULL CONSTRAINT CMN_HIST_NEW_NY_CK CHECK(CMN_HIST_NEW_NY IN ('Y','N')),
    CMN_HIST_NICK_NY CHAR(1) DEFAULT 'Y' NOT NULL CONSTRAINT CMN_HIST_NICK_NY_CK CHECK(CMN_HIST_NICK_NY IN ('Y', 'N')),
    CMN_HIST_DATE DATE DEFAULT SYSDATE NOT NULL
);

COMMENT ON COLUMN CMN_HISTORY.CMN_HIST_MENU IS '카테고리';
COMMENT ON COLUMN CMN_HISTORY.CMN_HIST_NO IS '알림객체고유번호';
COMMENT ON COLUMN CMN_HISTORY.CMN_HIST_RPR_NY IS '신고여부';
COMMENT ON COLUMN CMN_HISTORY.CMN_HIST_NEW_NY IS '최신여부';
COMMENT ON COLUMN CMN_HISTORY.CMN_HIST_NICK_NY IS '닉네임포함여부';
COMMENT ON COLUMN CMN_HISTORY.CMN_HIST_DATE IS '알림시간';

CREATE SEQUENCE SEQ_CMN_HIST_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

--댓글히스토리 인서트
--INSERT INTO CMN_HISTORY VALUES(1, SEQ_CMN_HIST_NO.NEXTVAL, 'N', 'N', 'N', SYSDATE);
--INSERT INTO CMN_HISTORY VALUES(1, SEQ_CMN_HIST_NO.NEXTVAL, 'Y', 'Y', 'N', '22/01/23');
--INSERT INTO CMN_HISTORY VALUES(3, SEQ_CMN_HIST_NO.NEXTVAL, 'N', 'N', 'N', SYSDATE);
--INSERT INTO CMN_HISTORY VALUES(1, SEQ_CMN_HIST_NO.NEXTVAL, 'N', 'Y', 'N', '22/02/04');
--INSERT INTO CMN_HISTORY VALUES(3, SEQ_CMN_HIST_NO.NEXTVAL, 'Y', 'N', 'Y', '23/01/10');


--------------------------------------------------
--------------     BK_HISTORY 관련	--------------
--------------------------------------------------
--찜히스토리 테이블
CREATE TABLE BK_HISTORY(
    FEED_INDEX NUMBER NOT NULL REFERENCES FEED , --피드번호(피드테이블이랑 FK)
     MEM_ID VARCHAR(255) NOT NULL REFERENCES MEMBER, -- 찜행위유저 (멤버테이블이랑 FK)
    BK_HIST_DATE DATE DEFAULT SYSDATE --알림시간
);

COMMENT ON COLUMN BK_HISTORY.FEED_INDEX IS '피드번호';
COMMENT ON COLUMN BK_HISTORY.MEM_ID IS '찜행위유저';
COMMENT ON COLUMN BK_HISTORY.BK_HIST_DATE IS '알림시간';


--찜히스토리 INSERT문
--INSERT INTO BK_HISTORY VALUES (1, 'wSDF23',SYSDATE);
--INSERT INTO BK_HISTORY VALUES (2, 'cvxzv34',SYSDATE);
--INSERT INTO BK_HISTORY VALUES (3, 'vdfety1111',SYSDATE);
--INSERT INTO BK_HISTORY VALUES (4, 'Qdfca12',SYSDATE);
--INSERT INTO BK_HISTORY VALUES (5, 'Qdfca12',SYSDATE);


--------------------------------------------------
--------------     BOOKMARK 관련	------------------
--------------------------------------------------
CREATE TABLE BOOKMARK ( --찜테이블
    BK_NO NUMBER NOT NULL CONSTRAINT BK_NO_FK REFERENCES FEED(FEED_INDEX) ON DELETE CASCADE,
    BK_ID VARCHAR2(15) NOT NULL CONSTRAINT BK_ID_FK REFERENCES MEMBER(MEM_ID) ON DELETE CASCADE,
    BK_DATE DATE DEFAULT SYSDATE,
    BK_FOLLOEE_NY CHAR(1) DEFAULT 'N' NOT NULL CONSTRAINT BK_FOLLOEE_NY_CK CHECK(BK_FOLLOEE_NY IN ('Y', 'N'))
);

COMMENT ON COLUMN BOOKMARK.BK_NO IS '피드번호';   
COMMENT ON COLUMN BOOKMARK.BK_ID IS '회원아이디';
COMMENT ON COLUMN BOOKMARK.BK_DATE IS '찜날짜';
COMMENT ON COLUMN BOOKMARK.BK_FOLLOEE_NY IS '팔로잉여부';

--찜테이블 인서트
--INSERT INTO BOOKMARK VALUES(5, 'cvxzv34', DEFAULT, DEFAULT);
--INSERT INTO BOOKMARK VALUES(5, 'Qdfca12', DEFAULT, 'Y');
--INSERT INTO BOOKMARK VALUES(4, 'wSDF23', DEFAULT, 'Y');
--INSERT INTO BOOKMARK VALUES(1, 'wSDF23', DEFAULT, DEFAULT);
--INSERT INTO BOOKMARK VALUES(3, 'wSDF23', DEFAULT, 'Y');


----------------------------------------------
----------- CONTEST_CHALLENGE 관련 ------------
----------------------------------------------
CREATE TABLE CONTEST_CHALLENGE(
    CNTS_CHLG_NO NUMBER CONSTRAINT CNTS_CHLG_NO_PK PRIMARY KEY,
	CNTS_CHLG_TITLE VARCHAR2(60) NOT NULL,
    CNTS_CHLG_CONTENT VARCHAR2(4000) NOT NULL,
	ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL,
	CNTS_CHLG_DATE DATE NOT NULL,
    CNTS_CHLG_MAX NUMBER NOT NULL,
	RPR_STATUS CHAR(1) DEFAULT 'N' NOT NULL CONSTRAINT CC_RPR_STATUS_CK CHECK(RPR_STATUS IN('N','Y')),
    RPR_DATE DATE,
    DEL_STATUS CHAR(1) DEFAULT 'N' NOT NULL CONSTRAINT CC_DEL_STATUS_CK CHECK(DEL_STATUS IN('Y','N')),
    RPR_ID VARCHAR2(20) CONSTRAINT CC_RPR_ID_FK REFERENCES MEMBER(MEM_ID) ON DELETE CASCADE,
    CNTS_CHLG_ID VARCHAR2(20) NOT NULL CONSTRAINT CNTS_CHLG_ID_FK REFERENCES MEMBER(MEM_ID) ON DELETE CASCADE,
    CNTS_NO NUMBER NOT NULL CONSTRAINT CC_CNTS_NO_FK REFERENCES CONTEST(CNTS_NO) ON DELETE CASCADE
);

-- CONTEST_CHALLENGE SEQUENCE
CREATE SEQUENCE SEQ_CHLG_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

-- TIME 컬럼이 따로 있는 경우(구 버전)의 CONTEST_CHALLENGE INSERT 데이터
-- INSERT INTO CONTEST_CHALLENGE VALUES(SEQ_CHLG_NO.NEXTVAL,'고깃덩이하늘날다',TO_DATE('20221231110303','YYYYMMDDHH24MISS'),(SELECT CNTS_DATE FROM CONTEST WHERE CNTS_NO = 1),'140000',8,'N',NULL,'N',NULL,1,'Qdfca12');
-- INSERT INTO CONTEST_CHALLENGE VALUES(SEQ_CHLG_NO.NEXTVAL,'Road To Run',TO_DATE('20221231100457','YYYYMMDDHH24MISS'),(SELECT CNTS_DATE FROM CONTEST WHERE CNTS_NO = 1),'130000',10,'N',NULL,'Y',NULL,1,'wSDF23'); -- 등록자가 대회기간이 지나 챌린지를 삭제한 경우
-- INSERT INTO CONTEST_CHALLENGE VALUES(SEQ_CHLG_NO.NEXTVAL,'위드런',SYSDATE,(SELECT CNTS_DATE FROM CONTEST WHERE CNTS_NO = 3),'124000',4,'N',NULL,'N',NULL,3,'wSDF23');
-- INSERT INTO CONTEST_CHALLENGE VALUES(SEQ_CHLG_NO.NEXTVAL,'날으는돈까스',SYSDATE,(SELECT CNTS_DATE FROM CONTEST WHERE CNTS_NO = 5),'140000',5,'Y',TO_DATE('20230224153221','YYYYMMDDHH24MISS'),'N','vdfety1111',5,'cvxzv34');
-- INSERT INTO CONTEST_CHALLENGE VALUES(SEQ_CHLG_NO.NEXTVAL,'LOOLULALLA',SYSDATE,(SELECT CNTS_DATE FROM CONTEST WHERE CNTS_NO = 5),'133000',4,'N',NULL,'N',NULL,5,'Qdfca12');

-- TIME 컬럼 제거 후(신 버전)의 CONTEST_CHALLENGE INSERT 데이터
INSERT INTO CONTEST_CHALLENGE VALUES(SEQ_CHLG_NO.NEXTVAL,'고깃덩이하늘날다','테스트',TO_DATE('20221231110303','YYYYMMDDHH24MISS'),TO_DATE('20221231140000','YYYYMMDDHH24MISS'),8,'N',NULL,'N',NULL,'Qdfca12',1);
INSERT INTO CONTEST_CHALLENGE VALUES(SEQ_CHLG_NO.NEXTVAL,'Road To Run','테스트',TO_DATE('20221231100457','YYYYMMDDHH24MISS'),TO_DATE('20221231130000','YYYYMMDDHH24MISS'),10,'N',NULL,'Y',NULL,'wSDF23',1);
INSERT INTO CONTEST_CHALLENGE VALUES(SEQ_CHLG_NO.NEXTVAL,'위드런','테스트',SYSDATE,TO_DATE('20230319124000','YYYYMMDDHH24MISS'),4,'N',NULL,'N',NULL,'wSDF23',3);
INSERT INTO CONTEST_CHALLENGE VALUES(SEQ_CHLG_NO.NEXTVAL,'날으는돈까스','테스트',SYSDATE,TO_DATE('20231105140000','YYYYMMDDHH24MISS'),5,'Y',TO_DATE('20230224153221','YYYYMMDDHH24MISS'),'N','vdfety1111','cvxzv34',5);
INSERT INTO CONTEST_CHALLENGE VALUES(SEQ_CHLG_NO.NEXTVAL,'LOOLULALLA','테스트',SYSDATE,TO_DATE('20231105133000','YYYYMMDDHH24MISS'),4,'N',NULL,'N',NULL,'Qdfca12',5);

-- CONTEST_CHALLENGE COMMENT
COMMENT ON COLUMN CONTEST_CHALLENGE.CNTS_CHLG_NO IS '챌린지번호';
COMMENT ON COLUMN CONTEST_CHALLENGE.CNTS_CHLG_TITLE IS '챌린지명';
COMMENT ON COLUMN CONTEST_CHALLENGE.CNTS_CHLG_CONTENT IS '챌린지내용'; -- 추가
COMMENT ON COLUMN CONTEST_CHALLENGE.ENROLL_DATE IS '등록일자';
COMMENT ON COLUMN CONTEST_CHALLENGE.CNTS_CHLG_DATE IS '모임시각';
COMMENT ON COLUMN CONTEST_CHALLENGE.CNTS_CHLG_MAX IS '최대참여인원';
COMMENT ON COLUMN CONTEST_CHALLENGE.RPR_STATUS IS '신고여부';
COMMENT ON COLUMN CONTEST_CHALLENGE.RPR_DATE IS '신고시간';
COMMENT ON COLUMN CONTEST_CHALLENGE.DEL_STATUS IS '삭제여부';
COMMENT ON COLUMN CONTEST_CHALLENGE.RPR_ID IS '신고자아이디';
COMMENT ON COLUMN CONTEST_CHALLENGE.CNTS_NO IS '연결된대회번호';
COMMENT ON COLUMN CONTEST_CHALLENGE.CNTS_CHLG_ID IS '등록자아이디';


----------------------------------------------
------------------ LOCAL 관련 -----------------
----------------------------------------------
CREATE TABLE LOCAL (
    LOCAL_NO NUMBER CONSTRAINT LOCAL_NO_PK PRIMARY KEY,
    LOCAL_NAME VARCHAR2(15) NOT NULL CONSTRAINT LOCAL_NAME_CK CHECK(LOCAL_NAME IN('서울','부산','대구','인천','광주','대전','울산','세종','경기','강원','충북','충남','전북','전남','경북','경남','제주'))
);

-- 필수적인 INSERT문 (0X의 형태로 나타내고자 시퀀스 미사용)
INSERT INTO LOCAL VALUES(01, '서울');
INSERT INTO LOCAL VALUES(02, '경기');
INSERT INTO LOCAL VALUES(03, '인천');
INSERT INTO LOCAL VALUES(04, '부산');
INSERT INTO LOCAL VALUES(05, '대구');
INSERT INTO LOCAL VALUES(06, '광주');
INSERT INTO LOCAL VALUES(07, '대전');
INSERT INTO LOCAL VALUES(08, '울산');
INSERT INTO LOCAL VALUES(09, '세종');
INSERT INTO LOCAL VALUES(10, '강원');
INSERT INTO LOCAL VALUES(11, '충북');
INSERT INTO LOCAL VALUES(12, '충남');
INSERT INTO LOCAL VALUES(13, '전북');
INSERT INTO LOCAL VALUES(14, '전남');
INSERT INTO LOCAL VALUES(15, '경북');
INSERT INTO LOCAL VALUES(16, '경남');
INSERT INTO LOCAL VALUES(17, '제주');

-- LOCAL COMMENT
COMMENT ON COLUMN LOCAL.LOCAL_NO IS '지역번호';
COMMENT ON COLUMN LOCAL.LOCAL_NAME IS '지역명';


----------------------------------------------
------------ NORMAL_CHALLENGE 관련 ------------
----------------------------------------------
CREATE TABLE NORMAL_CHALLENGE (
    NOR_CHLG_NO NUMBER CONSTRAINT NOR_CHLG_NO_PK PRIMARY KEY, -- 데이터 삽입할때 시퀀스로 값 인가
	NOR_CHLG_TITLE VARCHAR2(60) NOT NULL,
    NOR_CHLG_CONTENT VARCHAR2(4000) NOT NULL,
	ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL, -- 데이터 삽입이 이뤄질때 시간
	NOR_CHLG_DATE DATE NOT NULL,
    NOR_CHLG_MAX NUMBER NOT NULL,
	RPR_STATUS CHAR(1) DEFAULT 'N' NOT NULL CONSTRAINT NC_RPR_STATUS_CK CHECK(RPR_STATUS IN('Y','N')),
    RPR_DATE DATE,
    DEL_STATUS CHAR(1) DEFAULT 'N' NOT NULL CONSTRAINT NC_DEL_STATUS_CK CHECK(DEL_STATUS IN('Y','N')),
    RPR_ID VARCHAR2(20) CONSTRAINT NC_RPR_ID_FK REFERENCES MEMBER(MEM_ID),
    NOR_CHLG_ID VARCHAR2(20) NOT NULL CONSTRAINT NOR_CHLG_ID_FK REFERENCES MEMBER(MEM_ID) ON DELETE CASCADE,
    NOR_CHLG_LOCAL NUMBER NOT NULL CONSTRAINT NOR_CHLG_LOCAL_FK REFERENCES LOCAL(LOCAL_NO) ON DELETE CASCADE
);

-- NORMAL_CHALLENGE SEQUENCE
CREATE SEQUENCE SEQ_NCHLG_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

INSERT INTO NORMAL_CHALLENGE VALUES(SEQ_NCHLG_NO.NEXTVAL,'즐런인서울','테스트',TO_DATE('20230121130041','YYYYMMDDHH24MISS'),TO_DATE('20230204183000','YYYYMMDDHH24MISS'),20,DEFAULT,NULL,DEFAULT,NULL,'Qdfca12',01);
INSERT INTO NORMAL_CHALLENGE VALUES(SEQ_NCHLG_NO.NEXTVAL,'광품달(광안리를 품고 달리다)','테스트',DEFAULT,TO_DATE('20230301183000','YYYYMMDDHH24MISS'),20,DEFAULT,NULL,DEFAULT,NULL,'wSDF23',04);
INSERT INTO NORMAL_CHALLENGE VALUES(SEQ_NCHLG_NO.NEXTVAL,'wonder like station 동네사람들','테스트',TO_DATE('20230122101328','YYYYMMDDHH24MISS'),TO_DATE('20230221123000','YYYYMMDDHH24MISS'),30,DEFAULT,NULL,'Y',NULL,'vdfety1111',17);
INSERT INTO NORMAL_CHALLENGE VALUES(SEQ_NCHLG_NO.NEXTVAL,'프로경기러','테스트',SYSDATE,TO_DATE('20230321233000','YYYYMMDDHH24MISS'),2,'Y',TO_DATE('20230206194852','YYYYMMDDHH24MISS'),'N','vdfety1111','cvxzv34',02);
INSERT INTO NORMAL_CHALLENGE VALUES(SEQ_NCHLG_NO.NEXTVAL,'대한런닝맨','테스트',SYSDATE,TO_DATE('20230305190000','YYYYMMDDHH24MISS'),30,DEFAULT,NULL,DEFAULT,NULL,'Qdfca12',01);

-- NORMAL_CHALLENGE COMMENT
COMMENT ON COLUMN NORMAL_CHALLENGE.NOR_CHLG_NO IS '챌린지번호';
COMMENT ON COLUMN NORMAL_CHALLENGE.NOR_CHLG_TITLE IS '챌린지명';
COMMENT ON COLUMN NORMAL_CHALLENGE.NOR_CHLG_CONTENT IS '챌린지내용';
COMMENT ON COLUMN NORMAL_CHALLENGE.ENROLL_DATE IS '등록일자';
COMMENT ON COLUMN NORMAL_CHALLENGE.NOR_CHLG_DATE IS '모임시각';
COMMENT ON COLUMN NORMAL_CHALLENGE.NOR_CHLG_MAX IS '최대참여인원';
COMMENT ON COLUMN NORMAL_CHALLENGE.RPR_STATUS IS '신고여부';
COMMENT ON COLUMN NORMAL_CHALLENGE.RPR_DATE IS '신고시간';
COMMENT ON COLUMN NORMAL_CHALLENGE.DEL_STATUS IS '삭제여부';
COMMENT ON COLUMN NORMAL_CHALLENGE.RPR_ID IS '신고자아이디';
COMMENT ON COLUMN NORMAL_CHALLENGE.NOR_CHLG_ID IS '등록자아이디';
COMMENT ON COLUMN NORMAL_CHALLENGE.NOR_CHLG_LOCAL IS '연결된지역번호';


----------------------------------------------
--------------- CHLG_COMMENTS 관련 ------------
----------------------------------------------
CREATE TABLE CHLG_COMMENTS (
    CHLG_CMN_NO NUMBER CONSTRAINT CHLG_CMN_NO_PK PRIMARY KEY, -- 데이터 삽입할때 시퀀스로 값 인가
    CHLG_CMN_DATE DATE DEFAULT SYSDATE NOT NULL,
    CHLG_CMN_CNT VARCHAR2(1500) NOT NULL,
    CHLG_CMN_RPR_NY CHAR(1) DEFAULT 'N' NOT NULL CONSTRAINT CHLG_CMN_RPR_NY_CK CHECK(CHLG_CMN_RPR_NY IN('N','Y')),
    CHLG_CMN_RPR_DATE DATE,
    CHLG_CMN_DEL_NY CHAR(1) DEFAULT 'N' NOT NULL CONSTRAINT CHLG_CMN_DEL_NY_CK CHECK(CHLG_CMN_DEL_NY IN('N','Y')),
    CHLG_CMN_ID VARCHAR2(20) NOT NULL CONSTRAINT CHLG_CMN_ID_FK REFERENCES MEMBER(MEM_ID) ON DELETE CASCADE,
    CHLG_CMN_RPR_ID VARCHAR2(20) CONSTRAINT CHLG_CMN_RPR_ID_FK REFERENCES MEMBER(MEM_ID) ON DELETE CASCADE, -- 미신고의 경우 NULL일 수 있음
    MATCH_CHLG_NO NUMBER NOT NULL CONSTRAINT MATCH_CHLG_NO_FK REFERENCES CONTEST_CHALLENGE(CNTS_CHLG_NO) ON DELETE CASCADE
);

-- CHLG_COMMENTS SEQUENCE
CREATE SEQUENCE SEQ_CHLG_CMN_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

INSERT INTO CHLG_COMMENTS VALUES(SEQ_CHLG_CMN_NO.NEXTVAL,TO_DATE('20230206194852','YYYYMMDDHH24MISS'),'저도 이번 대회에서 완주가 목표에요! 많은 도움 부탁드려요~~',DEFAULT,NULL,DEFAULT,'vdfety1111',NULL,3);
INSERT INTO CHLG_COMMENTS VALUES(SEQ_CHLG_CMN_NO.NEXTVAL,SYSDATE,'친구랑 같이 참가합니다ㅎㅎㅎ 많은 응원 부탁드려요ㅎㅎㅎㅎ',DEFAULT,NULL,DEFAULT,'cvxzv34',NULL,5);
INSERT INTO CHLG_COMMENTS VALUES(SEQ_CHLG_CMN_NO.NEXTVAL,TO_DATE('20230102020415','YYYYMMDDHH24MISS'),'진짜 뷰웅신들ㅋㅋㅋㅈㄹ하네','Y',TO_DATE('20230102030122','YYYYMMDDHH24MISS'),'Y','cvxzv34','wSDF23',1);
INSERT INTO CHLG_COMMENTS VALUES(SEQ_CHLG_CMN_NO.NEXTVAL,SYSDATE,'친구랑 같이 참가합니다ㅎㅎㅎ 많은 응원 부탁드려요ㅎㅎㅎㅎ',DEFAULT,NULL,DEFAULT,'cvxzv34',NULL,3);
INSERT INTO CHLG_COMMENTS VALUES(SEQ_CHLG_CMN_NO.NEXTVAL,TO_DATE('20230101000013','YYYYMMDDHH24MISS'),'새해맞이 첫 도전입니다! 다들 새해엔 행복하세요^^',DEFAULT,NULL,'Y','wSDF23',NULL,1);

-- CHLG_COMMENTS COMMENT
COMMENT ON COLUMN CHLG_COMMENTS.CHLG_CMN_NO IS '댓글번호';
COMMENT ON COLUMN CHLG_COMMENTS.CHLG_CMN_DATE IS '작성일자';
COMMENT ON COLUMN CHLG_COMMENTS.CHLG_CMN_CNT IS '내용';
COMMENT ON COLUMN CHLG_COMMENTS.CHLG_CMN_RPR_NY IS '신고여부';
COMMENT ON COLUMN CHLG_COMMENTS.CHLG_CMN_RPR_DATE IS '신고시간';
COMMENT ON COLUMN CHLG_COMMENTS.CHLG_CMN_DEL_NY IS '댓글삭제여부';
COMMENT ON COLUMN CHLG_COMMENTS.CHLG_CMN_ID IS '작성자아이디';
COMMENT ON COLUMN CHLG_COMMENTS.CHLG_CMN_RPR_ID IS '신고자아이디';
COMMENT ON COLUMN CHLG_COMMENTS.MATCH_CHLG_NO IS '연결된챌린지번호';


----------------------------------------------
------------- NCHLG_COMMENTS 관련 -------------
----------------------------------------------
CREATE TABLE NCHLG_COMMENTS (
    NCHLG_CMN_NO NUMBER CONSTRAINT NCHLG_CMN_NO_PK PRIMARY KEY, -- 데이터 삽입할때 시퀀스로 값 인가
    NCHLG_CMN_DATE DATE DEFAULT SYSDATE NOT NULL,
    NCHLG_CMN_CNT VARCHAR2(1500) NOT NULL,
    NCHLG_CMN_RPR_NY CHAR(1) DEFAULT 'N' NOT NULL CONSTRAINT NCHLG_CMN_RPR_NY_CK CHECK(NCHLG_CMN_RPR_NY IN('N','Y')),
    NCHLG_CMN_RPR_DATE DATE,
    NCHLG_CMN_DEL_NY CHAR(1) DEFAULT 'N' NOT NULL CONSTRAINT NCHLG_CMN_DEL_NY_CK CHECK(NCHLG_CMN_DEL_NY IN('N','Y')),
    NCHLG_CMN_ID VARCHAR2(20) NOT NULL CONSTRAINT NCHLG_CMN_ID_FK REFERENCES MEMBER(MEM_ID) ON DELETE CASCADE,
    NCHLG_CMN_RPR_ID VARCHAR2(20) CONSTRAINT NCHLG_CMN_RPR_ID_FK REFERENCES MEMBER(MEM_ID) ON DELETE CASCADE, -- 미신고의 경우 NULL일 수 있음
    MATCH_NCHLG_NO NUMBER NOT NULL CONSTRAINT MATCH_NCHLG_NO_FK REFERENCES NORMAL_CHALLENGE(NOR_CHLG_NO) ON DELETE CASCADE
);

-- NCHLG_COMMENTS SEQUENCE
CREATE SEQUENCE SEQ_NCHLG_CMN_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

INSERT INTO NCHLG_COMMENTS VALUES(SEQ_NCHLG_CMN_NO.NEXTVAL,TO_DATE('20230121154055','YYYYMMDDHH24MISS'),'서울러 총집합한다는 소문듣고 놀러왔습니다!',DEFAULT,NULL,DEFAULT,'wSDF23',NULL,1);
INSERT INTO NCHLG_COMMENTS VALUES(SEQ_NCHLG_CMN_NO.NEXTVAL,TO_DATE('20230121204815','YYYYMMDDHH24MISS'),'마포구 우사인볼트 총알장전중. 다 뎀벼라 시불ㅋㅋㅋㅋㅋ','Y',TO_DATE('20230121204932','YYYYMMDDHH24MISS'),'N','cvxzv34','wSDF23',1);
INSERT INTO NCHLG_COMMENTS VALUES(SEQ_NCHLG_CMN_NO.NEXTVAL,TO_DATE('20230121231211','YYYYMMDDHH24MISS'),'븅아 적당히 나대라','Y',TO_DATE('20230121235927','YYYYMMDDHH24MISS'),'Y','cvxzv34','wSDF23',1);
INSERT INTO NCHLG_COMMENTS VALUES(SEQ_NCHLG_CMN_NO.NEXTVAL,SYSDATE,'진짜 벌써부터 설레네여..ㅠ(후하후하)',DEFAULT,NULL,DEFAULT,'Qdfca12',NULL,2);
INSERT INTO NCHLG_COMMENTS VALUES(SEQ_NCHLG_CMN_NO.NEXTVAL,SYSDATE,'혼저옵서예~ 거마 거지게 달려봤수광 -제주토박이-',DEFAULT,NULL,DEFAULT,'vdfety1111',NULL,3);

-- NCHLG_COMMENTS COMMENT
COMMENT ON COLUMN NCHLG_COMMENTS.NCHLG_CMN_NO IS '댓글번호';
COMMENT ON COLUMN NCHLG_COMMENTS.NCHLG_CMN_DATE IS '작성일자';
COMMENT ON COLUMN NCHLG_COMMENTS.NCHLG_CMN_CNT IS '내용';
COMMENT ON COLUMN NCHLG_COMMENTS.NCHLG_CMN_RPR_NY IS '신고여부';
COMMENT ON COLUMN NCHLG_COMMENTS.NCHLG_CMN_RPR_DATE IS '신고시간';
COMMENT ON COLUMN NCHLG_COMMENTS.NCHLG_CMN_DEL_NY IS '댓글삭제여부';
COMMENT ON COLUMN NCHLG_COMMENTS.NCHLG_CMN_ID IS '작성자아이디';
COMMENT ON COLUMN NCHLG_COMMENTS.NCHLG_CMN_RPR_ID IS '신고자아이디';
COMMENT ON COLUMN NCHLG_COMMENTS.MATCH_NCHLG_NO IS '연결된챌린지번호';


----------------------------------------------
---------------- ENTRY_LIST 관련 --------------
----------------------------------------------
CREATE TABLE ENTRY_LIST (
    CHLG_NO_INLIST NUMBER NOT NULL CONSTRAINT CHLG_NO_INLIST_FK REFERENCES CONTEST_CHALLENGE(CNTS_CHLG_NO) ON DELETE CASCADE,
    CHLG_ENTRY_ID VARCHAR2(20) NOT NULL CONSTRAINT CHLG_ENTRY_ID_FK REFERENCES MEMBER(MEM_ID) ON DELETE CASCADE
);

INSERT INTO ENTRY_LIST VALUES(1,'Qdfca12');
INSERT INTO ENTRY_LIST VALUES(1,'cvxzv34');
INSERT INTO ENTRY_LIST VALUES(1,'vdfety1111');
INSERT INTO ENTRY_LIST VALUES(2,'wSDF23');
INSERT INTO ENTRY_LIST VALUES(3,'wSDF23');
INSERT INTO ENTRY_LIST VALUES(4,'cvxzv34');
INSERT INTO ENTRY_LIST VALUES(5,'Qdfca12');

-- ENTRY_LIST COMMENT
COMMENT ON COLUMN ENTRY_LIST.CHLG_NO_INLIST IS '챌린지번호';
COMMENT ON COLUMN ENTRY_LIST.CHLG_ENTRY_ID IS '아이디';


----------------------------------------------
--------------- NENTRY_LIST 관련 --------------
----------------------------------------------
CREATE TABLE NENTRY_LIST (
    NCHLG_NO_INLIST NUMBER NOT NULL CONSTRAINT NCHLG_NO_INLIST_FK REFERENCES NORMAL_CHALLENGE(NOR_CHLG_NO) ON DELETE CASCADE,
    NCHLG_ENTRY_ID VARCHAR2(20) NOT NULL CONSTRAINT NCHLG_ENTRY_ID_FK REFERENCES MEMBER(MEM_ID) ON DELETE CASCADE
);

INSERT INTO NENTRY_LIST VALUES(1,'Qdfca12');
INSERT INTO NENTRY_LIST VALUES(1,'wSDF23');
INSERT INTO NENTRY_LIST VALUES(1,'vdfety1111');
INSERT INTO NENTRY_LIST VALUES(2,'wSDF23');
INSERT INTO NENTRY_LIST VALUES(3,'vdfety1111');
INSERT INTO NENTRY_LIST VALUES(4,'cvxzv34');
INSERT INTO NENTRY_LIST VALUES(5,'Qdfca12');

-- NENTRY_LIST COMMENT
COMMENT ON COLUMN NENTRY_LIST.NCHLG_NO_INLIST IS '일반챌린지번호';
COMMENT ON COLUMN NENTRY_LIST.NCHLG_ENTRY_ID IS '연결된아이디';


----------------------------------------------
--------------- WITHDRAWAL 관련 ---------------
----------------------------------------------
CREATE TABLE WITHDRAWAL (
    WTH_NO NUMBER NOT NULL CONSTRAINT WTH_NO_CK CHECK(WTH_NO IN(1,2,3,4)), -- JS에서 기본값 1번 설정, 탈퇴한 경우에만 데이터가 추가되므로 NULL인 경우 미존재함.
    WTH_RSN VARCHAR2(150), -- WITH_NO이 4(기타)인 경우에만 탈퇴사유가 작성되므로 NULL 가능
    WTH_DATE DATE DEFAULT SYSDATE NOT NULL,
    WTH_ID VARCHAR2(20) NOT NULL CONSTRAINT WTH_ID_FK REFERENCES MEMBER(MEM_ID) ON DELETE CASCADE
);

INSERT INTO WITHDRAWAL VALUES(1,NULL,DEFAULT,'Qdfca12');
INSERT INTO WITHDRAWAL VALUES(4,'사용자의 편의성을 고려하지 않은 것 같아 좀 불편하다.',DEFAULT,'Qdfca12');

-- WITHDRAWAL COMMENT
COMMENT ON COLUMN WITHDRAWAL.WTH_NO IS '탈퇴사유';
COMMENT ON COLUMN WITHDRAWAL.WTH_RSN IS '기타입력란';
COMMENT ON COLUMN WITHDRAWAL.WTH_DATE IS '탈퇴일자';
COMMENT ON COLUMN WITHDRAWAL.WTH_ID IS '회원아이디';


----------------------------------------------
----------------- NOTICE 관련 -----------------
----------------------------------------------
CREATE TABLE NOTICE (
    NTC_NO NUMBER NOT NULL,
    NTC_TITLE VARCHAR2(90) NOT NULL,
    NTC_CNT VARCHAR2(4000) NOT NULL,
    NTC_DATE DATE DEFAULT SYSDATE NOT NULL,
    NTC_WRITER VARCHAR2(20) NOT NULL,
    NTC_COUNT NUMBER DEFAULT 0 NOT NULL,
    NTC_DEL_NY CHAR(1) DEFAULT 'N' CHECK(NTC_DEL_NY IN('Y','N'))
);

-- NOTICE SEQUENCE
CREATE SEQUENCE SEQ_NTC_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

INSERT INTO NOTICE VALUES(SEQ_NTC_NO.NEXTVAL,'서버점검 안내입니다.','2023년02월27일 02:00부터 04:00까지 서버점검 예정입니다.',DEFAULT,'ADMIN',DEFAULT,DEFAULT);
INSERT INTO NOTICE VALUES(SEQ_NTC_NO.NEXTVAL,'이벤트 당첨 안내입니다.','이벤트 결과 이*근님(hhg**), 김*진님(ott**) 당첨입니다.',TO_DATE('20230102140015','YYYYMMDDHH24MISS'),'ADMIN',DEFAULT,DEFAULT);
INSERT INTO NOTICE VALUES(SEQ_NTC_NO.NEXTVAL,'2022년 감사합니다.','2022년 한해 마무리 잘되시길 진심으로 기원합니다.',TO_DATE('20221231193015','YYYYMMDDHH24MISS'),'ADMIN',DEFAULT,DEFAULT);
INSERT INTO NOTICE VALUES(SEQ_NTC_NO.NEXTVAL,'서버점검 안내입니다.','2022년12월20일 02:00부터 04:00까지 서버점검 예정입니다.',TO_DATE('20221219163033','YYYYMMDDHH24MISS'),'ADMIN',56,DEFAULT);
INSERT INTO NOTICE VALUES(SEQ_NTC_NO.NEXTVAL,'추워진 날씨 러너분들 조심하세요','추운겨울 빙판길 사고가 잇달아 발생중입니다. 러너분들 안전러닝 하세요!',TO_DATE('20221211092023','YYYYMMDDHH24MISS'),'ADMIN',23,DEFAULT); 

-- NOTICE COMMENT
COMMENT ON COLUMN NOTICE.NTC_NO IS '공지번호';
COMMENT ON COLUMN NOTICE.NTC_TITLE IS '공지제목';
COMMENT ON COLUMN NOTICE.NTC_CNT IS '공지내용';
COMMENT ON COLUMN NOTICE.NTC_DATE IS '공지등록일';
COMMENT ON COLUMN NOTICE.NTC_COUNT IS '조회수';


COMMIT;

