package ch12.family.ex01;

public class Son {
    String name;

    Son(String name) {
        this.name = name;
    }

    void eat() {
        System.out.println(name + ": 음식을 맛있게 먹는다");
    }

    void play() {
        System.out.println(name + ": 게임을 한다");
    }

    void sleep() {
        System.out.println(name + ": 꿀잠을 잔다");
    }
}
