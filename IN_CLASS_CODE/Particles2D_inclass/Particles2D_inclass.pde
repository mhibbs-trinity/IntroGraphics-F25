ParticleSystem ps;

void settings() {
  size(800, 600);
}

void setup() {
  background(0);
  ps = new ParticleSystem(new PVector(width / 2, height / 4));
}

void draw() {
  background(0);

  // Add a new particle each frame
  ps.addParticle();

  // Calculate wind based on mouseX
  float windStrength = map(mouseX, 0, width, -0.1, 0.1);
  PVector wind = new PVector(windStrength, 0);
  PVector gravity = new PVector(0,0.05);
  ps.applyForce(wind);
  ps.applyForce(gravity);
  
  // Update and display all particles
  ps.run();
  
  for(Particle p : ps.particles) {
    p.acceleration = new PVector(0,0);
  }
}
