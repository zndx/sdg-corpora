CREATE TABLE physicians (
  physician_id INTEGER NOT NULL,
  specialty VARCHAR(32),
  board_certified BOOLEAN,
  role_in_study VARCHAR(32),
  PRIMARY KEY (physician_id)
);
