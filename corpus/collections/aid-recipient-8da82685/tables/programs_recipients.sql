CREATE TABLE programs_recipients (
  aid_program_id INTEGER NOT NULL,
  aid_recipient_id INTEGER NOT NULL,
  PRIMARY KEY (aid_program_id, aid_recipient_id),
  FOREIGN KEY (aid_program_id) REFERENCES aid_programs (id),
  FOREIGN KEY (aid_recipient_id) REFERENCES aid_recipients (id)
);
