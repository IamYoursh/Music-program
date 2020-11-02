import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global Variables
Minim minim;
int numberOfSongs = 5;
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
int currentSong = numberOfSongs - numberOfSongs;
AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs];
int loopNum = 1;
//
//GUI
color white = #FFFFFF, black = #000000, Dash=#626262, Red=#9D0000, lightRed=#FF0000, Green=#1C8621, lightGreen=#3AFF31, Blue=#001D83, lightBlue=#1A1FFF, lightGray=#B4B4B4, Gray=#8E8E8E;
float button1X, button1Y, button1Width, button1Height;
float button2X, button2Y, button2Width, button2Height;
float button3X, button3Y, button3Width, button3Height;
float button4X, button4Y, button4Width, button4Height;
float button5X, button5Y, button5Width, button5Height;
float button6X, button6Y, button6Width, button6Height;
float button7X, button7Y, button7Width, button7Height;
//
float Triangle1X, Triangle1Y, Triangle2X, Triangle2Y, Triangle3X, Triangle3Y;
//
float TrianglE1X, TrianglE1Y, TrianglE2X, TrianglE2Y, TrianglE3X, TrianglE3Y;
float Triangl31X, Triangl31Y, Triangl32X, Triangl32Y, Triangl33X, Triangl33Y;
float triangl31X, triangl31Y, triangl32X, triangl32Y, triangl33X, triangl33Y;
float trianglE1X, trianglE1Y, trianglE2X, trianglE2Y, trianglE3X, trianglE3Y;
float tRianglE1X, tRianglE1Y, tRianglE2X, tRianglE2Y, tRianglE3X, tRianglE3Y;
float tRiangl31X, tRiangl31Y, tRiangl32X, tRiangl32Y, tRiangl33X, tRiangl33Y;
//
float EllipseX, EllipseY, Ellipsewidth, Ellipseheight;
float ptS1X, pt1SY, rectSWidth, rectSHeight;
float pt1X, pt1Y, rectWidth, rectHeight;
PFont titleFont;

  //space

