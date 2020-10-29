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
color white = #FFFFFF, black = #000000;
float button1X, button1Y, button1Width, button1Height;
float button2X, button2Y, button2Width, button2Height;
float button3X, button3Y, button3Width, button3Height;
float button4X, button4Y, button4Width, button4Height;
float button5X, button5Y, button5Width, button5Height;
float button6X, button6Y, button6Width, button6Height;
float button7X, button7Y, button7Width, button7Height;
float pt1X, pt1Y, rectWidth, rectHeight;

//space

void setup() {
  size(500, 600);
  minim = new Minim(this);
  song[0] = minim.loadFile("Danger Snow.mp3");
  song[1] = minim.loadFile("Grey Flannel.mp3");
  song[2] = minim.loadFile("Berlin at Night.mp3");
  song[3] = minim.loadFile("Stoner Things.mp3");
  song[4] = minim.loadFile("Manic. No Depression.mp3");
//space
  songMetaData[0] = song[0].getMetaData();
  songMetaData[1] = song[1].getMetaData();
  songMetaData[2] = song[2].getMetaData();
  songMetaData[3] = song[3].getMetaData();
  songMetaData[4] = song[4].getMetaData();
//space
  for (int i=0; i<song.length; i++) {
    songMetaData[i] = song[i].getMetaData();
  }//End Song MetaData
  //space
  println("Start of Console");
  println("Click the Canvas to Finish Starting this App.");
  //space
  println("Press P Play and Pause");
  println("Click the Middle most button to play.");
  //space
  println("Press S to Stop and Rewind, then P to play again");
  println("Click the Left bottom most button to Stop and rewind, then click the Middle most button to play.");
  //space
  println("Press L to loop the song");
  println("Click the Right bottom most button to loop and unloop the current track.");
  //space
  println("Press R to skip backwards in a song");
  println("Press F to fast forward in a song");
  println("Click the Left most button to go to the song previous in the list, or Click the Right most button to go to the song next in the list.");

  //space

  //VERIFYING METADATA
  //ALWAYS AVAILABLE
  println("\n\nVerifying MetaData");
  println( "File Name:", songMetaData[currentSong].fileName() );
  println( "Song Length (in minutes & seconds):", (songMetaData[currentSong].length()/1000)/60, "minutes", (songMetaData[currentSong].length()/1000)-((songMetaData[currentSong].length()/1000)/60 * 60), "seconds");
  println( "Title:", songMetaData[currentSong].title() );
  println( "Author:", songMetaData[currentSong].author() );
  println( "Album:", songMetaData[currentSong].album() );
  println( "Lyrics:", songMetaData[currentSong].lyrics() );
  println( "Track:", songMetaData[currentSong].track() );
  println( "Genre:", songMetaData[currentSong].genre() );
  println( "Encoded:", songMetaData[currentSong].encoded() );//HOW A COMPUTER READS A FILE
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
  rectWidth = width*2.5/5;
  rectHeight = height*3/5;
  pt1X = width*1.87/7.55;
  pt1Y = height*2/18;
}

//space

void draw() {
  background(black);
  fill(white);

  rect(button1X, button1Y, button1Width, button1Height);
  //
  rect(button2X, button2Y, button2Width, button2Height);
  //
  rect(button3X, button3Y, button3Width, button3Height);  
  //
  rect(pt1X, pt1Y, rectWidth, rectHeight);
  //
  rect(button4X, button4Y, button4Width, button4Height); 
  //                                                          //Change these two to circles 
  rect(button5X, button5Y, button5Width, button5Height);
  //
  rect(button6X, button6Y, button6Width, button6Height);
  //
  rect(button7X, button7Y, button7Width, button7Height);
}

//space

void keyPressed() {
}
void mousePressed() {
  if (mouseX>button1X && mouseX<button1X+button1Width && mouseY>button1Y && mouseY<button1Y+button1Height) {
    println("Song is now playing");
    println ("Song, ", "Number: "+currentSong);
    if ( song[currentSong].isPlaying() ) {
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
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].skip(15000);
    }
  }
  //
  if (mouseX>button3X && mouseX<button3X+button3Width && mouseY>button3Y && mouseY<button3Y+button3Height) {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].skip(-15000);
    }
  }
  //
  if (mouseX>button4X && mouseX<button4X+button4Width && mouseY>button4Y && mouseY<button4Y+button4Height) {
    println("Song has now stopped and rewound.");
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
        println ("Current Song after pressing the next or back button, Now playing next song, ", "Number: " + currentSong); //For Debugging
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
        println ("Current Song after pressing the next or back button, Now playing previous song", "\tNumber: "+currentSong); //For Debugging
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
        println ("Current Song after pressing the next or back button, Now playing previous song, ", "Number: " + currentSong); //For Debugging
      }
    }
  }
}
