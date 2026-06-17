-- 1. 게시글 목록 조회 (작성자 이름, 댓글 수 포함, 최신 등록순 정렬)
-- 작성한지 24시간 이내의 게시글 제목 앞에 (New) 추가
-- 댓글이 3개 이상 달린 게시글 제목 앞에 (Best) 추가

SELECT m.name, p.title, COUNT(r.id) AS reply_count, p.created_at
FROM post p
LEFT JOIN reply r ON r.post_id = p.id
LEFT JOIN member m ON m.id = p.member_id
GROUP BY p.id, p.title
ORDER BY p.created_at DESC;

UPDATE post
SET title = concat('(New)',title)
WHERE created_at > NOW() - INTERVAL 24 HOUR
AND title NOT LIKE '(New)%';

UPDATE post p
JOIN (
	SELECT post_id
	FROM reply
	GROUP BY post_id
	HAVING COUNT(*)>=3 
) r
ON r.post_id = p.id
SET title = concat('(Best)',title)
WHERE title NOT LIKE '(Best)%';

/*
SELECT p.id,p.title,COUNT(r.id) AS reply_count
FROM POST P 
JOIN reply r ON r.post_id = p.id
GROUP BY r.POST_ID
HAVING count(r.id)>=3;
*/

-- SELECT * FROM post;

-- 2. 게시글 상세 조회 (게시글 제목, 내용, 작성자 이름, 이메일, 댓글 작성자 이름, 댓글 내용 조회)
SELECT p.id, p.title,p.content,m1.name,m1.email,IFNULL(m2.name, '-')댓글작성자,IFNULL(r.content, '-')AS 댓글내용
FROM post p
LEFT JOIN member m1 ON m1.id = p.member_id
LEFT JOIN reply r ON r.post_id = p.id
LEFT JOIN member m2 ON m2.id = r.member_id;

-- 3. 게시글 등록 (새로운 게시글 작성)
INSERT INTO post(member_id, title, content, created_at, view_count) VALUES 
('4','dbeaver 단축키 알려주세요','dbeaver에서 대문자를 소문자로 바꾸는 단축키 알려주세요!!',NOW(),7);

-- 4. 게시글 수정 (2번 게시글의 제목과 내용 변경)
UPDATE post
SET title = '2번 게시글 제목 수정본',content = '2번 게시글 내용 수정본'
WHERE id = 2;

-- 5. 게시글 삭제 (3번 게시글 삭제)
DELETE FROM post WHERE id =3;

-- 6. 게시글 검색 (제목 또는 내용에 '자바'가 포함된 게시글 조회)
SELECT *
FROM post
WHERE title LIKE '%자바%' OR content LIKE '%자바%';  

-- 7. 게시글 페이징 조회 (최신순으로 2페이지 분량의 게시글 10건 조회)
SELECT *
FROM post
ORDER BY created_at DESC
LIMIT 10; 
 
SELECT *
FROM post
ORDER BY created_at DESC
LIMIT 10 OFFSET 10;





















