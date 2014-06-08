//Sampler playing 808 hits.

// A: kick
// B: OH
// X: Crash
// Y: Tom
// RB: CH
// LB: Snare
// L-dpad: Clap
// D-dpad: Clav

0 => int device;


[ "/../DrumSamps/Snare.wav", "/../DrumSamps/Kick.wav", "/../DrumSamps/CH.wav", "/../DrumSamps/OH.wav", "/../DrumSamps/Crash.wav", "/../DrumSamps/Clap.wav", "/../DrumSamps/Tom.wav", "/../DrumSamps/Clav.wav" ] @=> string sounds[];

SndBuf s1;
SndBuf s2;
SndBuf s3;
SndBuf s4;
SndBuf s5;
SndBuf s6;
SndBuf s7;
SndBuf s8;


sounds[0] => s1.read;
sounds[1] => s2.read;
sounds[2] => s3.read;
sounds[3] => s4.read;
sounds[4] => s5.read;
sounds[5] => s6.read;
sounds[6] => s7.read;
sounds[7] => s8.read;


Hid hi;
HidMsg msg;

if( !hi.openJoystick( device ) ) me.exit();
<<< "joystick ‘" + hi.name() + "’ ready…" >>>;

while( true )
{
    hi => now;
    while( hi.recv( msg ) )
    {
        if( msg.isButtonDown() ) {
            msg.which => int base;
            <<< base >>>;
            
            if ( base == 11 ) {
               //A kick
              s2 =< dac;
               0 => s2.pos;
               s2 => dac;
               1 => s2.play;
            } else if ( base == 12) {
                //B CH
                s4 =< dac;
               0 => s4.pos;
               s4 => dac;
               1 => s4.play;
                
            } else if ( base == 13 ) {
                //X
                s5 =< dac;
               0 => s5.pos;
               s5 => dac;
               1 => s5.play;
            } else if ( base == 14) {
               //Y
               s7 =< dac;
               0 => s7.pos;
               s7 => dac;
               1 => s7.play;
            } else if ( base == 9 ) {
               //RB, OH
               
                s3 =< dac;
               0 => s3.pos;
               s3 => dac;
               1 => s3.play;
           } else if ( base == 8 ) {
               //LB, snare
               //1 => s1.play;
               s1 =< dac;
               0 => s1.pos;
               s1 => dac;
               1 => s1.play;
           } else if ( base == 6 ) {
               //L stick
               
           } else if ( base == 7 ) {
               //R stick
           } else if ( base == 1 ) {
             //  Down d-pad
             s8 =< dac;
               0 => s8.pos;
               s8 => dac;
               1 => s8.play;
           } else if ( base == 2 ) {
               //L d-pad
               s6 =< dac;
               0 => s6.pos;
               s6 => dac;
               1 => s6.play;
           } else if ( base == 3 ) {
               //R d-pad
           } else if ( base == 0 ) {
               //Up d-pad
           } else if ( base == 4 ) {
               //Start
           } else if ( base == 5 ) {
               //Select
           } else if ( base == 10 ) {
               //Center XBOX button
           }           
           
        }
        
        
    }
    
}