CREATE TABLE muscles (
  muscle_id INTEGER NOT NULL,
  type VARCHAR(32),
  location VARCHAR(32),
  strength DECIMAL,
  nerve_fiber_id INTEGER,
  PRIMARY KEY (muscle_id),
  FOREIGN KEY (nerve_fiber_id) REFERENCES nerve_fibers (nerve_fiber_id)
);
