
/* Drop Tables */

DROP TABLE BandList CASCADE CONSTRAINTS;
DROP TABLE comments CASCADE CONSTRAINTS;
DROP TABLE imgBoard CASCADE CONSTRAINTS;
DROP TABLE tagindex CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE band_userinfo CASCADE CONSTRAINTS;
DROP TABLE calendar CASCADE CONSTRAINTS;
DROP TABLE Band CASCADE CONSTRAINTS;
DROP TABLE bandimg CASCADE CONSTRAINTS;
DROP TABLE scategory CASCADE CONSTRAINTS;
DROP TABLE bcategory CASCADE CONSTRAINTS;
DROP TABLE Userinfo CASCADE CONSTRAINTS;
DROP TABLE login CASCADE CONSTRAINTS;
DROP TABLE tag_name CASCADE CONSTRAINTS;


/*Create Sequence */
drop sequence seq_board;
drop sequence seq_comments;
drop sequence seq_imgboard;
drop sequence sqe_tmpimg;

create sequence seq_board;
create sequence seq_comments;
create sequence seq_imgboard;
create sequence sqe_tmpimg;


/* Create Tables */

CREATE TABLE Band
(
	band_num number(20) NOT NULL,
	scategoryNum number(5) NOT NULL,
	bandimgNum number(3) NOT NULL,
	band_name varchar2(60) NOT NULL,
	band_publicwhe number(1) NOT NULL,
	band_intoroductio varchar2(1000),
	band_date date NOT NULL,
	band_states number(3) NOT NULL,
	PRIMARY KEY (band_num)
);


CREATE TABLE bandimg
(
	bandimgNum number(3) NOT NULL,
	bandimg varchar2(1000) NOT NULL,
	PRIMARY KEY (bandimgNum)
);


CREATE TABLE BandList
(
	list_num number(20) NOT NULL,
	band_num number(20) NOT NULL,
	login_num number(20) NOT NULL,
	band_states number(3),
	band_signdate date,
	PRIMARY KEY (list_num)
);


CREATE TABLE band_userinfo
(
	userBand_num number(20) NOT NULL,
	band_num number(20) NOT NULL,
	login_num number(20) NOT NULL UNIQUE,
	band_nickname varchar2(40),
	band_approved number(3),
	band_redate date,
	PRIMARY KEY (userBand_num)
);


CREATE TABLE bcategory
(
	bcategoryNum number(3) NOT NULL,
	category_btitle varchar2(20) NOT NULL,
	categoryImg varchar2(1000) NOT NULL,
	PRIMARY KEY (bcategoryNum)
);


CREATE TABLE board
(
	board_num number(20) NOT NULL,
	band_num number(20) NOT NULL,
	userBand_num number(20) NOT NULL,
	board_content varchar2(1000) NOT NULL,
	board_redate date NOT NULL,
	board_states number(3) NOT NULL,
	PRIMARY KEY (board_num)
);


CREATE TABLE calendar
(
	calendarNum number(20) NOT NULL,
	band_num number(20) NOT NULL,
	calendartitle varchar2(30) NOT NULL,
	calendarDate date NOT NULL,
	calendarcontent varchar2(100) NOT NULL,
	addDate date NOT NULL,
	PRIMARY KEY (calendarNum)
);


CREATE TABLE comments
(
	comments_Num number(20) NOT NULL,
	userBand_num number(20) NOT NULL,
	board_num number(20) NOT NULL,
	comments_cotent varchar2(100) NOT NULL,
	ref number(20) NOT NULL,
	step number(5) NOT NULL,
	comments_date date NOT NULL,
    comments_state number(5),
	PRIMARY KEY (comments_Num)
);


CREATE TABLE imgBoard
(
	img_num number(20) NOT NULL,
	band_num number(20) NOT NULL,
	board_num number(20) NOT NULL,
	img_url varchar2(100) NOT NULL,
	img_regdate date NOT NULL,
	img_states number(3) NOT NULL,
	PRIMARY KEY (img_num)
);

drop table tmp_imgboard;
CREATE TABLE tmp_imgboard(
    tmp_num number(20) NOT NULL,
    userband_num number(20) NOT NULL,
    tmpimg_url varchar2(100) NOT NULL,
    tmp_state number(5),
    PRIMARY KEY (tmp_num)
);

CREATE TABLE login
(
	login_num number(20) NOT NULL,
	login_id varchar2(50) NOT NULL UNIQUE,
	login_pwd varchar2(30) NOT NULL,
	login_date date NOT NULL,
	login_state number(3) NOT NULL,
	PRIMARY KEY (login_num)
);


CREATE TABLE scategory
(
	scategoryNum number(5) NOT NULL,
	bcategoryNum number(3) NOT NULL,
	category_stitle varchar2(1000) NOT NULL,
	PRIMARY KEY (scategoryNum)
);


