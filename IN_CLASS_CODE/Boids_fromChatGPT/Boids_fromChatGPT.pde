BoidSystem bs;

void settings() {
  size(800, 600);
}

void setup() {
  bs = new BoidSystem();

  // Add initial boids
  for (int i = 0; i < 100; i++) {
    bs.addBoid(new Boid(new PVector(random(width), random(height))));
  }

  noCursor(); // Hide cursor for a cleaner look
}

void draw() {
  background(0);
  bs.run();

  // Draw cursor
  stroke(255);
  noFill();
  ellipse(mouseX, mouseY, 10, 10);
}

void mousePressed() {
  // Spawn a new cluster of boids at mouse location
  for (int i = 0; i < 20; i++) {
    bs.addBoid(new Boid(new PVector(mouseX + random(-10, 10), mouseY + random(-10, 10))));
  }
}

// ----------------------------------
// Boid class
class Boid {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float maxForce = 0.05;
  float maxSpeed = 2;

  // Weight parameters
  float separationWeight = 1.5;
  float alignmentWeight = 1.0;
  float cohesionWeight = 1.0;

  Boid(PVector pos) {
    position = pos.copy();
    velocity = PVector.random2D();
    acceleration = new PVector();
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    position.add(velocity);
    acceleration.mult(0);

    wrapAround();
  }

  void wrapAround() {
    if (position.x < 0) position.x = width;
    if (position.x > width) position.x = 0;
    if (position.y < 0) position.y = height;
    if (position.y > height) position.y = 0;
  }

  void flock(ArrayList<Boid> boids) {
    PVector sep = separate(boids).mult(separationWeight);
    PVector ali = align(boids).mult(alignmentWeight);
    PVector coh = cohesion(boids).mult(cohesionWeight);

    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
  }

  void display() {
    float angle = velocity.heading() + PI / 2;
    fill(200, 150);
    stroke(255);
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    beginShape();
    vertex(0, -6);
    vertex(-4, 6);
    vertex(4, 6);
    endShape(CLOSE);
    popMatrix();
  }

  // ----------------------
  // Boid behaviors:

  // Separation: steer to avoid crowding neighbors
  PVector separate(ArrayList<Boid> boids) {
    float desiredSeparation = 25;
    PVector steer = new PVector();
    int count = 0;

    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < desiredSeparation)) {
        PVector diff = PVector.sub(position, other.position);
        diff.normalize();
        diff.div(d); // Weight by distance
        steer.add(diff);
        count++;
      }
    }

    if (count > 0) {
      steer.div((float) count);
    }

    if (steer.mag() > 0) {
      steer.setMag(maxSpeed);
      steer.sub(velocity);
      steer.limit(maxForce);
    }

    return steer;
  }

  // Alignment: steer toward average heading of neighbors
  PVector align(ArrayList<Boid> boids) {
    float neighborDist = 50;
    PVector sum = new PVector();
    int count = 0;

    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighborDist)) {
        sum.add(other.velocity);
        count++;
      }
    }

    if (count > 0) {
      sum.div((float) count);
      sum.setMag(maxSpeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxForce);
      return steer;
    }

    return new PVector();
  }

  // Cohesion: steer toward average position of neighbors
  PVector cohesion(ArrayList<Boid> boids) {
    float neighborDist = 50;
    PVector sum = new PVector();
    int count = 0;

    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighborDist)) {
        sum.add(other.position);
        count++;
      }
    }

    if (count > 0) {
      sum.div((float) count);
      return seek(sum);
    }

    return new PVector();
  }

  // Move toward a target
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, position);
    desired.setMag(maxSpeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    return steer;
  }
}

// ----------------------------------
// BoidSystem class
class BoidSystem {
  ArrayList<Boid> boids;

  BoidSystem() {
    boids = new ArrayList<Boid>();
  }

  void addBoid(Boid b) {
    boids.add(b);
  }

  void run() {
    for (Boid b : boids) {
      b.flock(boids);
      b.update();
      b.display();
    }
  }
}
