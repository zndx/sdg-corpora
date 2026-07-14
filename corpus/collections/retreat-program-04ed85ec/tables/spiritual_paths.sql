CREATE TABLE spiritual_paths (
  spiritual_path_id INTEGER NOT NULL,
  path_id VARCHAR(44),
  path_name VARCHAR(32),
  core_principle VARCHAR(32),
  origin_tradition VARCHAR(32),
  is_universal BOOLEAN,
  spiritual_seeker_id INTEGER,
  retreat_program_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (spiritual_path_id),
  FOREIGN KEY (spiritual_seeker_id) REFERENCES spiritual_seekers (spiritual_seeker_id),
  FOREIGN KEY (retreat_program_id) REFERENCES retreat_programs (id)
);
