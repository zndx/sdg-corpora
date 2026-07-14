CREATE TABLE choreographers_routines (
  choreographer_id INTEGER NOT NULL,
  line_dance_routine_id INTEGER NOT NULL,
  PRIMARY KEY (choreographer_id, line_dance_routine_id),
  FOREIGN KEY (choreographer_id) REFERENCES choreographers (id),
  FOREIGN KEY (line_dance_routine_id) REFERENCES line_dance_routines (id)
);
