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
int currentSong = 2;
int loopNum = 1;
//
//GUI
color white = #FFFFFF;
float playButtonX,playButtonY, playButtonWidth, playButtonHeight;

void setup() {
  size(500, 700);
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
  playButtonX = width *1/2;
  playButtonY = height *1/2;
  playButtonWidth = width*1/5;
  playButtonHeight = height*1/5;
}
//
//
//
void draw() {
  background(white);
  rect(playButtonX,playButtonY, playButtonWidth, playButtonHeight);
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
void mousePressed() {
  if (mouseX>playButtonX && mouseX<playButtonX+playButtonWidth && mouseY>playButtonY && mouseY<playButtonY+playButtonHeight) {}
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
    } else if (song[currentSong].position() == song[currentSong].length()) {
      song[currentSong].rewind();
      song[currentSong].play();
    } else {
      song[currentSong].play();
    }  
}
