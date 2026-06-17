-- 1. 게시글 목록 조회 (작성자 이름, 댓글 수 포함, 최신 등록순 정렬)
SELECT p.id, m.name, p.view_count, COUNT(r.id) reply_count, p.created_at, p.title
FROM post p
LEFT JOIN MEMBER m ON p.member_id = m.id
LEFT JOIN reply r ON p.id = r.post_id
GROUP BY p.id, p.title, m.name, p.view_count, p.created_at
ORDER BY p.created_at DESC;

-- 작성한지 24시간 이내의 게시글 제목 앞에 (New) 추가
-- 댓글이 3개 이상 달린 게시글 제목 앞에 (Best) 추가
SELECT p.id, m.name, p.view_count, COUNT(r.id) reply_count, p.created_at, 
	CONCAT(
		CASE WHEN p.created_at >= DATE_SUB(NOW(), INTERVAL 1 DAY) THEN '(New) ' ELSE '' END,
		CASE WHEN COUNT(r.id) >= 3 THEN '(Best) ' ELSE '' END,
		p.title
	) title
FROM post p
LEFT JOIN MEMBER m ON p.member_id = m.id
LEFT JOIN reply r ON p.id = r.post_id
GROUP BY p.id, p.title, m.name, p.view_count, p.created_at
ORDER BY p.created_at DESC;

-- 2. 게시글 상세 조회 (게시글 제목, 내용, 작성자 이름, 이메일, 댓글 작성자 이름, 댓글 내용 조회)
SELECT
  p.title,
  p.content,
  m.name writer_name,
  m.email writer_email,
  rm.name reply_writer_name,
  r.content reply_content
FROM post p
LEFT JOIN member m ON p.member_id = m.id
LEFT JOIN reply r ON p.id = r.post_id
LEFT JOIN member rm ON r.member_id = rm.id
WHERE p.id = 1
ORDER BY r.created_at DESC;

-- 3. 게시글 등록 (새로운 게시글 작성)
INSERT INTO post (member_id, title, content)
VALUES (1, '새로운 게시글 제목', '새로운 게시글 내용입니다.');

-- 4. 게시글 수정 (2번 게시글의 제목과 내용 변경)
UPDATE post
SET title = '수정된 제목', content = '수정된 내용입니다.'
WHERE id = 2;

-- 5. 게시글 삭제 (3번에서 등록한 게시글 삭제)
DELETE FROM post
WHERE id = 21;

-- 6. 게시글 검색 (제목 또는 내용에 '자바'가 포함된 게시글 조회)
SELECT p.id, m.name, p.view_count, COUNT(r.id) reply_count, p.created_at, 
	CONCAT(
		CASE WHEN p.created_at >= DATE_SUB(NOW(), INTERVAL 1 DAY) THEN '(New) ' ELSE '' END,
		CASE WHEN COUNT(r.id) >= 3 THEN '(Best) ' ELSE '' END,
		p.title
	) title
FROM post p
LEFT JOIN MEMBER m ON p.member_id = m.id
LEFT JOIN reply r ON p.id = r.post_id
WHERE p.title LIKE '%자바%' OR p.content LIKE '%자바%'
GROUP BY p.id, p.title, m.name, p.view_count, p.created_at
ORDER BY p.created_at DESC;

-- 7. 게시글 페이징 조회 (최신순으로 2페이지 분량의 게시글 10건 조회)
SELECT p.id, m.name, p.view_count, COUNT(r.id) reply_count, p.created_at, 
	CONCAT(
		CASE WHEN p.created_at >= DATE_SUB(NOW(), INTERVAL 1 DAY) THEN '(New) ' ELSE '' END,
		CASE WHEN COUNT(r.id) >= 3 THEN '(Best) ' ELSE '' END,
		p.title
	) title
FROM post p
LEFT JOIN MEMBER m ON p.member_id = m.id
LEFT JOIN reply r ON p.id = r.post_id
GROUP BY p.id, p.title, m.name, p.view_count, p.created_at
ORDER BY p.created_at DESC
LIMIT 10 OFFSET 10;
-- LIMIT 10;




















