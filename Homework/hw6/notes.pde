/*

 A warning I am unsure how to get rid of 
 "Sound library warning: 
 the length of the array passed to read(float[])
 does not match the size of the data of this stereo audio sample
 (note that stereo samples contain two values per frame!)"
 
 I tried to double the length of the floats array
 in the sound to image function but I got 
 ArrayIndexOutOfBounds errors. NOt sure how to compensate for it.
 
 With longer audio files, the entire sound isn't converted into
 image isn't created. ( files longer than 3 minutes)
 
 Might just be a limitation of my computers computing power
 
 */
 
 /* Potential Solution Check the Sample Rate (per second) and CHannel number */
