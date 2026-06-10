package workspace.ch14;

public class StringMethodTest {
    public static void main(String[] args) {
        String str = "Hello Java";

        // 1. length(): 문자열의 길이 조회
        System.out.println(str.length()); // 10

        // 2. charAt(): 특정 인덱스의 문자 조회
        System.out.println(str.charAt(6)); // J

        // 3. substring(): 부분 문자열 추출
        // 6번 인덱스부터 10번 인덱스 직전까지
        System.out.println(str.substring(6, 10)); // Java
        // 4번 인덱스부터 끝까지
        System.out.println(str.substring(4)); // o Java

        // 4. equals(): 문자열 내용 비교
        System.out.println(str.equals("Hello Java")); // true

        // 5. indexOf(): 특정 문자열이 시작되는 인덱스 반환
        System.out.println(str.indexOf("Java")); // 6

        // 6. replace(): 문자열 일부 치환
        System.out.println(str.replace("Java", "World")); // Hello World

        // 원본 문자열은 불변
        System.out.println(str); // Hello Java

        // 7. split(): 구분자를 기준으로 문자열 분할
        String str2 = "Hello Java Programming";
        String[] words = str2.split(" ");
        System.out.println(words[0]); // Hello
        System.out.println(words[1]); // Java
        System.out.println(words[2]); // Programming

        System.out.println(str.toLowerCase().indexOf("java".toLowerCase()));
        System.out.println(str.toLowerCase().indexOf("Java".toLowerCase()));
        System.out.println(str.toUpperCase().indexOf("jaVA".toLowerCase()));

        String str3 = "  Hello Java World  ";
        System.out.println(str3.trim());

        System.out.println(str.indexOf("Hello") == 0 ? true : false);
        System.out.println(str.startsWith("Hello"));
    }
}
