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



color white = #FFFFFF;
//
//
void setup() {
  size(500, 700);
  minim = new Minim(this);
  song[0] = minim.loadFile("Danger Snow - Dan Henig.mp3");
  
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
      song1.rewind();
      song1.play();
    } else {
      song1.play();
    }
  }//END PLAY-PAUSE BUTTON
  //
  if (key == 's' || key =='s') {
  if ( song1.isPlaying() ) {
    song1.pause();
    song1.rewind();
  } else {
    song1.rewind();
  }// END STOP BUTTON
 }
}
//
//
//
void mousePressed() {
}
