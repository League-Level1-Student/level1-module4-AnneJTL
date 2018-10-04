public class Athlete {

    private static int count;
    private static String raceLocation = "New York";
    private static String raceStartTime = "9.00am";

    private String name;
    private int speed;
    private int bibNumber;

    Athlete(String name, int speed) {
        this.name = name;
        this.speed = speed;
        count++;
        this.bibNumber = count;
    }

    public static void setRaceLocation(String newLocation) {
        raceLocation = newLocation;
    }

    public static void main(String[] args) {
        //create two athletes
        Athlete athlete1 = new Athlete("First Athlete", 50);
        Athlete athlete2 = new Athlete("Second Athlete", 45);

        // print their names, bibNumbers, and the location of their race. }
        System.out.println("Name: " + athlete1.name + " - bibNumber: " + athlete1.bibNumber + " - Location: " + raceLocation);
        System.out.println("Name: " + athlete2.name + " - bibNumber: " + athlete2.bibNumber + " - Location: " + raceLocation);
        System.out.println("Number of participants: " + count);

        // After changing the location
        setRaceLocation("San Diego");
        System.out.println("Name: " + athlete1.name + " - bibNumber: " + athlete1.bibNumber + " - Location: " + raceLocation);
        System.out.println("Name: " + athlete2.name + " - bibNumber: " + athlete2.bibNumber + " - Location: " + raceLocation);
        System.out.println("Number of participants: " + count);
    }

}
