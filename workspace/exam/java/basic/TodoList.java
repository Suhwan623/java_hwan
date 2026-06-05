package workspace.exam.java.basic;

public class TodoList {
    // 1. 할 일 목록 배열을 전달받아 전체 할 일 개수를 반환하는 메서드
    int getTodoCount(String[] list) {
        return list.length;
    }

    // 2. 할 일 목록 배열을 전달받아 번호와 함께 목록을 출력하는 메서드
    void printTodoList(String[] list) {
        for (int i = 0; i < list.length; i++) {
            System.out.println((i + 1) + ". " + list[i]);
        }
    }

    void main() {
        // 3. 문자열 배열 변수 todayTodoList 선언
    String  [] todayTodoList;
        // 4. 문자열 배열 생성 및 할 일 목록 초기화
        todayTodoList = new String[] {"자바 공부하기", "운동하기", "독서하기"};

        // 5. 전체 할 일 개수를 가져오는 메서드 호출
        int count = getTodoCount(todayTodoList);
        System.out.println("오늘의 할 일 개수: " + (count)+ "개");
        System.out.println("오늘의 할 일 목록");
        System.out.println("----------------");

        // 6. 할 일 목록을 출력하는 메서드 호출
        printTodoList(todayTodoList);

        System.out.println(); // 한 줄 개행

        // 5개짜리 내일의 할 일 목록 생성 및 출력
        String[] tomorrowTodoList = {"마트가기", "청소하기", "우편물찾기", "부모님께 전화하기", "저녁식사 준비하기"};
        count = getTodoCount(tomorrowTodoList);
        System.out.println("내일의 할 일 개수: " + (count) + "개");
        System.out.println("내일의 할 일 목록");
        System.out.println("----------------");
        printTodoList(tomorrowTodoList);
    }
}