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
    if ( song[1].isPlaying() ) {
      song[0].pause();
    } else if ( song[0].position() == song[0].length() ) {
      song[0].rewind();
      song[0].play();
    } else {
      song[0].play();
    }
  }//END PLAY-PAUSE BUTTON
  //
  if (key == 's' || key =='s') {
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
