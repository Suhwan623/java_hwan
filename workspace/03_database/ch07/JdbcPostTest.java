package ch07;

public class JdbcPostTest {
    public static void main(String[] args){
        findAll();
        insert(2, "2번이 등록한 게시글", "안녕하세요. 자바 공부 해요.");
        findById(10);
        update(10, "수정된 10번 게시글", "수정했어요");
        findAll();
        delete(10);
        findAll();
    }

    // 등록(C)
    static void insert(int memberId, String title, String content){

    }

    // 목록 조회(R)
    static void findAll(){

    }

    // 한건 조회(R)
    static void findById(int id){

    }

    // 수정(U)
    static void update(int id, String title, String content){

    }

    // 삭제(D)
    static void delete(int id){

    }

}
