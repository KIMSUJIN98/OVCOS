--CREATE USER OVCOS IDENTIFIED BY OVCOS;
--GRANT CONNECT, RESOURCE TO OVCOS;

-- DROP TABLE --
DROP TABLE FEED_COMMENTS;
DROP TABLE CHLG_COMMENTS;
DROP TABLE CHALLENGE;
DROP TABLE CONTEST;
DROP TABLE INQUIRY;
DROP TABLE FOLLOW;

DROP TABLE UPLOAD;
DROP TABLE CMN_HISTORY;
DROP TABLE GENERAL_HISTORY;
DROP TABLE BK_HISTORY;
DROP TABLE WITHDRAWAL;
DROP TABLE NOTICE;
DROP TABLE FEED;
DROP TABLE MEMBER;

-- DROP SEQUENCE --
DROP SEQUENCE SEQ_INQ_NO;
DROP SEQUENCE SEQ_FEED_INDEX;
DROP SEQUENCE SEQ_FEED_CMN_NO;
DROP SEQUENCE SEQ_CMN_HIST_NO;

-- CREATE SEQUENCE --
-- INQUIRY SEQUENCE
CREATE SEQUENCE SEQ_INQ_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
-- FEED SEQUENCE
CREATE SEQUENCE SEQ_FEED_INDEX
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
--  FFED_COMMENTS SEQUENCE
CREATE SEQUENCE SEQ_FEED_CMN_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
-- CMN_HISTORY SEQUENCE
CREATE SEQUENCE SEQ_CMN_HIST_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

