SELECT 
       COUNT(*) COUNT
  FROM NENTRY_LIST
  JOIN NORMAL_CHALLENGE ON (NOR_CHLG_NO = NCHLG_NO_INLIST)
 WHERE NCHLG_ENTRY_ID = ?
   AND NOR_CHLG_DATE > SYSDATE;

SELECT * FROM CONTEST_CHALLENGE;

SELECT 
       CNTS_CHLG_TITLE
     , ENROLL_DATE
     , CNTS_CHLG_DATE
     , CNTS_CHLG_MAX
     , CNTS_CHLG_ID
     , CNTS_NAME
  FROM CONTEST_CHALLENGE C
  JOIN CONTEST USING (CNTS_NO)
  JOIN ENTRY_LIST ON (CHLG_NO_INLIST = CNTS_NO)
 WHERE
       CHLG_ENTRY_ID = 'Qdfca12'
   AND C.DEL_STATUS = 'N'
   AND RPR_STATUS = 'N';
   
SELECT * FROM NORMAL_CHALLENGE;   
   
SELECT 
       NOR_CHLG_TITLE
     , ENROLL_DATE
     , NOR_CHLG_DATE
     , NOR_CHLG_MAX
     , NOR_CHLG_ID
     , LOCAL_NAME
  FROM NORMAL_CHALLENGE
  JOIN LOCAL ON (NOR_CHLG_LOCAL = LOCAL_NO)
  JOIN NENTRY_LIST ON (NCHLG_NO_INLIST = NOR_CHLG_NO)
 WHERE
       NCHLG_ENTRY_ID = 'Qdfca12'
   AND DEL_STATUS = 'N'
   AND RPR_STATUS = 'N';

   
SELECT 
       CNTS_CHLG_NO
     , CNTS_CHLG_TITLE
     , ENROLL_DATE
     , CNTS_CHLG_DATE
     , CNTS_CHLG_MAX
     , CNTS_CHLG_ID
     , CNTS_NAME
     , (SELECT 
               COUNT(CHLG_ENTRY_ID)
          FROM ENTRY_LIST 
         WHERE CHLG_NO_INLIST = CNTS_CHLG_NO) COUNT
  FROM CONTEST_CHALLENGE C
  JOIN CONTEST USING (CNTS_NO)
 WHERE
       C.DEL_STATUS = 'N'
   AND RPR_STATUS = 'N'
   AND CNTS_NO = 1;
   

SELECT 
       CNTS_NO
     , CNTS_NAME
     , CNTS_DATE
     , CNTS_URL
  FROM CONTEST;
  
SELECT
       LOCAL_NO
     , LOCAL_NAME
  FROM LOCAL;

SELECT * FROM NORMAL_CHALLENGE;

SELECT 
       NOR_CHLG_NO
     , NOR_CHLG_TITLE
     , ENROLL_DATE
     , NOR_CHLG_DATE
     , NOR_CHLG_MAX
     , NOR_CHLG_ID
     , LOCAL_NAME
     , (SELECT 
               COUNT(NCHLG_ENTRY_ID)
          FROM NENTRY_LIST 
         WHERE NCHLG_NO_INLIST = NOR_CHLG_NO) COUNT
  FROM NORMAL_CHALLENGE N
  JOIN LOCAL ON (NOR_CHLG_LOCAL = LOCAL_NO)
 WHERE
       N.DEL_STATUS = 'N'
   AND RPR_STATUS = 'N'
   AND LOCAL_NO = '1';
   
SELECT 
       NOR_CHLG_NO
     , NOR_CHLG_TITLE
     , ENROLL_DATE
     , NOR_CHLG_DATE
     , NOR_CHLG_MAX
     , NOR_CHLG_ID
     , LOCAL_NAME
     , (SELECT 
               COUNT(NCHLG_ENTRY_ID)
          FROM NENTRY_LIST 
         WHERE NCHLG_NO_INLIST = NOR_CHLG_NO) COUNT
  FROM NORMAL_CHALLENGE N
  JOIN LOCAL ON (NOR_CHLG_LOCAL = LOCAL_NO)
 WHERE
       N.DEL_STATUS = 'N'
   AND RPR_STATUS = 'N';


SELECT * FROM CONTEST;
SELECT * FROM UPLOAD;

INSERT
  INTO CONTEST
     (
       CNTS_NO
     , CNTS_NAME
     , CNTS_DATE
     , CNTS_URL
     , DEL_STATUS
     )
VALUES
     (
       SEQ_CNTS_NO.NEXTVAL
     , ?
     , SYSDATE
     , ?
     , DEFAULT
     );

INSERT
  INTO UPLOAD
     (
       UPL_ID
     , UPL_MENU
     , UPL_NO
     , ORIGIN_NAME
     , CHANGE_NAME
     , VER_STATUS
     , DEL_STATUS
     )
VALUES
     (
       ?
     , ?
     , SEQ_CNTS_NO.CURRVAL
     , ?
     , ?
     , DEFAULT
     , DEFAULT
     );     


SELECT 
       CNTS_NO
     , CNTS_NAME
     , CNTS_DATE
     , CNTS_URL
     , CHANGE_NAME
  FROM CONTEST
  JOIN UPLOAD ON (CNTS_NO = UPL_NO);
  
SELECT 
       CNTS_NO
     , CNTS_NAME
     , CNTS_DATE
     , CNTS_URL
     , CHANGE_NAME
  FROM CONTEST C
  JOIN UPLOAD ON (CNTS_NO = UPL_NO)
 WHERE 
       C.DEL_STATUS = 'N'
 ORDER
    BY CNTS_DATE;
  
DELETE CONTEST;

UPDATE
       CONTEST
   SET DEL_STATUS = 'Y'
 WHERE CNTS_NO = ?;

SELECT * FROM CONTEST_CHALLENGE;

INSERT
  INTO CONTEST_CHALLENGE
     (
       CNTS_CHLG_NO
     , CNTS_CHLG_TITLE
     , CNTS_CHLG_CONTENT
     , ENROLL_DATE
     , CNTS_CHLG_DATE
     , CNTS_CHLG_MAX
     , CNTS_CHLG_ID
     , CNTS_NO
     )
VALUES
     (
       SEQ_CHLG_NO.NEXTVAL
     , ?
     , ?
     , SYSDATE
     , ?
     , ?
     , ?
     , (SELECT CNTS_NO FROM CONTEST WHERE CNTS_NAME = ?)
     );

SELECT CNTS_NO 
FROM CONTEST
WHERE CNTS_NAME = '�׽�Ʈ111';


SELECT 
       CNTS_NO
     , CNTS_NAME
     , CNTS_DATE
     , CNTS_URL
     , CHANGE_NAME
  FROM CONTEST 
  JOIN UPLOAD ON (CNTS_NO = UPL_NO)
 WHERE 
       CNTS_NO = 6;



SELECT 
       CNTS_CHLG_NO
     , CNTS_CHLG_TITLE
     , ENROLL_DATE
     , CNTS_CHLG_DATE
     , CNTS_CHLG_MAX
     , CNTS_CHLG_ID
     , CNTS_NAME
     , CHANGE_NAME
     , (SELECT 
               COUNT(CHLG_ENTRY_ID)
          FROM ENTRY_LIST 
         WHERE CHLG_NO_INLIST = CNTS_CHLG_NO) COUNT
  FROM CONTEST_CHALLENGE C
  JOIN CONTEST USING (CNTS_NO)
 WHERE
       C.DEL_STATUS = 'N'
   AND RPR_STATUS = 'N'
   AND CNTS_NO = ?


















COMMIT;
  