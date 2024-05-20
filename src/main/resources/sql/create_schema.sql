# Database 생성
create database db2024;
use db2024;

# Database user 생성 + 권한 부여
# create user 'db2024'@localhost identified by 'db2024';
grant all privileges on db2024.* to 'db2024'@localhost;

# 관리자 테이블 생성
CREATE TABLE db2024_Administrator( 
    id BIGINT NOT NULL,
    password VARCHAR(20) NOT NULL,
    contact VARCHAR(20) NOT NULL,
    PRIMARY KEY(id)
);

# 사용자 테이블 생성
CREATE TABLE db2024_User(
    id BIGINT NOT NULL,
    password VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL,
    name VARCHAR(20) NOT NULL,
    major VARCHAR(20) NOT NULL,
    phone_num VARCHAR(13),
    PRIMARY KEY(id)
);

# 강의실 테이블 생성
CREATE TABLE db2024_Classroom(
    id BIGINT NOT NULL,
    admin_id BIGINT, # on delete set null에 배치 되어서 not null 삭제
    building VARCHAR(255) NOT NULL,
    room_num VARCHAR(255) NOT NULL,
    capacity INT(3) NOT NULL,
    outlets INT(3),
    mics INT(3) NOT NULL,
    projectors BOOLEAN NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (admin_id) REFERENCES db2024_Administrator(id) ON DELETE SET NULL
);

# 강의정보 테이블 생성
CREATE TABLE db2024_Course(
    course_no INT(10) NOT NULL,
    class_no INT(2) NOT NULL,
    admin_id BIGINT, # on delete set null에 배치 되어서 not null 삭제
    prof VARCHAR(20) NOT NULL,
    capacity INT(3) NOT NULL,
    day1_of_week INT(1) NOT NULL, #월~일 : 1~7
    period1 INTEGER NOT NULL,
    day2_of_week INT(1),
    period2 INTEGER,
    classroom_id BIGINT, # on delete set null에 배치 되어서 not null 삭제
    PRIMARY KEY(course_no, class_no),
    FOREIGN KEY (admin_id) REFERENCES db2024_Administrator(id) ON DELETE SET NULL,
    FOREIGN KEY (classroom_id) REFERENCES db2024_Classroom(id) ON DELETE SET NULL
);

# 예약 테이블 생성
CREATE TABLE db2024_Reservation(
	reserved_id BIGINT NOT NULL,
	classroom_id BIGINT, # on delete set null에 배치 되어서 not null 삭제
	admin_id BIGINT, # on delete set null에 배치 되어서 not null 삭제
	user_id BIGINT, # on delete set null에 배치 되어서 not null 삭제
	user_name VARCHAR(20) NOT NULL,
	purpose VARCHAR(255) NOT NULL,
	person_num INTEGER NOT NULL,
    reserve_date DATE NOT NULL,
	reserve_time INTEGER NOT NULL,
	create_date DATE NOT NULL,
	PRIMARY KEY (reserved_id),
	FOREIGN KEY (classroom_id) REFERENCES db2024_Classroom(id) ON DELETE SET NULL,
	FOREIGN KEY (admin_id) REFERENCES db2024_Classroom(admin_id) ON DELETE SET NULL,
	FOREIGN KEY (user_id) REFERENCES db2024_User(id) ON DELETE SET NULL
);