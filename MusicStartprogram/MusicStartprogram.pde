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
AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs];
int currentSong = 0;
int loopNum = 1;
//
//GUI
color white = #FFFFFF, black = #000000;
//float playButtonX, playButtonY, playButtonWidth, playButtonHeight;
//float SkipforwardButtonX, SkipforwardButtonY, SkipforwardButtonWidth, SkipforwardButtonHeight;
float button1X, button1Y, button1Width, button1Height;
float button2X, button2Y, button2Width, button2Height;
float button3X, button3Y, button3Width, button3Height;
float pt1X, pt1Y, rectWidth, rectHeight;

void setup() {
  size(500, 600);
  minim = new Minim(this);
  song[0] = minim.loadFile("Danger Snow - Dan Henig.mp3");
  song[1] = minim.loadFile("Grey Flannel - Vans in Japan.mp3");
  song[2] = minim.loadFile("Berlin at Night - Dan Henig.mp3");
  song[3] = minim.loadFile("Stoner Things.mp3");
  song[4] = minim.loadFile("Manic. No Depression. - Jeremy Korpas.mp3");
  //
  /*
  songMetaData[0] = song[0].getMetaData();
   songMetaData[1] = song[1].getMetaData();
   songMetaData[2] = song[2].getMetaData();
   songMetaData[3] = song[3].getMetaData();
   songMetaData[4] = song[4].getMetaData();
   */
  for (int i=0; i<song.length; i++) {
    songMetaData[i] = song[i].getMetaData();
  }//End Song MetaData
  //
  println("Start of Console");
  println("Click the Canvas to Finish Starting this App");
  println("Press P Play and Pause");
  println("Press S to Stop and Rewind");
  println("Press L to loop the song");
  println("Press R to skip backwards in a song");
  println("Press F to fast forward in a song");
  //VERIFYING METADATA
  //ALWAYS AVAILABLE
  println("\n\nVerifying MetaData");
  println( "File Name:", songMetaData[currentSong].fileName() );
  println( "Song Length (in minutes & seconds):", (songMetaData[currentSong].length()/1000)/60, "minutes", (songMetaData[currentSong].length()/1000)-((songMetaData[currentSong].length()/1000)/60 * 60), "seconds");
  println( "Title:", songMetaData[currentSong].title() );
  println( "Author:", songMetaData[currentSong].author() );
  println( "Composer:", songMetaData[currentSong].composer() );
  println( "Orchestra:", songMetaData[currentSong].orchestra() );
  println( "Album:", songMetaData[currentSong].album() );
  println( "Disc:", songMetaData[currentSong].disc() );
  println( "Publisher:", songMetaData[currentSong].publisher() );
  println( "Date Release:", songMetaData[currentSong].date() );
  println( "Copyright:", songMetaData[currentSong].copyright() );
  println( "Comment:", songMetaData[currentSong].comment() );
  println( "Lyrics:", songMetaData[currentSong].lyrics() );
  println( "Track:", songMetaData[currentSong].track() );
  println( "Genre:", songMetaData[currentSong].genre() );
  println( "Encoded:", songMetaData[currentSong].encoded() );//HOW A COMPUTER READS A FILE
  //
  //VARIABLE POPULATION
  /*
  playButtonX = width *1.8/4;
  playButtonY = height *2.3/3;
  playButtonWidth = width*0.5/4;
  playButtonHeight = height*0.5/4;
  //
  //
  SkipforwardButtonX = 1/2;
  SkipforwardButtonY = 1/2;
  SkipforwardButtonWidth = 1.5/4;
  SkipforwardButtonHeight = 0.5/4;
  */
  button1X = width * 1.7/4; 
  button1Y = height * 3/4; 
  button1Width = width * 2.5/6 * 2.5/6;
  button1Height = height * 2.5/6 * 2.5/6;
  //
  button2X = width * 8/12 ; 
  button2Y = height * 4.7/6 ; 
  button2Width = width * 2/6 * 2/6;
  button2Height = height * 2/6 * 2/6;
  //
  button3X = width * 3/12; 
  button3Y = height * 4.7/6; 
  button3Width = width * 2/6 * 2/6;
  button3Height = height * 2/6 * 2/6;
  //
  rectWidth = width*2.5/5;
  rectHeight = height*3/5;
  pt1X = width*2/7.55;
  pt1Y = height*2/18;
}
//
//
//
void draw() {
  background(black);
  fill(white);
  /*
  rect(playButtonX, playButtonY, playButtonWidth, playButtonHeight);
  
  //fill();
  rect(SkipforwardButtonX, SkipforwardButtonY, SkipforwardButtonWidth, SkipforwardButtonHeight);
  */
  rect(button1X, button1Y, button1Width, button1Height);
  //
  rect(button2X, button2Y, button2Width, button2Height);
  //
  rect(button3X, button3Y, button3Width, button3Height);
  //
  rect(pt1X, pt1Y, rectWidth, rectHeight);
}
//
//
//
void keyPressed() {
  if (key == 'p' || key == 'P') {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
    } else if (song[currentSong].position() == song[currentSong].length()) {
      song[currentSong].rewind();
      song[currentSong].play();
    } else {
      song[currentSong].play();
    }
  }//END PLAY-PAUSE BUTTON
  //
  if (key == 's' || key =='S') {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
    } else {
      song[currentSong].rewind();
    }// END STOP BUTTON
  }
  //
  if ( key == 'l' || key == 'L' ) song[currentSong].loop(loopNum);
  if (key == 'f' || key == 'F') song[currentSong].skip(5000);
  if (key == 'r' || key == 'R') song[currentSong].skip(-5000);
}
//
//
//
/*
void mousePressed() {
  if (mouseX>playButtonX && mouseX<playButtonX+playButtonWidth && mouseY>playButtonY && mouseY<playButtonY+playButtonHeight) {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
    } else if (song[currentSong].position() == song[currentSong].length()) {
      song[currentSong].rewind();
      song[currentSong].play();
    } else {
      song[currentSong].play();
    }  
  }
 
}
*/