void setup() {
  size(500, 600);
  minim = new Minim(this);
  song[0] = minim.loadFile("Danger_Snow.mp3");
  song[1] = minim.loadFile("Grey_Flannel.mp3");
  song[2] = minim.loadFile("Berlin_at_Night.mp3");
  song[3] = minim.loadFile("Stoner_Things.mp3");
  song[4] = minim.loadFile("Manic_No_Depression.mp3");
  
  //space
  
  songMetaData[0] = song[0].getMetaData();
  songMetaData[1] = song[1].getMetaData();
  songMetaData[2] = song[2].getMetaData();
  songMetaData[3] = song[3].getMetaData();
  songMetaData[4] = song[4].getMetaData();
  
  //space
 
  int currentSong = 0;
  for (int i=0; i<song.length; i++) {
    songMetaData[i] = song[i].getMetaData();
  }//End Song MetaData
  
  //space
  
  println("Start of Console");
  println("Click the Canvas to Finish Starting this App.");
  //space
  println("Click the Middle most button to play.");
  //space
  println("Click the inner left or right buttons to skip forwards or backwards 15 seconds in a song.");
  //space
  println("Click the Left bottom most button to Stop and rewind, then click the Middle most button to play.");
  //space
  println("Click the Right bottom most button to loop and unloop the current track.");
  //space
  println("Click the Left most button to go to the song previous in the list, or Click the Right most button to go to the song next in the list.");
  
  //space
  
  titleFont = createFont ("High Tower Text", 15); //Must also Tools / Create Font / Find Font / Do Not Press "OK"
  
  //space

  //VERIFYING METADATA
  //ALWAYS AVAILABLE
  println("\n\nVerifying MetaData");
  println( "File Name:", songMetaData[currentSong].fileName() );
  println( "Song Length (in minutes & seconds):", (songMetaData[currentSong].length()/1000)/60, "minutes", (songMetaData[currentSong].length()/1000)-((songMetaData[currentSong].length()/1000)/60 * 60), "seconds");
  println( "Title:", songMetaData[currentSong].title() );
  println( "Genre:", songMetaData[currentSong].genre() );
  //
//VARIABLE POPULATION

  //space

  button1X = width * 1.64/4; 
  button1Y = height * 3/4; 
  button1Width = width * 2.5/6 * 2.5/6;
  button1Height = height * 2.5/6 * 2.5/6;
  //
  button2X = width * 8/12 ; 
  button2Y = height * 4.7/6 ; 
  button2Width = width * 2/6 * 2/6;
  button2Height = height * 2/6 * 2/6;
  //
  button3X = width * 2.57/12; 
  button3Y = height * 4.7/6; 
  button3Width = width * 2/6 * 2/6;
  button3Height = height * 2/6 * 2/6;
  //
  button4X = width * 0.94/4; 
  button4Y = height * 5.5/6; 
  button4Width = width * 1.6/6 * 1.6/6;
  button4Height = height * 1.45/6 * 1.45/6;
  //
  button5X = width * 2.75/4; 
  button5Y = height * 5.5/6; 
  button5Width = width * 1.6/6 * 1.6/6;
  button5Height = height * 1.45/6 * 1.45/6;
  //
  button6X = width * 0.46/4; 
  button6Y = height * 4.83/6; 
  button6Width = width * 1.6/6 * 1.6/6;
  button6Height = height * 1.6/6 * 1.6/6;
  //
  button7X = width * 4.83/6; 
  button7Y = height * 4.83/6; 
  button7Width = width * 1.6/6 * 1.6/6;
  button7Height = height * 1.6/6 * 1.6/6;
  //
  Triangle1X = width * 1.8/4;
  Triangle1Y = height * 4.7/6;
  Triangle2X = width * 1.8/4;
  Triangle2Y = height * 5.35/6;
  Triangle3X = width * 3.35/6;
  Triangle3Y = height * 5/6;
  
  //space
  
  TrianglE1X = width * 2.75/4;
  TrianglE1Y = height * 4.81/6;
  TrianglE2X = width * 2.75/4;
  TrianglE2Y = height * 5.21/6;
  TrianglE3X = width * 4.4/6;
  TrianglE3Y = height * 5/6;
  //
  Triangl31X = width * 2.85/4;
  Triangl31Y = height * 4.81/6;
  Triangl32X = width * 2.85/4;
  Triangl32Y = height * 5.21/6;
  Triangl33X = width * 4.55/6;
  Triangl33Y = height * 5/6;
  //
  triangl31X = width * 1.23/4;
  triangl31Y = height * 4.81/6;
  triangl32X = width * 1.23/4; 
  triangl32Y = height * 5.21/6;
  triangl33X = width * 1.5/6;
  triangl33Y = height * 5/6;
  //
  trianglE1X = width * 1.12/4;
  trianglE1Y = height * 4.81/6; 
  trianglE2X = width * 1.12/4;
  trianglE2Y = height * 5.21/6;
  trianglE3X = width * 1.39/6;
  trianglE3Y = height * 5/6;
  //
  tRianglE1X = width ;
  tRianglE1Y = height ;
  tRianglE2X = width ;
  tRianglE2Y = height ;
  tRianglE3X = width ;
  tRianglE3Y = height ;
  //
  tRiangl31X = width ;
  tRiangl31Y = height ;
  tRiangl32X = width ;
  tRiangl32Y = height ;
  tRiangl33X = width ;
  tRiangl33Y = height ;
  
  //space
  
  Ellipsewidth = width * 0.3/6;
  Ellipseheight = height * 0.25/6;
  EllipseX = width * 4.34/6;
  EllipseY = height * 5.68/6;
  //
  rectSWidth = width * 0.24/5;
  rectSHeight = height * 0.12/3;
  ptS1X = width * 1.48/6;
  pt1SY = height * 5.56/6;
  //
  rectWidth = width*2.5/5;
  rectHeight = height*3/5;
  pt1X = width*1.87/7.55;
  pt1Y = height*2/18;
}

