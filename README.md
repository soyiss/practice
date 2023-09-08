# practice1
### 쇼핑몰 회원관리 프로그램






📌회원 테이블 생성

    Create table member_tbl(

        custno number(6) not null,
        custname varchar2(20),
        phone varchar2(13),
        address varchar2(60),
        joindate date,
        grade char(1),
        city char(2),
        primary key(custno)

    );

📌회원 매출 테이블 생성

    create table money_tbl(
        
        custno number(6) not null,
        salenol number(8) not null,
        pcost number(8),
        amount number(4),
        price number(8),
        pcode varchar2(4),
        sdate date,
        primary key(custno, salenol)

    );
    

📌회원 데이터 저장


        insert into member_tbl values(100001, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01');   
        insert into member_tbl values(100002, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151206', 'B', '01');   
        insert into member_tbl values(100003, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '20151001', 'B', '30');   
        insert into member_tbl values(100004, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도2리', '20151103', 'A', '30');   
        insert into member_tbl values(100005, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151225', 'B', '60');   
        insert into member_tbl values(100006, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C', '60');


    
📌회원 매출 데이터 저장 
        
        insert into money_tbl values(100001, 20160001, 500, 5, 2500, 'A001', '20160101');    
        insert into money_tbl values(100001, 20160002, 1000, 4, 4000, 'A002', '20160101');    
        insert into money_tbl values(100001, 20160003, 500, 3, 1500, 'A008', '20160101');    
        insert into money_tbl values(100002, 20160004, 2000, 1, 2000, 'A004', '20160102');    
        insert into money_tbl values(100002, 20160005, 500, 1, 500, 'A001', '20160103');    
        insert into money_tbl values(100003, 20160006, 1500, 2, 3000, 'A003', '20160103');    
        insert into money_tbl values(100004, 20160007, 500, 2, 1000, 'A001', '20160104');   
        insert into money_tbl values(100004, 20160008, 300, 1, 300, 'A005', '20160104');    
        insert into money_tbl values(100004, 20160009, 600, 1, 600, 'A006', '20160104');    
        insert into money_tbl values(100004, 20160010, 3000, 1, 3000, 'A007', '20160106');

        commit;
      

📌테이블 조회

        select * from member_tbl;
        select * from money_tbl;


        -- 회원번호 자동생성 방법
        select max(custno)+1 custno from member_tbl;

        -- 회원매출조회에서 조회순서는 매출이 높은순(매출이 없는 회원은 조회되지 않음)
        -- 매출은 내가 산 가격의 총 합(회원번호 별로 총합이니까 조건을 걸어주자)
        -- group by는 회원별로 매출을 찍을거여서 me.custno여도되고 mo.custno여도된다.
        -- group by와 select절은 반드시 일치 해야된다. 그래서 group by 뒤에 select절에 쓴것 처럼
        -- 다 써주면된다( 함수는 안써도됨)
        
        select me.custno, me.custname, me.grade, sum(mo.price) from member_tbl me, money_tbl mo where me.custno = mo.custno group by me.custno, me.custname, me.grade order by sum(mo.price) desc;

        
