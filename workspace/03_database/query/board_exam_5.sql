-- 1. 게시글 목록 조회 (작성자 이름, 댓글 수 포함, 최신 등록순 정렬)
-- 작성한지 24시간 이내의 게시글 제목 앞에 (New) 추가
-- 댓글이 3개 이상 달린 게시글 제목 앞에 (Best) 추가

SELECT p.id, m.name, 
	CONCAT(
		CASE WHEN p.created_at >= DATE_SUB(NOW(), INTERVAL 24 HOUR) THEN '(new) ' ELSE '' END,
		CASE WHEN COUNT(r.id)>=3 THEN '(Best)' ELSE '' END,
		p.title
	) AS title,
p.content AS post_content, p.created_at, COUNT(r.id) AS reply_count
FROM post p
LEFT JOIN member m ON p.member_id = m.id
LEFT JOIN reply r ON p.id = r.post_id
GROUP BY p.id, p.title
ORDER BY created_at DESC;

-- 2. 게시글 상세 조회 (게시글 제목, 내용, 작성자 이름, 이메일, 댓글 작성자 이름, 댓글 내용 조회)
-- 2. 게시글 상세 조회 (게시글 제목, 내용, 작성자 이름, 이메일, 댓글 작성자 이름, 댓글 내용 조회)
SELECT A.id AS '게시글 번호', A.title AS '게시글 제목', A.content AS '내용', A.CREATED_AT AS '게시글 작성일', A.name AS '작성자', A.email AS '이메일', B.name AS '댓글 작성자', B.content AS '댓글 내용', B.CREATED_AT AS '댓글 작성일'
FROM(
	SELECT p.id, p.title, p.content, m.name, m.email, p.CREATED_AT
	FROM POST p 
	INNER JOIN MEMBER m -- 게시판 작성자 정보 필요해서 멤버랑 JOIN
		ON p.MEMBER_ID = m.id
) A LEFT JOIN (
	SELECT r.post_id, m.name, r.content, r.CREATED_AT
	FROM reply r 
	INNER JOIN MEMBER m -- 댓글작성자 알아야 해서 멤버랑 JOIN
		ON r.MEMBER_ID = m.id
) B ON A.id = B.POST_ID
ORDER BY A.ID ASC;

-- 3. 게시글 등록 (새로운 게시글 작성) INSERT INTO T VALUES
INSERT INTO post (member_id, title, content)
	VALUES (2, '테스트 게시글 제목입니다.', '테스트 게시글 내용입니다.');

-- 4. 게시글 수정 (2번 게시글의 제목과 내용 변경) UPDATE T SET
UPDATE post
	SET title = '수정된 제목입니다.',
		content = '수정된 내용입니다.'  
	WHERE id = 2;

-- 5. 게시글 삭제 (3번에서 등록한 게시글 삭제) DELETE FROM T
DELETE FROM post
ORDER BY id DESC
limit 1;

-- 6. 게시글 검색 (제목 또는 내용에 '자바'가 포함된 게시글 조회) LIKE
SELECT *
FROM post
WHERE title LIKE ('%자바%') OR CONTENT LIKE ('%자바%');

-- 7. 게시글 페이징 조회 (최신순으로 2페이지 분량의 게시글 10건 조회) LIMIT 10,10
SELECT *
FROM POST
ORDER BY created_at desc
LIMIT 10, 10;
