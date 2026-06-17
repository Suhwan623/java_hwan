-- 1. 게시글 목록 조회 (작성자 이름, 댓글 수 포함, 최신 등록순 정렬)
-- 작성한지 24시간 이내의 게시글 제목 앞에 (New) 추가
-- 댓글이 3개 이상 달린 게시글 제목 앞에 (Best) 추가
SELECT p.id,
	CONCAT(
	    IF(p.created_at >= NOW() - INTERVAL 1 DAY, '(New) ', ''),
		IF(COUNT(r.id) >= 3, '(Best) ', ''),
		p.title
    ) AS title, 
m.name, COUNT(r.id)
FROM post p
LEFT OUTER JOIN `member` m ON p.member_id = m.id
LEFT OUTER JOIN `reply` r ON p.id = r.post_id
GROUP BY p.id, p.title, m.name	-- 이거가 제일 문제네
ORDER BY p.created_at DESC;

-- 2. 게시글 상세 조회 (게시글 제목, 내용, 작성자 이름, 이메일, 댓글 작성자 이름, 댓글 내용 조회)
SELECT 
p.title, p.content, m.name, m.email, rm.name, r.content
FROM post p
LEFT OUTER JOIN `member` m ON p.member_id = m.ID
LEFT OUTER JOIN reply r ON p.id = r.post_id
LEFT OUTER JOIN member rm ON r.member_id = rm.id

-- 3. 게시글 등록 (새로운 게시글 작성)
INSERT INTO post (member_id, title, content)
VALUES (1, "이번 과제 너무 어려워요", "1번에서부터 거의 1시간을 잡아먹었네요")

-- 4. 게시글 수정 (2번 게시글의 제목과 내용 변경)
UPDATE post
SET title = "이건 쉽지", content = "10초도 안걸림"
WHERE id = 2;

-- 5. 게시글 삭제 (3번 게시글 삭제)
DELETE FROM post WHERE id = 3;

-- 6. 게시글 검색 (제목 또는 내용에 '자바'가 포함된 게시글 조회)
SELECT id, title, content
FROM post
WHERE title LIKE "%자바%" OR content LIKE "%자바%";

-- 7. 게시글 페이징 조회 (최신순으로 2페이지 분량의 게시글 10건 조회)
SELECT id, title, content
FROM post
ORDER BY created_at DESC
LIMIT 10, 10;
