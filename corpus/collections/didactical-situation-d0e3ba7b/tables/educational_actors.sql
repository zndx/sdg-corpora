CREATE TABLE educational_actors (
  actor_id VARCHAR(32) NOT NULL,
  role VARCHAR(32),
  institution VARCHAR(32),
  years_of_experience INTEGER,
  demographic_group VARCHAR(32),
  situation_id VARCHAR(35),
  PRIMARY KEY (actor_id),
  FOREIGN KEY (situation_id) REFERENCES didactical_situations (situation_id)
);
