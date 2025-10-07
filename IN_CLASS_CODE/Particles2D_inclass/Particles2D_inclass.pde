// Minimal Processing sketch
// Window size: 800x600

void settings() {
  size(800, 600);
}

void setup() {
  background(0);
  stroke(255);
  fill(255);
}

void draw() {
  // Simple moving ellipse to show animation loop
  background(0);
  float x = width * 0.5 + 200 * sin(frameCount * 0.02);
  float y = height * 0.5 + 100 * cos(frameCount * 0.015);
  ellipse(x, y, 48, 48);
}