CREATE TABLE tagindex
(
	tagindexnum number(20) NOT NULL,
	tag_num number(20) NOT NULL,
	board_num number(20) NOT NULL UNIQUE,
	band_num number(20) NOT NULL,
	PRIMARY KEY (tagindexnum)
);


CREATE TABLE tag_name
(
	tag_num number(20) NOT NULL,
	tag_contnet varchar2(40) NOT NULL,
	tag_represent number(3),
	PRIMARY KEY (tag_num)
);


CREATE TABLE Userinfo
(
	login_num number(20) NOT NULL,
	user_name varchar2(20) NOT NULL,
	user_phone varchar2(12),
	user_email varchar2(50),
	user_gender varchar2(3) NOT NULL,
	user_quiz varchar2(60) NOT NULL,
	user_answer varchar2(60) NOT NULL,
    user_img blob,
	user_birth date NOT NULL,
	PRIMARY KEY (login_num)
);

insert into bcategory values(1,'ģ��/����','MakingBand/category/1.png');
insert into bcategory values(2,'���','MakingBand/category/2.png');
insert into bcategory values(3,'�ݷ�����/����','MakingBand/category/3.png');
insert into bcategory values(4,'�м�/��Ƽ','MakingBand/category/4.png');
insert into bcategory values(5,'��ȭ����','MakingBand/category/5.png');
insert into bcategory values(6,'����','MakingBand/category/6.png');
insert into bcategory values(7,'���/�ڰ���','MakingBand/category/7.png');
insert into bcategory values(8,'����/����','MakingBand/category/8.png');
insert into bcategory values(9,'��ȭ/����','MakingBand/category/9.png');
insert into bcategory values(10,'����/�丮','MakingBand/category/10.png');
insert into bcategory values(11,'�ڿ�/�ͳ�','MakingBand/category/11.png');
insert into bcategory values(12,'����/�Ƿ�����','MakingBand/category/12.png');
insert into bcategory values(13,'������/����','MakingBand/category/13.png');
insert into bcategory values(14,'���/����','MakingBand/category/14.png');
insert into bcategory values(15,'����','MakingBand/category/15.png');
insert into bcategory values(16,'����/����','MakingBand/category/16.png');
insert into bcategory values(17,'�ǰ�/���̾�Ʈ','MakingBand/category/17.png');
insert into bcategory values(18,'�ִϸ��̼�','MakingBand/category/18.png');
insert into bcategory values(19,'��ġ/��ȸ','MakingBand/category/19.png');
insert into bcategory values(20,'�ι�/����','MakingBand/category/20.png');
insert into bcategory values(21,'�ϻ�/�̾߱�','MakingBand/category/21.png');
insert into bcategory values(22,'����/���ױ�','MakingBand/category/22.png');
insert into bcategory values(23,'��Ŭ��','MakingBand/category/23.png');
insert into bcategory values(24,'����/�ܱ���','MakingBand/category/24.png');
insert into bcategory values(25,'IT/��ǻ��','MakingBand/category/25.png');
insert into bcategory values(26,'����/ķ��','MakingBand/category/26.png');

INSERT INTO SCATEGORY VALUES(1,3,'�����');
INSERT INTO SCATEGORY VALUES(2,3,'������');
INSERT INTO SCATEGORY VALUES(3,3,'������ȣ');

INSERT INTO SCATEGORY VALUES(4,17,'���̾�Ʈ');
INSERT INTO SCATEGORY VALUES(5,17,'�ǰ�����');
INSERT INTO SCATEGORY VALUES(6,17,'��Ʈ�Ͻ�');

insert into bandimg values(1,'MakingBand/bandcover/1.jpg');
insert into bandimg values(2,'MakingBand/bandcover/2.jpg');
insert into bandimg values(3,'MakingBand/bandcover/3.jpg');
insert into bandimg values(4,'MakingBand/bandcover/4.jpg');
insert into bandimg values(5,'MakingBand/bandcover/5.jpg');
insert into bandimg values(6,'MakingBand/bandcover/6.jpg');
insert into bandimg values(7,'MakingBand/bandcover/7.jpg');
insert into bandimg values(8,'MakingBand/bandcover/8.jpg');
insert into bandimg values(9,'MakingBand/bandcover/9.jpg');
insert into bandimg values(10,'MakingBand/bandcover/10.jpg');
insert into bandimg values(11,'MakingBand/bandcover/11.jpg');
insert into bandimg values(12,'MakingBand/bandcover/12.jpg');
insert into bandimg values(13,'MakingBand/bandcover/13.jpg');
insert into bandimg values(14,'MakingBand/bandcover/14.jpg');
insert into bandimg values(15,'MakingBand/bandcover/15.jpg');
insert into bandimg values(16,'MakingBand/bandcover/16.jpg');

commit;

alter table userinfo
    add foreign key (login_num)
    references login (login_num);