CREATE TABLE school_boards (
  board_id VARCHAR(35) NOT NULL,
  board_name VARCHAR(32),
  jurisdiction VARCHAR(32),
  contact_email VARCHAR(32),
  contact_phone VARCHAR(32),
  program_manager_name VARCHAR(32),
  program_manager_phone VARCHAR(32),
  public_health_nurse_id INTEGER,
  PRIMARY KEY (board_id),
  FOREIGN KEY (public_health_nurse_id) REFERENCES public_health_nurses (id)
);
