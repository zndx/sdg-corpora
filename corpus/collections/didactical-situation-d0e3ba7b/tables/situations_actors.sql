CREATE TABLE situations_actors (
  situation_id VARCHAR(35) NOT NULL,
  actor_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (situation_id, actor_id),
  FOREIGN KEY (situation_id) REFERENCES didactical_situations (situation_id),
  FOREIGN KEY (actor_id) REFERENCES educational_actors (actor_id)
);
