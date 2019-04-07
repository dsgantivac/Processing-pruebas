/*
PImage img;  // Declare a variable of type PImage

void setup() {
  size(900,600);
  // Make a new instance of a PImage by loading an image file
  //600 *300
  img = loadImage("capucho.png");
}

void draw() {
  background(120,60,102);
  tint(255,255,255,255);
  for(int i = 0;i<img.width;i++){
    for(int j=0;j<img.height;j++){
      int pos = i+j*img.width;
      if(j % 2 == 0){
        img.pixels[pos] = color(0);
      }
    }
  }
  
  image(img,0,0);
  
  //println(img.width,img.height,img.pixels.length);
  tint(255,255,255,255);
  PImage img2 = createImage(200, 200, RGB);
  // Draw the image to the screen at coordinate (0,0)
  for(int i = 0; i< img2.pixels.length;i++){
    img2.pixels[i] = color(random(255),random(255),random(255));
    //println(img.pixels[i]);
  }
  image(img2,600,300);
  
}
*/
/*
size(200, 200);
loadPixels();  
// Loop through every pixel column
for (int x = 0; x < width; x++) {
  // Loop through every pixel row
  for (int y = 0; y < height; y++) {
    // Use the formula to find the 1D location
    int loc = x + y * width;
    if (y % 2 == 0) { // If we are an even column
      pixels[loc] = color(255);
    }else if(x % 2 == 0 ){
      pixels[loc] = color(0);
    }
    else {          // If we are an odd column
      pixels[loc] = color(0);
    }
  }
}
updatePixels(); 

*/

PImage img;

void setup() {
  size(600, 300);
  img = loadImage("capucho.png");
}

void draw() {
  loadPixels();
  img.loadPixels();

  // We must also call loadPixels() on the PImage since we are going to read its pixels.  img.loadPixels(); 
  for (int x = 0; x < img.width; x++ ) {
    for (int y = 0; y < img.height; y++ ) {

      // Calculate the 1D pixel location
      int loc = x + y*img.width;

      // Get the R,G,B values from image
      float r = red  (img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue (img.pixels[loc]);

      // We calculate a multiplier ranging from 0.0 to 8.0 based on mouseX position. 
      // That multiplier changes the RGB value of each pixel.      
      float adjustBrightness = map(mouseX, 0, width, 0, 8); 
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;

      // The RGB values are constrained between 0 and 255 before being set as a new color.      
      r = constrain(r, 0, 255); 
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);

      // Make a new color and set pixel in the window
      color c = color(r, g, b);
      pixels[loc] = c;
    }
  }

  updatePixels();
}
