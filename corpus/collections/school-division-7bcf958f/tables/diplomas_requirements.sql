CREATE TABLE diplomas_requirements (
  diploma_id INTEGER NOT NULL,
  diploma_requirement_id INTEGER NOT NULL,
  PRIMARY KEY (diploma_id, diploma_requirement_id),
  FOREIGN KEY (diploma_id) REFERENCES diplomas (id),
  FOREIGN KEY (diploma_requirement_id) REFERENCES diploma_requirements (id)
);
