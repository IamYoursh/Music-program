import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim;
int numberOfSongs = 5;
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs];

int currentSong = 0;
int loopNum = 1;

color white = #FFFFFF;
//
//
void setup() {
  size(500, 700);
  minim = new Minim(this);
  song[0] = minim.loadFile("Danger Snow - Dan Henig.mp3");
  song[1] = minim.loadFile("Grey Flannel - Vans in Japan.mp3");
  song[2] = minim.loadFile("Berlin at Night - Dan Henig.mp3");
  song[3] = minim.loadFile("Stoner Things - Patiño.mp3");
  song[4] = minim.loadFile("Manic. No Depression. - Jeremy Korpas.mp3");
  //
  /*
  songMetaData[0] = song[0].getMetaData();
  songMetaData[1] = song[1].getMetaData();
  songMetaData[2] = song[2].getMetaData();
  songMetaData[3] = song[3].getMetaData();
  songMetaData[4] = song[4].getMetaData();
  */
  for (int i=0; i<song.length ;i++) {
    songMetaData[i] = song[i].getMetaData();
  }//END SONG METADATA
  //
  println("Start of Console");
  println("Click the Canvas to Finish Starting this App");
  println("Press P Play and Pause");
  println("Press S to Stop and Rewind");
  println("Press L to loop the song");
  println("Pres R to skip backwards in a song");
  println("Pres F to fast forward in a song");
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
  println( " :", songMetaData[currentSong]. );
  println( " :", songMetaData[currentSong]. );
  println( " :", songMetaData[currentSong]. );
  println( " :", songMetaData[currentSong]. );
  println( " :", songMetaData[currentSong]. );
  println( " :", songMetaData[currentSong]. );
  println( " :", songMetaData[currentSong]. );
  println( " :", songMetaData[currentSong]. );
  println( " :", songMetaData[currentSong]. );
  println( " :", songMetaData[currentSong]. );
  println( " :", songMetaData[currentSong]. );
  println( " :", songMetaData[currentSong]. );
  println( " :", songMetaData[currentSong]. );
  println( " :", songMetaData[currentSong]. );
  
}
//
//
//
void draw() {
}
//
//
//
void keyPressed() {
  if (key == 'p' || key == 'p') {
    if ( song[0].isPlaying() ) {
      song[0].pause();
    } else if ( song[0].position() == song[0].length() ) {
      song[0].rewind();
      song[0].play();
    } else {
      song[0].play();
    }
  }//END PLAY-PAUSE BUTTON
  //
  if (key == 'S' || key =='S') {
  if ( song[0].isPlaying() ) {
    song[0].pause();
    song[0].rewind();
  } else {
    song[0].rewind();
  }// END STOP BUTTON
 }
}
//
//
//
void mousePressed() {
}
