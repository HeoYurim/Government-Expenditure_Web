CREATE USER U_BANK IDENTIFIED BY password;
GRANT CONNECT, RESOURCE, CREATE VIEW TO U_BANK;

CREATE TABLE B_ACCOUNTS(
	acc_id varchar2(10),
)