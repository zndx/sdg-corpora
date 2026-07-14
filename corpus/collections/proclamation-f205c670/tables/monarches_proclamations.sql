CREATE TABLE monarches_proclamations (
  monarch_id INTEGER NOT NULL,
  proclamation_id INTEGER NOT NULL,
  PRIMARY KEY (monarch_id, proclamation_id),
  FOREIGN KEY (monarch_id) REFERENCES monarches (monarch_id),
  FOREIGN KEY (proclamation_id) REFERENCES proclamations (id)
);