//space

void draw() {
  background(Dash);
  fill(white);
  if(mouseX>button1X && mouseX<button1X+button1Width && mouseY>button1Y && mouseY<button1Y+button1Height) {
    fill(lightGreen);
  rect(button1X, button1Y, button1Width, button1Height);
  } else {
    fill(Gray);
  rect(button1X, button1Y, button1Width, button1Height);
  }
  //
  if(mouseX>button2X && mouseX<button2X+button2Width && mouseY>button2Y && mouseY<button2Y+button2Height) {
    fill(lightGray);
  rect(button2X, button2Y, button2Width, button2Height);
  } else {
    fill(Gray);
  rect(button2X, button2Y, button2Width, button2Height);
  }
  //
  if(mouseX>button3X && mouseX<button3X+button3Width && mouseY>button3Y && mouseY<button3Y+button3Height) {
    fill(lightGray);
  rect(button3X, button3Y, button3Width, button3Height);
  } else {
    fill(Gray);
  rect(button3X, button3Y, button3Width, button3Height);
  }
  //
  if(mouseX>button4X && mouseX<button4X+button4Width && mouseY>button4Y && mouseY<button4Y+button4Height) {
    fill(lightRed);
  rect(button4X, button4Y, button4Width, button4Height);
  } else {
    fill(Gray);
  rect(button4X, button4Y, button4Width, button4Height);
  }
  //
  if(mouseX>button5X && mouseX<button5X+button5Width && mouseY>button5Y && mouseY<button5Y+button5Height) {
    fill(lightBlue);
  rect(button5X, button5Y, button5Width, button5Height);
  //
  rect(button6X, button6Y, button6Width, button6Height);
  //
  rect(button7X, button7Y, button7Width, button7Height);
  //
  fill(white); 
  //
  rect(pt1X, pt1Y, rectWidth, rectHeight); 
  //
  fill(Green);
  triangle(Triangle1X, Triangle1Y, Triangle2X, Triangle2Y, Triangle3X, Triangle3Y);
  //
  fill(black);
  triangle(TrianglE1X, TrianglE1Y, TrianglE2X, TrianglE2Y, TrianglE3X, TrianglE3Y);
  //
  triangle(Triangl31X, Triangl31Y, Triangl32X, Triangl32Y, Triangl33X, Triangl33Y);
  //
  triangle(triangl31X, triangl31Y, triangl32X, triangl32Y, triangl33X, triangl33Y);
  //
  triangle(trianglE1X, trianglE1Y, trianglE2X, trianglE2Y, trianglE3X, trianglE3Y);
  //
  fill(white);
  triangle(tRianglE1X, tRianglE1Y, tRianglE2X, tRianglE2Y, tRianglE3X, tRianglE3Y);
  //
  triangle(tRiangl31X, tRiangl31Y, tRiangl32X, tRiangl32Y, tRiangl33X, tRiangl33Y);
  //
  fill(Red);
  rect(ptS1X, pt1SY, rectSWidth, rectSHeight);
  //
  fill(Blue);
  ellipse(EllipseX, EllipseY, Ellipsewidth, Ellipseheight);
  //space
  
  fill(lightGray);
  rect(width*0.99/4, height*0, width*1/2, height*1/10);
  fill(black); //Ink, hexidecimal copied from Color Selector
  textAlign (CENTER, CENTER); //Align X&Y, see Processing.org / Reference
  //Values: [LEFT | CENTER | RIGHT] & [TOP | CENTER | BOTTOM | BASELINE]
  textFont(titleFont, 25); //Change the number until it fits, largest font size
  text(songMetaData[currentSong].title(), width*1/4, height*0, width*1/2, height*1/10);
  fill(255); //Reset to white for rest of the program
}

//space

void keyPressed() {
}

//space

void mousePressed() {
  if (mouseX>button1X && mouseX<button1X+button1Width && mouseY>button1Y && mouseY<button1Y+button1Height) {
      println("Song is now playing.");
      println ("Song, ", "Number: "+currentSong);
    if ( song[currentSong].isPlaying() ) {
      println("Song is now paused.");
      song[currentSong].pause();
    } else if (song[currentSong].position() == song[currentSong].length()) {
      song[currentSong].rewind();
      song[currentSong].play();
    } else {
      song[currentSong].play();
    }
  }
  //
  if (mouseX>button2X && mouseX<button2X+button2Width && mouseY>button2Y && mouseY<button2Y+button2Height) {
      println("Skipped 15 seconds forward.");
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].skip(15000);
    }
  }
  //
  if (mouseX>button3X && mouseX<button3X+button3Width && mouseY>button3Y && mouseY<button3Y+button3Height) {
      println("Skipped 15 seconds backward.");
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].skip(-15000);
    }
  }
  //
  if (mouseX>button4X && mouseX<button4X+button4Width && mouseY>button4Y && mouseY<button4Y+button4Height) {
      println("Song has now stopped and rewound.");
      println("Press play to continue.");
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
    } else {
      song[currentSong].rewind();
    }
  }
  //
  if (mouseX>button5X && mouseX<button5X+button5Width && mouseY>button5Y && mouseY<button5Y+button5Height) {
    song[currentSong].loop(loopNum);
      println("Song will now loop.");
  }
  //
  if (mouseX>button7X && mouseX<button7X+button7Width && mouseY>button7Y && mouseY<button7Y+button7Height) { //Next Button to Console
    if (song[currentSong].isPlaying()) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - 1 ) {
        println ("Current Song is the last song, ", "Number: " + currentSong); //For Debugging
        currentSong = numberOfSongs - numberOfSongs;
        println ("Current Song is now the first song, ", "Number: " + currentSong); //For Debugging
      } else {
        currentSong += 1; // Equivalent code: currentSong = currentSong + 1
        println ("Current Song after pressing the next or back button, Now playing next song.", "\tNumber: "+currentSong); //For Debugging
      }
      song[currentSong].play();
    } else {
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - 1 ) {
        println ("Current Song is the last song, ", "Number: " + currentSong); //For Debugging
        currentSong = numberOfSongs - numberOfSongs;
        println ("Current Song is now the first song or song, ", "Number: " + currentSong); //For DebuggingcurrentSong = numberOfSongs - numberOfSongs;
      } else {
        currentSong += 1; // Equivalent code: currentSong = currentSong + 1
        println ("Current Song after pressing the next or back button, Now playing next song., ", "Number: " + currentSong); //For Debugging
      }
    }
  }
  //
  if (mouseX>button6X && mouseX<button6X+button6Width && mouseY>button6Y && mouseY<button6Y+button6Height) { //Next Button to Console
    if (song[currentSong].isPlaying()) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - numberOfSongs ) {
        println ("Current Song is the last song, ", "Number: " + currentSong); //For Debugging
        currentSong = numberOfSongs - 1;
        println ("Current Song is now the first song, ", "Number: " + currentSong); //For Debugging
      } else {
        currentSong -= 1; // Equivalent code: currentSong = currentSong + 1
        println ("Current Song after pressing the next or back button, Now playing previous song.", "\tNumber: "+currentSong); //For Debugging
      }
      song[currentSong].play();
    } else {
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - numberOfSongs ) {
        println ("Current Song is the last song, ", "Number: " + currentSong); //For Debugging
        currentSong = numberOfSongs - 1;
        println ("Current Song is now the first song or song, ", "Number: " + currentSong); //For DebuggingcurrentSong = numberOfSongs - numberOfSongs;
      } else {
        currentSong -= 1; // Equivalent code: currentSong = currentSong + 1
        println ("Current Song after pressing the next or back button, Now playing previous song., ", "Number: " + currentSong); //For Debugging
      }
    }
  }
}
