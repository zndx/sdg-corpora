CREATE TABLE institutions_actors (
  didactic_institution_id INTEGER NOT NULL,
  actor_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (didactic_institution_id, actor_id),
  FOREIGN KEY (didactic_institution_id) REFERENCES didactic_institutions (didactic_institution_id),
  FOREIGN KEY (actor_id) REFERENCES educational_actors (actor_id)
);
