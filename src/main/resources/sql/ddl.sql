CREATE TABLE t_user
  (
    user_id    INTEGER NOT NULL,
    user_name  VARCHAR(50) NOT NULL,
    credits    INTEGER,
    password   VARCHAR(50) NOT NULL,
    last_visit DATE,
    last_ip    VARCHAR(50),
    CONSTRAINT PK_T_USER PRIMARY KEY(user_id)
  );
  
CREATE sequence t_user_sequence increment BY 1 start with 1000 nomaxvalue nocycle;

CREATE TRIGGER t_user_increase before
  INSERT ON t_user FOR EACH row BEGIN
  SELECT t_user_sequence.nextval INTO:New.user_id FROM dual;
END;

insert into t_user(user_name,password) values('admin','admin');

CREATE TABLE t_login_log
  (
    login_log_id INTEGER NOT NULL,
    user_name    VARCHAR(50) NOT NULL,
    user_id      INTEGER NOT NULL,
    password     VARCHAR(50) NOT NULL,
    ip           VARCHAR(50),
    login_datetime DATE,
    CONSTRAINT PK_T_LOGIN_LOG PRIMARY KEY(login_log_id)
  );

ALTER TABLE t_login_log ADD CONSTRAINT fk_t_login_log FOREIGN KEY (user_id) REFERENCES t_user (user_id);

ALTER TABLE t_user RENAME column password TO t_password;
ALTER TABLE t_login_log RENAME column password TO t_password;

很少用到foreign key ，网上找的资料研究下：

 

foreign key就是表与表之间的某种约定的关系，由于这种关系的存在，能够让表与表之间的数据，更加的完整，关连性更强。

 

二，外键维护数据完整性的5种方式　　

     1，CASCADE: 从父表删除或更新且自动删除或更新子表中匹配的行。ON DELETE CASCADE和ON UPDATE CASCADE都可用。在两个表之间，你不应定义若干在父表或子表中的同一列采取动作的ON UPDATE CASCADE子句。

　　2，SET NULL: 从父表删除或更新行，并设置子表中的外键列为NULL。如果外键列没有指定NOT NULL限定词，这就是唯一合法的。ON DELETE SET NULL和ON UPDATE SET NULL子句被支持。

　　3，NO ACTION: 在ANSI SQL-92标准中，NO ACTION意味这不采取动作，就是如果有一个相关的外键值在被参考的表里，删除或更新主要键值的企图不被允许进行（Gruber, 掌握SQL, 2000:181）。 InnoDB拒绝对父表的删除或更新操作。

　　4，RESTRICT: 拒绝对父表的删除或更新操作。NO ACTION和RESTRICT都一样，删除ON DELETE或ON UPDATE子句。（一些数据库系统有延期检查，并且NO ACTION是一个延期检查。在MySQL中，外键约束是被立即检查的，所以NO ACTION和RESTRICT是同样的）。

　　5，SET DEFAULT: 这个动作被解析程序识别，但InnoDB拒绝包含ON DELETE SET DEFAULT或ON UPDATE SET DEFAULT子句的表定义。

     ----------------------------------------------------
1、创建表
CREATE TABLE students
 (
  student_id    VARCHAR2(10) NOT NULL,
  student_name  VARCHAR2(30) NOT NULL,
  college_major VARCHAR2(15) NOT NULL,
  status        VARCHAR2(20) NOT NULL,
  state         VARCHAR2(2),
  license_no    VARCHAR2(30)
  );
2、创建主键
ALTER TABLE students
  ADD CONSTRAINT pk_students
  PRIMARY KEY (student_id) USING INDEX ;
3、创建Unique约束
ALTER TABLE students
  ADD CONSTRAINT uk_students_license
  UNIQUE (state, license_no) USING INDEX ;
4、创建Check约束
ALTER TABLE students ADD CONSTRAINT ck_students_st_lic
   CHECK ((state IS NULL AND license_no IS NULL) OR
          (state IS NOT NULL AND license_no is NOT NULL));
5、创建外键约束
ALTER TABLE students
  ADD CONSTRAINT fk_students_state
  FOREIGN KEY (state) REFERENCES state_lookup (state);