SELECT * FROM post;

SELECT * FROM member;

-- 2번 회원 탈퇴시 게시글 삭제 옵션을 선택한 경우

START TRANSACTION;

-- 2번 회원의 게시글 먼저 삭제
DELETE FROM post WHERE member_id = 2;

-- 2번 회원 삭제
DELETE FROM member WHERE id = 2;

-- 정상 완료시 DB에 반영
COMMIT;

-- 오류 발생시 원래 상태고 복구
ROLLBACK;

-- 현재 격리 수준 확인
SELECT @@transaction_isolation;


