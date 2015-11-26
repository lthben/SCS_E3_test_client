/*
 Author: Benjamin Low
 
 Description: Test program emulating Flash for the bridge for SCS E3 RFID station. 
 
 Last updated: 26 Nov 2015
 */

import processing.net.*; 

Client myClient; 
String in_string;

void setup() { 
        size(200, 200); 
        // Connect to the local machine at port 5204.
        // This example will not run if you haven't
        // previously started a server on this port.
        myClient = new Client(this, "127.0.0.1", 5331);
        
        textSize(20);
} 

void draw() { 

        background(0);
      
        text("received: ", 20, 50);

        if (myClient.available() > 0) { 
                in_string = myClient.readString();
                in_string.trim();
                if (in_string != null) {
                        text(in_string, 20, 80);
                }
        }
}


void keyPressed() {
        if (key == '0') {
                myClient.write("off_all");
        } else if (key == '1') {
                myClient.write("pulse_1");
        } else if (key == '2') {
                myClient.write("pulse_2");
        } else if (key == '3') {
                myClient.write("pulse_3");
        } else if (key == '4') {
                myClient.write("wrong_1");
        } else if (key == '5') {
                myClient.write("wrong_2");
        } else if (key == '6') {
                myClient.write("wrong_3");
        } else if (key == '7') {
                myClient.write("correct_1");
        } else if (key == '8') {
                myClient.write("correct_2");
        } else if (key == '9') {
                myClient.write("correct_3");
        }        
}

