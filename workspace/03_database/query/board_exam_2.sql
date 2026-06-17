-- 1. 게시글 목록 조회 (작성자 이름, 댓글 수 포함, 최신 등록순 정렬)
-- 작성한지 24시간 이내의 게시글 제목 앞에 (New) 추가
-- 댓글이 3개 이상 달린 게시글 제목 앞에 (Best) 추가
SELECT p.id, m.name,
CASE 
	WHEN p.created_at >= DATE_SUB(NOW(), INTERVAL 24 HOUR) THEN CONCAT('(NEW)',title) -- AS new_title
	WHEN COUNT(r.id) >= 3 THEN CONCAT('(BEST)',title) -- AS best_title
	ELSE title
END AS title,
p.created_at,
count(r.id) as 댓글수
FROM post p
LEFT JOIN member m on p.member_id = m.id
LEFT JOIN reply r on p.id = r.post_id
GROUP BY p.id, p.title, p.created_at, m.name
ORDER BY p.created_at DESC;



-- 2. 게시글 상세 조회 (게시글 제목, 내용, 작성자 이름, 이메일, 댓글 작성자 이름, 댓글 내용 조회)
select * from member;
select * from post;
select * from reply;

select p.id, p.title as '게시글 제목', p.content as '내용', m1.name as '작성자 이름', m1.email as 이메일, m2.name as 댓글작성자 , r.content as '댓글내용'
from post p
inner join reply as r on p.id = r.post_id 
INNER join member as m1 on p.member_id  = m1.id  -- 작성자 이름을 위한 조인
INNER join member as m2 on r.member_id  = m2.id; -- 댓글 작성자 이름을 위한 조인

-- 3. 게시글 등록 (새로운 게시글 작성)
insert into post(member_id, title, content, created_at, view_count) values
(1, '지금부터 데이터 베이스 시작합니다.', '아 머리가 복잡하네요', '2026-06-11 09:00:00', 17);
insert into reply(post_id, member_id, content, created_at) VALUES
(21, 1, '저도 이해합니다 조금만 힘내봐요~','2026-06-11 10:00:00');
select * from post;
select * from reply;
-- 4. 게시글 수정 (2번 게시글의 제목과 내용 변경)
update post  -- 추가한
set title = '자바 시작한지 일주일',
	content = '머리가 점점 아파오네요'
	where id = 21;
select * from post;
-- 5. 게시글 삭제 (3번에서 등록한 게시글 삭제)
delete from post
	where id = 21;
select * from post;
select * from reply;
-- 6. 게시글 검색 (제목 또는 내용에 '자바'가 포함된 게시글 조회)
select *
from post 
where title like  '%자바%' or content like '%자바%';

-- 7. 게시글 페이징 조회 (최신순으로 2페이지 분량의 게시글 10건 조회)
select *
from post 
order by created_at desc
limit 10, 10;