////////////////////////////////////////////////////////////////////////////
//                           **** ADPCM-XQ ****                           //
//                  Xtreme Quality ADPCM Encoder/Decoder                  //
//                    Copyright (c) 2018 David Bryant.                    //
//                          All Rights Reserved.                          //
//      Distributed under the BSD Software License (see license.txt)      //
////////////////////////////////////////////////////////////////////////////

While very popular at the end of the last century, ADPCM is no longer a
common audio encoding format, and is certainly not recommended as a general
purpose encoder. However, it requires minimal CPU resources for decoding,
and so still is ideally suited for certain embedded games and applications
that contain canned audio samples.

This encoder combines two different techniques to achieve higher quality
than existing ADPCM encoders while remaining fully compatible with standard
decoders. The first is dynamic noise shaping, which shifts the quantization
noise up or down in frequency based on the spectrum of the source signal.
This technique is identical to the algorithm used in WavPack's lossy mode
and can make any audible quantization noise much less annoying (or, in some
cases, inaudible).

The other technique is "lookahead" in which the encoder exhaustively
searches ahead to find the optimum coding sequence based on future samples.
This process can reduce the quantization noise from about 1 to 6 dB (depending
on the source) and also reduces or eliminates the harmonic content in the
noise that sometimes plagues ADPCM. Unfortunately, at its maximum settings
this can be very slow, but this should be relatively irrelevant if the
encoder is being used to generate canned samples.

Adpcm-xq consists of two standard C files and builds with a single command
on most platforms. It has been designed with maximum portability in mind
and should work correctly on big-endian as well as little-endian machines
(although the WAV files are always standard little-endian).

Linux:
% gcc -O2 *.c -o adpcm-xq

Darwin/Mac:
% clang -O2 *.c -o adpcm-xq

MS Visual Studio:
cl -O2 adpcm-xq.c adpcm-lib.c

Bugs:

1. Unknown RIFF chunk types are correctly parsed on input files, but are not
   passed to the output file.

2. The lookahead feature does not work for the last samples in an ADPCM
   block (i.e. it doesn't utilize samples in the _next_ block).

3. In some situations the lookahead can get very slow or seem to be stuck
   because it needs improved trellis pruning. However the default level 3
   should always be fine and then the user can simply try increasing levels
   until the time becomes untenable.

4. Pipes are not yet supported.

