CREATE TABLE public_health_nurses (
  id INTEGER NOT NULL,
  nurse_id VARCHAR(44),
  full_name VARCHAR(36),
  license_number VARCHAR(32),
  contact_phone VARCHAR(32),
  email VARCHAR(32),
  status VARCHAR(32),
  school_id INTEGER,
  board_id VARCHAR(35),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (school_id) REFERENCES schools (id),
  FOREIGN KEY (board_id) REFERENCES school_boards (board_id)
);
