CREATE TABLE investigations_investigators (
  investigation_id INTEGER NOT NULL,
  investigator_id INTEGER NOT NULL,
  PRIMARY KEY (investigation_id, investigator_id),
  FOREIGN KEY (investigation_id) REFERENCES investigations (id),
  FOREIGN KEY (investigator_id) REFERENCES investigators (investigator_id)
);
