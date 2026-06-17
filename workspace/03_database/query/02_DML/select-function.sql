-- 회원 이름과 이메일을 결합해서 조회
SELECT name, email, CONCAT(name, ' (', email, ')') AS member_info
FROM MEMBER;

-- 각 회원의 이메일 바이트 크기 조회
SELECT email, LENGTH('hello'), LENGTH('안녕하세요'), LENGTH(email) AS email_length
FROM MEMBER;

-- 게시글 본문 중 '안녕하세요'가 있는 내용을 찾아서 Hi로 수정
SELECT content, REPLACE(content , '안녕하세요', 'Hi') AS replaced_content
FROM post
WHERE content LIKE '%안녕하세요%';

-- 게시글 본문의 첫 10글자만 미리보기로 가져오기(잘린 뒷부분은 ...으로 표시하세요.)
SELECT title, CONCAT(SUBSTR(title, 1, 10), '...') AS preview
FROM post;

-- 이메일을 소문자/대문자로 조회
SELECT email, LOWER(email) AS email_lower, UPPER(email) AS email_upper
FROM MEMBER;

-- 이메일 앞뒤 공백 제거
SELECT email, TRIM(email)  AS trimmed_email
FROM MEMBER;


-- 현재 날짜와 시간을 조회
SELECT NOW() AS current_datetime;

-- 게시글 작성일을 "연 월 일 요일 시 분 초"형식으로 조회
SELECT id, title, created_at, DATE_FORMAT(created_at, '%Y년 %m월 %d일 %a %H시 %i분 %s초') AS write_date
FROM post;

-- 현재 날짜만 조회
SELECT CURDATE() AS curr_date;

-- 오늘 작성된 게시글만 조회
SELECT id, title, created_at
FROM post
WHERE created_at >= CURDATE();

-- 최근 7일 이내에 가입한 회원 조회
SELECT id, name, created_at, CURDATE(), DATE_SUB(CURDATE(), INTERVAL 7 DAY) AS before_7days
FROM MEMBER
WHERE created_at >= DATE_SUB(CURDATE(), INTERVAL 7 DAY);

-- 가입한 지 1개월이 지난 회원 조회
SELECT *, DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AS before_1month
FROM MEMBER
WHERE created_at < DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- 가입한 지 35일 12시간이 지난 회원 조회
SELECT *, DATE_SUB(CURDATE(), INTERVAL '35 12' DAY_HOUR) AS before_1month
FROM MEMBER
WHERE created_at < DATE_SUB(CURDATE(), INTERVAL '35 12' DAY_HOUR);

-- 각 회원의 가입 경과일수를 조회
SELECT name, created_at, DATEDIFF(CURDATE(), created_at) AS days_since_join
FROM MEMBER;


-- 모든 회원 수 조회
SELECT count(*)
FROM MEMBER;

-- 모든 게시글 수 조회
SELECT count(*)
FROM post;

-- id=3인 회원의 총 게시글 수 조회
SELECT member_id, COUNT(*) AS total_count
FROM post
WHERE MEMBER_id = 3;

-- id=3인 회원의 모든 게시글의 조회수 조회
SELECT member_id, view_count
FROM post
WHERE MEMBER_id = 3;


-- id=3인 회원의 모든 게시글의 총 조회수
SELECT member_id, COUNT(*) AS total_counts, SUM(view_count) AS total_views, AVG(view_count) AS avg_views
	, MIN(view_count) AS min_views, MAX(view_count) AS max_views
-- 	, title
FROM post
WHERE MEMBER_id = 3;

-- 전화번호가 NULL인 회원은 '미등록'으로 표시하여 조회
SELECT name, IFNULL(phone, '미등록') AS phone
FROM member;

-- 전화번호가 NULL이면 이메일을, 이메일도 NULL이면 '연락처 없음'으로 조회
SELECT name, IFNULL(phone, IFNULL(email, '연락처 없음')) AS contact
FROM member;
SELECT name, COALESCE(phone, email, '연락처 없음') AS contact
FROM member;
SELECT name, IF(phone IS NULL, IF(email IS NULL, '연락처 없음', email), phone) AS phone_status
FROM MEMBER;

-- 전화번호 등록 여부에 따라서 상태를 다르게 표시
SELECT name, IF(phone IS NULL, '연락처 없음', '연락처 있음') AS phone_status
FROM MEMBER;

-- 가입연도가 1년이 넘었으면 '우수 회원', 1달이 넘었으면 '일반 회원', 그러지 않으면 '신규 회원'을 출력
SELECT 
	name, 
	created_at,
	CASE
		WHEN created_at < DATE_SUB(NOW(), INTERVAL 1 YEAR) THEN '우수 회원'
		WHEN created_at < DATE_SUB(NOW(), INTERVAL 1 MONTH) THEN '일반 회원'
		ELSE '신규 회원'
	END AS member_grade
FROM MEMBER;





















