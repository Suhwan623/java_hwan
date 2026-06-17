-- 모든 게시글의 모든 컬럼 조회
SELECT * FROM post;

-- 모든 게시글의 id, member_id, title, view_count 컬럼 조회
SELECT id, member_id, title, view_count FROM post;

-- INNER JOIN
-- 모든 게시글의 id, member_id, title, view_count, 작성자이름, 작성자이메일 컬럼 조회
SELECT post.id, member_id, title, view_count, member.id, name, email
FROM post
INNER JOIN member ON post.member_id = member.id;

-- 모든 게시글의 id, member_id, title, view_count, 작성자이름, 작성자이메일 컬럼 조회(alias 사용)
SELECT p.id, p.member_id, p.title, p.view_count, m.name, m.email
FROM post p
INNER JOIN member AS m ON p.member_id = m.id;


-- 모든 댓글 조회
SELECT * FROM reply;

-- 모든 댓글의 id, content, member_id, post_id 조회
SELECT id, content, member_id, post_id FROM reply;

-- 모든 댓글의 id, content, member_id, post_id, 작성자이름, 게시글제목 조회
SELECT reply.id, reply.content, reply.member_id, reply.post_id, member.name, post.title
FROM reply
INNER JOIN member ON reply.member_id = member.id
INNER JOIN post ON reply.post_id = post.id;

-- 게시글 기준으로 정렬
SELECT post.title 게시글, reply.content 댓글, member.name '댓글 작성자'
FROM reply
INNER JOIN member ON reply.member_id = member.id
INNER JOIN post ON reply.post_id = post.id
ORDER BY post.id DESC, reply.id;


-- LEFT OUTER JOIN
-- 모든 게시글의 id, member_id, title, view_count, 작성자이름, 작성자이메일 컬럼 조회(alias 사용)
SELECT p.id, p.member_id, p.title, p.view_count, m.name, m.email
FROM post p
LEFT JOIN member AS m ON p.member_id = m.id;

-- 전체 회원 목록과 각 회원이 작성한 게시글 수를 조회하세요.(게시글을 작성하지 않은 회원도 포함되어야 함)
-- 전체 회원 목록 조회
SELECT * FROM member;
-- 필요한 컬럼만 추출
SELECT m.id, m.name, COUNT(p.id) post_count
FROM member m
LEFT JOIN post p ON m.id = p.member_id
GROUP BY m.id, m.name;

-- RIGHT OUTER JOIN
-- 모든 게시글의 id, member_id, title, view_count, 작성자이름, 작성자이메일 컬럼 조회(alias 사용)
SELECT p.id, p.member_id, p.title, p.view_count, m.name, m.email
FROM post p
RIGHT JOIN member AS m ON p.member_id = m.id;


-- 모든 게시글의 id, member_id, title, view_count, 작성자이름, 작성자이메일 컬럼 조회(alias 사용)
SELECT p.id, p.member_id, p.title, p.view_count, m.name, m.email
FROM member m
LEFT JOIN post AS p ON p.member_id = m.id;


-- FULL OUTER JOIN(MySQL은 지원하지 않으므로 UNION으로 대체 가능)
SELECT m.id AS member_id, m.name, p.title
FROM member m
LEFT JOIN post p ON m.id = p.member_id
UNION
SELECT m.id AS member_id, m.name, p.title
FROM member m
RIGHT JOIN post p ON m.id = p.member_id;



-- SELF JOIN
-- 회원명과 추천인명을 조회
SELECT m1.name 회원명, m1.recommender_id, IFNULL(m2.name, '-') 추천인명
FROM member m1
LEFT JOIN member m2 ON m1.recommender_id = m2.id; -- 모든 회원명과 추천인명을 조회
-- INNER JOIN member m2 ON m1.recommender_id = m2.id; -- 추천인이 있는 회원명과 추천인명을 조회














