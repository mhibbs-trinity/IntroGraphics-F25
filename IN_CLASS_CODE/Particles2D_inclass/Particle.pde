

// Particle class
class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;

  Particle(PVector startPos) {
    position = startPos.copy();
    velocity = PVector.random2D().mult(0.5);
    acceleration = new PVector();
  }

  void update() {
  velocity.add(acceleration);
  position.add(velocity);

   // Screen wrapping
  if (position.x < 0) {
    position.x = width;
  } else if (position.x > width) {
    position.x = 0;
  }

  if (position.y < 0) {
    position.y = height;
  } else if (position.y > height) {
    position.y = 0;
  }
}

void applyForce(PVector force) {
  acceleration.add(force);
}

  void display() {
    fill(255, 100, 100);
    noStroke();
    ellipse(position.x, position.y, 16, 16);
  }
}
