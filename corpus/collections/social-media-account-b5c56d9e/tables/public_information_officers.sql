CREATE TABLE public_information_officers (
  id INTEGER NOT NULL,
  officer_id INTEGER,
  full_name VARCHAR(36),
  contact_extension VARCHAR(32),
  access_level VARCHAR(32),
  board_policy_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (board_policy_id) REFERENCES board_policies (id)
);
