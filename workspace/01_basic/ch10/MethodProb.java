package workspace.ch10;

public class MethodProb {

    static int Sum(int[] scores) {
        int sum  = 0;

        for(int i = 0; i < scores.length; i++) {
            sum += scores[i];
        }

        return sum;
    }

    static double Avg(int[] scores) {
        int sum = Sum(scores);

        return (double)sum / (double)scores.length;
    }

    static void PrintScore(int[] scores) {
        int sum = Sum(scores);
        double avg = Avg(scores);

        System.out.println("총점" + ":" +  sum);
        System.out.println("평균" + ":" + avg);
    }

    static void PrintAllScore(int[] scores) {
        int sum = Sum(scores);
        double avg = Avg(scores);
    }

    public static void main (String[] args) {
        int [] haruScore = {80, 70, 56};
        int [] namuScore = {90, 77, 80};
        int [] brongScore = {100, 99, 88};

        PrintScore(haruScore);
        PrintScore(namuScore);
        PrintScore(brongScore);
    }
}
