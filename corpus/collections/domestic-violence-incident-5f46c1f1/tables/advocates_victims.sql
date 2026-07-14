CREATE TABLE advocates_victims (
  legal_advocate_id INTEGER NOT NULL,
  victim_id INTEGER NOT NULL,
  PRIMARY KEY (legal_advocate_id, victim_id),
  FOREIGN KEY (legal_advocate_id) REFERENCES legal_advocates (legal_advocate_id),
  FOREIGN KEY (victim_id) REFERENCES victims (id)
);