CREATE TABLE MEMBER (
	MEM_ID	VARCHAR(20) CONSTRAINT MEM_ID_PK PRIMARY KEY,
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

INSERT INTO MEMBER VALUES('Qdfca12','qwe123','김기현','Kim_ki','우리 같이 열심히 운동해 봐요','19911013',DEFAULT,DEFAULT,NULL,DEFAULT,DEFAULT,NULL,0,'일반', NULL,'Qdfca12@gamil.com');
INSERT INTO MEMBER VALUES('wSDF23','asd214','박창제','parkCH','안녕하세요','19811013',DEFAULT,DEFAULT,NULL,DEFAULT,DEFAULT,NULL,0,'일반', NULL,'wSDF23@gamil.com');
INSERT INTO MEMBER VALUES('cvxzv34','pouih1!','김준식','flag123','안녕하세요','19711213',DEFAULT,'휴먼','서울특별시 광진구',DEFAULT,120,NULL,2,'카카오', 'adsfqwercva','cvxzv34@gamil.com');
INSERT INTO MEMBER VALUES('vdfety1111','jryff3#','존박','jhon','하이요','19970203',DEFAULT,'일시정지','인천 계양구','N',60,'PYJYJYU',3,'네이버', 'AFCETEDF','vdfety1111@gamil.com');
INSERT INTO MEMBER VALUES('admin','admin','관리자','관리자','관리를 빡세게 하자',NULL,'관리자','관리자',NULL,DEFAULT,DEFAULT,NULL,0,'일반', NULL,'ADMIN@gamil.com');


CREATE TABLE INQUIRY(
    INQ_NO NUMBER NOT NULL CONSTRAINT INQ_NO_PK PRIMARY KEY,
    INQ_CTG VARCHAR2(30) NOT NULL CONSTRAINT INQ_CTG_CK CHECK(INQ_CTG IN ('피드', '챌린지', '업로드', '기타')),
    INQ_TITLE VARCHAR2(100) NOT NULL,
    INQ_DATE DATE DEFAULT SYSDATE NOT NULL,
    INQ_CNT VARCHAR2(2000) NOT NULL,
    ANS_CNT VARCHAR(3000),
    MEM_ID VARCHAR2(100) NOT NULL REFERENCES MEMBER
    
);

INSERT INTO INQUIRY VALUES(SEQ_INQ_NO.NEXTVAL,'피드','이 글 너무 불편합니다',SYSDATE,'음란물 관련내용이 있는거 같습니다. 삭제 부탁드립니다', '회원님 불편을 드려 죄송합니다.해당 글 삭제 처리 되었습니다.','Qdfca12' );
INSERT INTO INQUIRY VALUES(SEQ_INQ_NO.NEXTVAL,'챌린지','이 대회관련 문의',SYSDATE,'이 대회에 관해 알고 싶은데 정보가 부족한거 같아요.', '회원님 안녕하십니까 말씀하신 대회는 해당 대회 클릭 시 홈페이지로 이동합니다 즐거운 운동되십시오.','wSDF23');
INSERT INTO INQUIRY VALUES(SEQ_INQ_NO.NEXTVAL,'업로드','업로드 관련 문의드립니다.',SYSDATE,'파일을 올리려는데 추가가 되지 않습니다.수정부탁드립니다.', '회원님 불편을 드려 죄송합니다. 업로드 오류발생으로 인하여 수정중입니다.','cvxzv34');
INSERT INTO INQUIRY VALUES(SEQ_INQ_NO.NEXTVAL,'기타','광고 관련문의',SYSDATE,'광고가 너무 많이 나오는거 같아요', '회원님 불편을 드려 죄송합니다. 제휴회사와 논의하도록 하겠습니다','vdfety1111');
INSERT INTO INQUIRY VALUES(SEQ_INQ_NO.NEXTVAL,'피드','광고 문의',SYSDATE,'이 광고를 올리고 싶습니다 관리자와 통화 할 수 있을까요?', '광고를 하지 않습니다.죄송합니다.','vdfety1111');

CREATE TABLE CONTEST (
    CNTS_NO NUMBER CONSTRAINT CNTS_NO_PK PRIMARY KEY,
    CNTS_NAME VARCHAR2(60) NOT NULL,
    CNTS_DATE DATE NOT NULL,
    CNTS_URL VARCHAR2(100) NOT NULL
);

CREATE TABLE CHALLENGE (
    CHLG_NO NUMBER CONSTRAINT CHLG_NO_PK PRIMARY KEY, -- 데이터 삽입할때 시퀀스로 값 인가
	CHLG_CTG VARCHAR2(9) CONSTRAINT CHLG_CTG_CK CHECK(CHLG_CTG IN('대회','일반')),
	CHLG_TITLE VARCHAR2(60) NOT NULL,
	CHLG_ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL, -- 데이터 삽입이 이뤄질때 시간
	CHLG_DATE DATE NOT NULL,
	CHLG_ENTER_NY CHAR(1) DEFAULT 'N' NOT NULL CONSTRAINT CHLG_ENTER_NY_CK CHECK(CHLG_ENTER_NY IN('N','Y')), -- 참가가능여부?
	CHLG_LOCATION VARCHAR2(15) NOT NULL CONSTRAINT CHLG_LOCATION_CK CHECK(CHLG_LOCATION IN('서울','부산','대구','인천','광주','대전','울산','세종','경기','강원','충북','충남','전북','전남','경북','경남','제주')),
	CHLG_MAX NUMBER NOT NULL,
    CHLG_RPR_ID VARCHAR2(20) CONSTRAINT CHLG_RPR_ID_FK REFERENCES MEMBER(MEM_ID),
	CHLG_RPR_NY CHAR(1) DEFAULT 'N' NOT NULL CONSTRAINT CHLG_RPR_NY_CK CHECK(CHLG_RPR_NY IN('N','Y')),
    CHLG_RPR_DATE DATE,
    MATCH_CNTS_NO NUMBER CONSTRAINT MATCH_CNTS_NO_FK REFERENCES CONTEST(CNTS_NO) ON DELETE CASCADE, -- 대회일때만 받음
    MATCH_CHLG_ID VARCHAR2(20) NOT NULL CONSTRAINT MATCH_CHLG_ID_FK REFERENCES MEMBER(MEM_ID) ON DELETE CASCADE
);

CREATE TABLE CHLG_COMMENTS (
    CHLG_CMN_NO NUMBER CONSTRAINT CHLG_CMN_NO_PK PRIMARY KEY, -- 데이터 삽입할때 시퀀스로 값 인가
    CHLG_CMN_DATE DATE DEFAULT SYSDATE NOT NULL,
    CHLG_CMN_CNT VARCHAR2(1500) NOT NULL,
    CHLG_CMN_RPR_NY CHAR(1) DEFAULT 'N' NOT NULL CONSTRAINT CHLG_CMN_RPR_NY_CK CHECK(CHLG_CMN_RPR_NY IN('N','Y')),
    CHLG_CMN_RPR_DATE DATE,
    CHLG_CMN_DEL_NY CHAR(1) DEFAULT 'N' NOT NULL CONSTRAINT CHLG_CMN_DEL_NY_CK CHECK(CHLG_CMN_DEL_NY IN('N','Y')),
    CHLG_CMN_ID VARCHAR2(20) NOT NULL CONSTRAINT CHLG_CMN_ID_FK REFERENCES MEMBER(MEM_ID) ON DELETE CASCADE,
    CHLG_CMN_RPR_ID VARCHAR2(20) CONSTRAINT CHLG_CMN_RPR_ID_FK REFERENCES MEMBER(MEM_ID) ON DELETE CASCADE, -- 미신고의 경우 NULL일 수 있음
    MATCH_CHLG_NO NUMBER NOT NULL CONSTRAINT MATCH_CHLG_NO_FK REFERENCES CHALLENGE(CHLG_NO) ON DELETE CASCADE
);

CREATE TABLE FEED ( 
    FEED_INDEX NUMBER CONSTRAINT FEED_INDEX_PK PRIMARY KEY, --피드번호
    FEED_DATE DATE DEFAULT SYSDATE NOT NULL,  -- 작성일 
    FEED_TITLE VARCHAR2(60) NOT NULL,--제목
    FEED_CNT VARCHAR2(1500) NOT NULL,--내용
    FEED_EVAL NUMBER  NOT NULL ,--별점 (타입숫자맞는지?)
    FEED_TIME_RQRD NUMBER NOT NULL , -- 소요시간 (ERD 는 NULL인데 NOT NULL로...) 
    FEED_PUBLIC_TYPE CHAR(20)  DEFAULT '전체' NOT NULL CONSTRAINT FEED_PUBLIC_TYPE_CK CHECK(FEED_PUBLIC_TYPE IN('전체','친구','비공개')) , -- 피드공개여부
    FEED_PAHT_NY CHAR(1)  DEFAULT 'N' NOT NULL CONSTRAINT FEED_PAHT_NY_CK CHECK(FEED_PAHT_NY IN('Y','N')), --경로등록여부
    FEED_RPR_NY CHAR(1) DEFAULT 'N' NOT NULL CONSTRAINT FEED_RPR_NY_CK CHECK(FEED_RPR_NY IN('Y','N')), --신고여부
    FEED_RPR_DATE DATE , --신고시간
    FEED_GPX VARCHAR2(300) NOT NULL, --경로파일  (ERD 는 NULL인데 NOT NULL로...)
    FEED_DST NUMBER  NOT NULL ,-- 경로길이(ERD 는 NULL인데 NOT NULL로...) 
    FEED_DEL_NY CHAR(1)  DEFAULT 'N' NOT NULL CONSTRAINT FEED_DEL_NY_CK CHECK(FEED_DEL_NY IN('Y','N')),--피드삭제여부
    MEM_ID VARCHAR(255) NOT NULL REFERENCES MEMBER  --포린키 작성자아이디
);

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

CREATE TABLE FOLLOW (
    FLW_CUT_NY CHAR(1) DEFAULT 'N' CONSTRAINT FLW_CUT_NY_CK CHECK(FLW_CUT_NY IN ('Y', 'N')) NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL CONSTRAINT MEM_ID_FK REFERENCES MEMBER(MEM_ID) ON DELETE CASCADE,
    FLW_ED_NY VARCHAR2(20) NOT NULL CONSTRAINT FLW_ED_NY_FK REFERENCES MEMBER(MEM_ID) ON DELETE CASCADE
);


CREATE TABLE UPLOAD(
    UPL_ID VARCHAR2(20) NOT NULL,
    UPL_STT VARCHAR2(30) NOT NULL CHECK(UPL_STT IN('challenge','profile','background','gpx','contest')),
    UPL_NO NUMBER NOT NULL,
    UPL_TITLE VARCHAR2(60) NOT NULL,
    UPL_VER CHAR(1) DEFAULT 'F' CHECK(UPL_VER IN('F','T'))
);

INSERT INTO UPLOAD VALUES('admin','contest',1,'contest1.img','T');
INSERT INTO UPLOAD VALUES('Qdfca12','profile',3,'odfcprofile.img','F');
INSERT INTO UPLOAD VALUES('wSDF23','gpx',2,'dmz.gpx','T');
INSERT INTO UPLOAD VALUES('cvxzv34','challenge',4,'chal4.img','F');
INSERT INTO UPLOAD VALUES('vdfety1111','background',2,'back2.img','F');

CREATE TABLE CMN_HISTORY (
    CMN_HIST_CTG VARCHAR2(9) NOT NULL,
    CMN_HIST_NO NUMBER NOT NULL,
    CMN_HIST_RPR_NY CHAR(1) DEFAULT 'N' NOT NULL CONSTRAINT CMN_HIST_RPR_NY_CK CHECK(CMN_HIST_RPR_NY IN ('Y', 'N')),
    CMN_HIST_NEW_NY CHAR(1) DEFAULT 'Y' NOT NULL CONSTRAINT CMN_HIST_NEW_NY_CK CHECK(CMN_HIST_NEW_NY IN ('Y','N')),
    CMN_HIST_NICK_NY CHAR(1) DEFAULT 'Y' NOT NULL CONSTRAINT CMN_HIST_NICK_NY_CK CHECK(CMN_HIST_NICK_NY IN ('Y', 'N')),
    CMN_HIST_DATE DATE DEFAULT SYSDATE NOT NULL
);

CREATE TABLE GENERAL_HISTORY (  --게시글 히스토리
    GEN_HIST_CTG VARCHAR2(10) NOT NULL , --알람객체분류
    GEN_HIST_NO NUMBER NOT NULL , --알람 객체 고유번호 (피드,또는 그룹번호) 
    GEN_HIST_RPR_NY CHAR(1) DEFAULT'N' NOT NULL CONSTRAINT GEN_HIST_RPR_NY_CK CHECK(GEN_HIST_RPR_NY IN('Y','N')),--신고여부
    GEN_HIST_DATE DATE DEFAULT SYSDATE NOT NULL -- 신고들어온시간
);

CREATE TABLE BK_HISTORY(
    FEED_INDEX NUMBER NOT NULL REFERENCES FEED , --피드번호(피드테이블이랑 FK)
    BK_HIST_ID VARCHAR2(20), -- 찜행위유저
    BK_HIST_DATE DATE --알림시간
);

CREATE TABLE WITHDRAWAL (
    WTH_NO NUMBER NOT NULL CONSTRAINT WTH_NO_CK CHECK(WTH_NO IN(1,2,3,4)), -- JS에서 기본값 1번 설정, 탈퇴한 경우에만 데이터가 추가되므로 NULL인 경우 미존재함.
    WTH_RSN VARCHAR2(150), -- WITH_NO이 4(기타)인 경우에만 탈퇴사유가 작성되므로 NULL 가능
    WTH_DATE DATE DEFAULT SYSDATE NOT NULL,
    WTH_ID VARCHAR2(20) NOT NULL CONSTRAINT WTH_ID_FK REFERENCES MEMBER(MEM_ID) ON DELETE CASCADE
);

CREATE TABLE NOTICE (
    NTC_NO NUMBER NOT NULL,
    NTC_TITLE VARCHAR2(90) NOT NULL,
    NTC_CNT VARCHAR2(4000) NOT NULL,
    NTC_DATE DATE DEFAULT SYSDATE NOT NULL,
    NTC_COUNT NUMBER DEFAULT 0 NOT NULL
);

-- COMMENT 

--MEMBER COMMENT
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

-- INQUIRY COMMENT
COMMENT ON COLUMN INQUIRY.INQ_NO IS '문의번호';
COMMENT ON COLUMN INQUIRY.INQ_CTG IS '카테고리';
COMMENT ON COLUMN INQUIRY.INQ_TITLE IS '문의제목';
COMMENT ON COLUMN INQUIRY.INQ_DATE IS '문의작성일';
COMMENT ON COLUMN INQUIRY.INQ_CNT IS '문의내용';
COMMENT ON COLUMN INQUIRY.ANS_CNT IS '답변내용';

-- CHALLENGE COMMENT
COMMENT ON COLUMN CHALLENGE.CHLG_NO IS '챌린지번호';
COMMENT ON COLUMN CHALLENGE.CHLG_CTG IS '대회/일반';
COMMENT ON COLUMN CHALLENGE.CHLG_TITLE IS '챌린지명';
COMMENT ON COLUMN CHALLENGE.CHLG_ENROLL_DATE IS '등록일자';
COMMENT ON COLUMN CHALLENGE.CHLG_DATE IS '모이는시간';
COMMENT ON COLUMN CHALLENGE.CHLG_ENTER_NY IS '참가여부';
COMMENT ON COLUMN CHALLENGE.MATCH_CNTS_NO IS '연결된대회번호';
COMMENT ON COLUMN CHALLENGE.CHLG_LOCATION IS '지역선택';
COMMENT ON COLUMN CHALLENGE.CHLG_MAX IS '최대참여인원';
COMMENT ON COLUMN CHALLENGE.CHLG_RPR_ID IS '신고자아이디';
COMMENT ON COLUMN CHALLENGE.CHLG_RPR_NY IS '신고여부';
COMMENT ON COLUMN CHALLENGE.CHLG_RPR_DATE IS '신고시간';
COMMENT ON COLUMN CHALLENGE.MATCH_CHLG_ID IS '등록자아이디';

-- CHLG_COMMENTS COMMENT
COMMENT ON COLUMN CHLG_COMMENTS.CHLG_CMN_NO IS '댓글번호';
COMMENT ON COLUMN CHLG_COMMENTS.CHLG_CMN_ID IS '작성자아이디';
COMMENT ON COLUMN CHLG_COMMENTS.CHLG_CMN_DATE IS '작성일자';
COMMENT ON COLUMN CHLG_COMMENTS.CHLG_CMN_CNT IS '내용';
COMMENT ON COLUMN CHLG_COMMENTS.CHLG_CMN_RPR_ID IS '신고자아이디';
COMMENT ON COLUMN CHLG_COMMENTS.CHLG_CMN_RPR_NY IS '신고여부';
COMMENT ON COLUMN CHLG_COMMENTS.CHLG_CMN_RPR_DATE IS '신고시간';
COMMENT ON COLUMN CHLG_COMMENTS.CHLG_CMN_DEL_NY IS '댓글삭제여부';
COMMENT ON COLUMN CHLG_COMMENTS.MATCH_CHLG_NO IS '연결된챌린지번호';

-- CONTEST COMMENT
COMMENT ON COLUMN CONTEST.CNTS_NO IS '대회번호';
COMMENT ON COLUMN CONTEST.CNTS_NAME IS '대회명';
COMMENT ON COLUMN CONTEST.CNTS_DATE IS '대회날짜';
COMMENT ON COLUMN CONTEST.CNTS_URL IS '대회사이트주소';

-- FEED COMMENT
COMMENT ON COLUMN FEED.FEED_INDEX IS '피드번호';
COMMENT ON COLUMN FEED.FEED_DATE IS '작성일자';
COMMENT ON COLUMN FEED.FEED_TITLE IS '피드제목';
COMMENT ON COLUMN FEED.FEED_CNT IS '피드내용';
COMMENT ON COLUMN FEED.FEED_EVAL IS '별점';
COMMENT ON COLUMN FEED.FEED_TIME_RQRD IS '소요시간';
COMMENT ON COLUMN FEED.FEED_PUBLIC_TYPE IS '피드 공개여부';
COMMENT ON COLUMN FEED.FEED_PAHT_NY IS '경로등록여부';
COMMENT ON COLUMN FEED.FEED_RPR_NY IS '피드신고여부';
COMMENT ON COLUMN FEED.FEED_RPR_DATE IS '피드신고시간';
COMMENT ON COLUMN FEED.FEED_GPX IS '경로파일';
COMMENT ON COLUMN FEED.FEED_DST IS '경로길이';
COMMENT ON COLUMN FEED.FEED_DEL_NY IS '피드삭제여부';
COMMENT ON COLUMN FEED.MEM_ID IS '회원 아이디';

-- FEED_COMMENTS
COMMENT ON COLUMN FEED_COMMENTS.FEED_CMN_NO IS '댓글 인덱스';
COMMENT ON COLUMN FEED_COMMENTS.FEED_CMN_ID IS '댓글 작성자 아이디';
COMMENT ON COLUMN FEED_COMMENTS.FEED_CMN_DATE IS '댓글 작성일자';
COMMENT ON COLUMN FEED_COMMENTS.FEED_CMN_CNT IS '댓글 내용';
COMMENT ON COLUMN FEED_COMMENTS.FEED_CMN_RPR IS '댓글 신고 여부';
COMMENT ON COLUMN FEED_COMMENTS.FEED_CMN_RPR_DATE IS '댓글 신고 시간';
COMMENT ON COLUMN FEED_COMMENTS.FEED_CMN_DEL_NY IS '댓글 삭제 여부';
COMMENT ON COLUMN FEED_COMMENTS.FEED_INDEX IS '피드 번호';

-- FOLLOW COMMENTS
COMMENT ON COLUMN FOLLOW.MEM_ID IS '아이디';
COMMENT ON COLUMN FOLLOW.FLW_ED_NY IS '다른회원아이디';
COMMENT ON COLUMN FOLLOW.FLW_CUT_NY IS '차단여부';

-- UPLOAD COMMENTS
COMMENT ON COLUMN UPLOAD.UPL_ID IS '업로드한 유저 아이디';
COMMENT ON COLUMN UPLOAD.UPL_STT IS '파일 업로드한 게시글 카테고리';
COMMENT ON COLUMN UPLOAD.UPL_NO IS '게시글 번호';
COMMENT ON COLUMN UPLOAD.UPL_TITLE IS '파일 이름';
COMMENT ON COLUMN UPLOAD.UPL_VER IS '검증여부';

-- CMN_HISTORY COMMNETS
COMMENT ON COLUMN CMN_HISTORY.CMN_HIST_CTG IS '알림객체분류';
COMMENT ON COLUMN CMN_HISTORY.CMN_HIST_NO IS '알림객체고유번호';
COMMENT ON COLUMN CMN_HISTORY.CMN_HIST_RPR_NY IS '신고여부';
COMMENT ON COLUMN CMN_HISTORY.CMN_HIST_NEW_NY IS '최신여부';
COMMENT ON COLUMN CMN_HISTORY.CMN_HIST_NICK_NY IS '닉네임포함여부';
COMMENT ON COLUMN CMN_HISTORY.CMN_HIST_DATE IS '알림시간';

-- GENERAL_HISTORY COMMENTS
COMMENT ON COLUMN GENERAL_HISTORY.GEN_HIST_CTG IS '알람객체번호';
COMMENT ON COLUMN GENERAL_HISTORY.GEN_HIST_NO IS '알람객체고유번호';
COMMENT ON COLUMN GENERAL_HISTORY.GEN_HIST_RPR_NY IS '신고여부';
COMMENT ON COLUMN GENERAL_HISTORY.GEN_HIST_DATE IS '알람시간';

-- BK_HISTORY COMMENTS
COMMENT ON COLUMN BK_HISTORY.FEED_INDEX IS '피드번호';
COMMENT ON COLUMN BK_HISTORY.BK_HIST_ID IS '찜행위유저';
COMMENT ON COLUMN BK_HISTORY.BK_HIST_DATE IS '알림시간';

-- WITHDRAWAL COMMENTS
COMMENT ON COLUMN WITHDRAWAL.WTH_NO IS '탈퇴사유';
COMMENT ON COLUMN WITHDRAWAL.WTH_RSN IS '기타입력란';
COMMENT ON COLUMN WITHDRAWAL.WTH_DATE IS '탈퇴일자';
COMMENT ON COLUMN WITHDRAWAL.WTH_ID IS '회원아이디';

-- NOTICE COMMENTS
COMMENT ON COLUMN NOTICE.NTC_NO IS '공지번호';
COMMENT ON COLUMN NOTICE.NTC_TITLE IS '공지제목';
COMMENT ON COLUMN NOTICE.NTC_CNT IS '공지내용';
COMMENT ON COLUMN NOTICE.NTC_DATE IS '공지등록일';
COMMENT ON COLUMN NOTICE.NTC_COUNT IS '조회수';
