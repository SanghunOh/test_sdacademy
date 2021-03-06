-- SQLite

CREATE TABLE DONATION
(
  BRAND_NUM    TEXT NOT NULL,
  MENU         TEXT NULL    ,
  TARGET_TYPE  TEXT NULL    ,
  TARGET_NUM   REAL NULL    ,
  MEMBERSHIP   TEXT NULL    ,
  MONTH_AMOUNT REAL NULL    ,
    CONSTRAINT FK_MEMBER_TO_DONATION
    FOREIGN KEY (BRAND_NUM)
    REFERENCES MEMBER (BRAND_NUM)
);

CREATE TABLE HOURS
(
  BRAND_NUM TEXT NOT NULL,
  OPEN      TEXT NULL    ,
  BREAKTIME TEXT NULL    ,
  CLOSED    TEXT NULL    ,
  DAYOFF    TEXT NULL    ,
    CONSTRAINT FK_MEMBER_TO_HOURS
    FOREIGN KEY (BRAND_NUM)
    REFERENCES MEMBER (BRAND_NUM)
);

CREATE TABLE MEMBER
(
  BRAND_NUM  TEXT NOT NULL,
  BRAND_NAME TEXT NOT NULL,
  NAME       TEXT NULL    ,
  TELL       REAL NULL    ,
  PRIMARY KEY (BRAND_NUM)
);


CREATE TABLE REGION
(
  BRAND_NUM TEXT NOT NULL,
  REGION    TEXT NOT NULL,
  ADDRESS   TEXT NULL    ,
    CONSTRAINT FK_MEMBER_TO_REGION
    FOREIGN KEY (BRAND_NUM)
    REFERENCES MEMBER (BRAND_NUM)
);


INSERT INTO MEMBER VALUES ('001', '미니크테이블','진찬우','886442851');
INSERT INTO REGION VALUES ('001', '강원', '강릉시 홍제명 8097-88');
INSERT INTO DONATION VALUES ('001', '전메뉴2만원이내','결식아동,소방공무원',null, '참여', 5000);
INSERT INTO HOURS VALUES ('001','11:30', null, '22:00','수요일');

INSERT INTO MEMBER VALUES ('002', '진로1973','진진희','5882649286');
INSERT INTO REGION VALUES ('002', '강원', '춘천 명내면 거두리 966-8');
INSERT INTO DONATION VALUES ('002', '전메뉴','결식아동,소방공무원','동반3인', '참여', 10000);
INSERT INTO HOURS VALUES ('002','11:00', '14:00~17:00', '02:00',null);

INSERT INTO MEMBER VALUES ('003', '자작마을','오정환','818225564');
INSERT INTO REGION VALUES ('003', '경기', '용인시 처인구 백암면 백암로 908번길 7');
INSERT INTO DONATION VALUES ('003', '불콩메뉴,식사메뉴','결식아동','동반1인', '비참여', null);
INSERT INTO HOURS VALUES ('003','11:30', '14:30~16:30', '21:00', '월요일');
