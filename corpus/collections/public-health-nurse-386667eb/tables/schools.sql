CREATE TABLE schools (
  id INTEGER NOT NULL,
  school_id INTEGER,
  school_name VARCHAR(32),
  address VARCHAR(32),
  board_id VARCHAR(35),
  risk_level VARCHAR(32),
  ipac_compliant BOOLEAN,
  last_assessment_date DATE,
  public_health_nurse_id INTEGER,
  part_of_board_id VARCHAR(35),
  outbreak_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (public_health_nurse_id) REFERENCES public_health_nurses (id),
  FOREIGN KEY (part_of_board_id) REFERENCES school_boards (board_id),
  FOREIGN KEY (outbreak_id) REFERENCES outbreaks (outbreak_id)
);
