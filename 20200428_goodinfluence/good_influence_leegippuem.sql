-- SQLite
CREATE TABLE AREA
(
  AREA_ID   TEXT NOT NULL,
  AREA_NAME TEXT NULL    ,
  PRIMARY KEY (AREA_ID)
);

CREATE TABLE BUSINESS_HOURS
(
  HOURS_ID TEXT NOT NULL,
  HOURS    TEXT NULL    ,
  PRIMARY KEY (HOURS_ID)
);

CREATE TABLE ITEMS
(
  ITEMS_ID TEXT NOT NULL,
  ITEMS    TEXT NULL    ,
  PRIMARY KEY (ITEMS_ID)
);

CREATE TABLE MEMBER
(
  NUMBER         REAL NOT NULL,
  AREA_ID        TEXT NOT NULL,
  NAME_ID        TEXT NOT NULL,
  SHOP_NAME      TEXT NOT NULL,
  TELEPHONE      TEXT NULL    ,
  ADDRESS        TEXT NULL    ,
  SPONSORSHIP_ID TEXT NOT NULL,
  ITEMS_ID       TEXT NOT NULL,
  PRIMARY KEY (NUMBER),
  CONSTRAINT FK_AREA_TO_MEMBER
    FOREIGN KEY (AREA_ID)
    REFERENCES AREA (AREA_ID),
    CONSTRAINT FK_MONTHLY_REGULAR_SPONSORSHIP_TO_MEMBER
    FOREIGN KEY (SPONSORSHIP_ID)
    REFERENCES MONTHLY_REGULAR_SPONSORSHIP (SPONSORSHIP_ID),
    CONSTRAINT FK_ITEMS_TO_MEMBER
    FOREIGN KEY (ITEMS_ID)
    REFERENCES ITEMS (ITEMS_ID),
    CONSTRAINT FK_NAME_TO_MEMBER
    FOREIGN KEY (NAME_ID)
    REFERENCES NAME (NAME_ID)
);

CREATE TABLE MEMBER_HOURS
(
  NUMBER   REAL NOT NULL,
  HOURS_ID TEXT NOT NULL,
  CONSTRAINT FK_MEMBER_TO_MEMBER_HOURS
    FOREIGN KEY (NUMBER)
    REFERENCES MEMBER (NUMBER),
    CONSTRAINT FK_BUSINESS_HOURS_TO_MEMBER_HOURS
    FOREIGN KEY (HOURS_ID)
    REFERENCES BUSINESS_HOURS (HOURS_ID)
);

CREATE TABLE MEMBER_SPONSORED
(
  NUMBER         REAL NOT NULL,
  SPONSORED_1_ID TEXT NOT NULL,
  SPONSORED_2_ID      NOT NULL,
  CONSTRAINT FK_SPONSORED_1_TO_MEMBER_SPONSORED
    FOREIGN KEY (SPONSORED_1_ID)
    REFERENCES SPONSORED_1 (SPONSORED_1_ID),
    CONSTRAINT FK_SPONSORED_2_TO_MEMBER_SPONSORED
    FOREIGN KEY (SPONSORED_2_ID)
    REFERENCES SPONSORED_2 (SPONSORED_2_ID),
    CONSTRAINT FK_MEMBER_TO_MEMBER_SPONSORED
    FOREIGN KEY (NUMBER)
    REFERENCES MEMBER (NUMBER)
);

CREATE TABLE MONTHLY_REGULAR_SPONSORSHIP
(
  SPONSORSHIP_ID TEXT NOT NULL,
  SPONSORSHIP    TEXT NULL    ,
  PRIMARY KEY (SPONSORSHIP_ID)
);

CREATE TABLE NAME
(
  NAME_ID TEXT NOT NULL,
  NAME    TEXT NULL    ,
  PRIMARY KEY (NAME_ID)
);

CREATE TABLE SPONSORED_1
(
  SPONSORED_1_ID     TEXT NOT NULL,
  SPONSORED_1_OBJECT      NULL    ,
  PRIMARY KEY (SPONSORED_1_ID)
);

CREATE TABLE SPONSORED_2
(
  SPONSORED_2_ID      NOT NULL,
  SPONSORED_2_OBJECT  NULL    ,
  PRIMARY KEY (SPONSORED_2_ID)
);



