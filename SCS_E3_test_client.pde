/*
 Author: Benjamin Low
 
 Description: 
 Test program emulating Flash for the bridge for SCS E3 RFID station. 
 Reader 1 is for audio. 2 is for video. 3 is for watchout.
 
 Last updated: 3 Dec 2015
 */

import processing.net.*; 

final int CLIENT_PORT = 5331; //user defined setting

Client my_client; 
String in_string, write_string;

void setup() { 
        size(200, 200); 

        my_client = new Client(this, "127.0.0.1", CLIENT_PORT);

        textSize(20);
} 

void draw() { 

        background(0);

        text("received: ", 20, 50);

        if (my_client.available() > 0) { 

                in_string = my_client.readStringUntil(10);
                in_string.trim();

                if (in_string != null && in_string.length() == 5) { //string length includes '\n'

//                        println("str len: " + in_string.length() );
                        
                        text(in_string, 20, 80);
                        my_client.write(translation_table(in_string));
                }
        }
}

String translation_table (String my_string) {

        if (my_string.charAt(1) == '1' ) { //reader 1

                if (my_string.charAt(2) == 'a') {

                        return "correct_1";
                } else if (my_string.charAt(2) == '0') {

                        return "pulse_1";
                } else {

                        return "wrong_1";
                }
        }

        if (my_string.charAt(1) == '2' ) { //reader 2

                if (my_string.charAt(2) == 'v') {

                        return "correct_2";
                } else if (my_string.charAt(2) == '0') {

                        return "pulse_2";
                } else {

                        return "wrong_2";
                }
        }

        if (my_string.charAt(1) == '3' ) { //reader 3

                if (my_string.charAt(2) == 'w') {

                        return "correct_3";
                        
                } else if (my_string.charAt(2) == '0') {

                        return "pulse_3";
                } else {

                        return "wrong_3";
                }
        }   

        return "";
}

void keyPressed() { //FOR TESTING PURPOSES ONLY
        if (key == '0') {
                my_client.write("off_all");
        } else if (key == '1') {
                my_client.write("pulse_1");
        } else if (key == '2') {
                my_client.write("pulse_2");
        } else if (key == '3') {
                my_client.write("pulse_3");
        } else if (key == '4') {
                my_client.write("wrong_1");
        } else if (key == '5') {
                my_client.write("wrong_2");
        } else if (key == '6') {
                my_client.write("wrong_3");
        } else if (key == '7') {
                my_client.write("correct_1");
        } else if (key == '8') {
                my_client.write("correct_2");
        } else if (key == '9') {
                my_client.write("correct_3");
        }
}

