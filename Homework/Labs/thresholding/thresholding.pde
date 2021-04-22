void threshold(PImage a, int threshold){
   if(threshold<0 || threshold >255){
     println("Integer must be between 0 and 255\n");
     exit();
   }
   // for each pixel in pixels array
   a.loadPixels();

   for (int col = 0; col < a.width; col++) {
     for (int row = 0; row < a.height; row ++) {
       // grab the color
       color c = a.get(col, row);
       // grayscale intensity is average of RGB values
       float gray = red(c) + green(c) + blue(c);
       gray /= 3;
       if(gray> threshold){
         c = color(0);
       }else{
         c = color(255);
       }
       a.set(col, row, c);
     }
   }

   a.updatePixels();
   
}