INSERT INTO MEMBER VALUES ('1','AREA_03','NAME_001','진로1973','5882649286','강원 춘천 명내면 거두리 966-8','HOURS_001','ALL_MENU','SPONSORED_1_4','SPONSORED_2_3','SPONSORSHIP_01');
INSERT INTO MEMBER VALUES ('2','AREA_03','NAME_002','카페터틀','5885218295','강원도 명해시 추암명 촛대바위길 80 9층','HOURS_002','ALL_MENU','SPONSORED_1_5','SPONSORED_2_1','SPONSORSHIP_02');
INSERT INTO MEMBER VALUES ('3','AREA_03','NAME_003','황금발진당','5887848225','강원도 원주시 송계8길89(학성명 성당앞)','HOURS_003','ALL_MENU','SPONSORED_1_3','SPONSORED_2_3','SPONSORSHIP_02');


INSERT INTO AREA VALUES ('AREA_01','서울');
INSERT INTO AREA VALUES ('AREA_02','경기');
INSERT INTO AREA VALUES ('AREA_03','강원');
INSERT INTO AREA VALUES ('AREA_04','경남');
INSERT INTO AREA VALUES ('AREA_05','경북');
INSERT INTO AREA VALUES ('AREA_06','광주');
INSERT INTO AREA VALUES ('AREA_07','대구');
INSERT INTO AREA VALUES ('AREA_08','대전');
INSERT INTO AREA VALUES ('AREA_09','부산');
INSERT INTO AREA VALUES ('AREA_10','세종');
INSERT INTO AREA VALUES ('AREA_11','울산');
INSERT INTO AREA VALUES ('AREA_12','인천');
INSERT INTO AREA VALUES ('AREA_13','전남');
INSERT INTO AREA VALUES ('AREA_14','전북');
INSERT INTO AREA VALUES ('AREA_15','제주');
INSERT INTO AREA VALUES ('AREA_16','충남');
INSERT INTO AREA VALUES ('AREA_17','충북');

INSERT INTO NAME VALUES ('NAME_001','진진희');
INSERT INTO NAME VALUES ('NAME_002','주진희');
INSERT INTO NAME VALUES ('NAME_003','진말진');

INSERT INTO MONTHLY_REGULAR_SPONSORSHIP VALUES ('SPONSORSHIP_01','10,000원');
INSERT INTO MONTHLY_REGULAR_SPONSORSHIP VALUES ('SPONSORSHIP_02','5,000원');
INSERT INTO MONTHLY_REGULAR_SPONSORSHIP VALUES ('SPONSORSHIP_03','후원할 의향 있음');
INSERT INTO MONTHLY_REGULAR_SPONSORSHIP VALUES ('SPONSORSHIP_04','후원할 의향 없음');

INSERT INTO ITEMS VALUES ('ALL_MENU','전 메뉴');
INSERT INTO ITEMS VALUES ('LIMITED_MENU','일부 메뉴');

INSERT INTO BUSINESS_HOURS VALUES ('HOURS_001','11:00~14:00, 17:00~02:00');
INSERT INTO BUSINESS_HOURS VALUES ('HOURS_002','10:30~21:00, last order 19:30');
INSERT INTO BUSINESS_HOURS VALUES ('HOURS_003','11:00~20:00, 일요일 휴무');

INSERT INTO MEMBER_HOURS VALUES ('1','HOURS_001');
INSERT INTO MEMBER_HOURS VALUES ('2','HOURS_002');
INSERT INTO MEMBER_HOURS VALUES ('3','HOURS_003');

INSERT INTO MEMBER_SPONSORED VALUES ('1','SPONSORED_1_4','SPONSORED_2_1');
INSERT INTO MEMBER_SPONSORED VALUES ('1','SPONSORED_1_4','SPONSORED_2_2');
INSERT INTO MEMBER_SPONSORED VALUES ('2','SPONSORED_1_5','SPONSORED_2_1');
INSERT INTO MEMBER_SPONSORED VALUES ('3','SPONSORED_1_3','SPONSORED_2_1');
INSERT INTO MEMBER_SPONSORED VALUES ('3','SPONSORED_1_3','SPONSORED_2_2');

INSERT INTO SPONSORED_1 VALUES ('SPONSORED_1_1','카드 소지자 본인');
INSERT INTO SPONSORED_1 VALUES ('SPONSORED_1_2','동반 1인');
INSERT INTO SPONSORED_1 VALUES ('SPONSORED_1_3','동반 2인');
INSERT INTO SPONSORED_1 VALUES ('SPONSORED_1_4','동반 3인');
INSERT INTO SPONSORED_1 VALUES ('SPONSORED_1_5','인원제한없음');

INSERT INTO SPONSORED_2 VALUES ('SPONSORED_2_1','결식아동');
INSERT INTO SPONSORED_2 VALUES ('SPONSORED_2_2','소방공무원');
INSERT INTO SPONSORED_2 VALUES ('SPONSORED_2_2','결식아동, 소방공무원');
