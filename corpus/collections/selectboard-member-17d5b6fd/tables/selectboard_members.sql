CREATE TABLE selectboard_members (
  id INTEGER NOT NULL,
  member_id INTEGER,
  full_name VARCHAR(36),
  role_title VARCHAR(32),
  appointment_date TIMESTAMP,
  term_end_date DATE,
  is_ex_officio BOOLEAN,
  municipal_board_id INTEGER,
  motion_id VARCHAR(35),
  PRIMARY KEY (id),
  FOREIGN KEY (municipal_board_id) REFERENCES municipal_boards (id),
  FOREIGN KEY (motion_id) REFERENCES motions (motion_id)
);
