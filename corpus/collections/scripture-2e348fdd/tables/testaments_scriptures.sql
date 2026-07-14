CREATE TABLE testaments_scriptures (
  testament_id INTEGER NOT NULL,
  scripture_id INTEGER NOT NULL,
  PRIMARY KEY (testament_id, scripture_id),
  FOREIGN KEY (testament_id) REFERENCES testaments (testament_id),
  FOREIGN KEY (scripture_id) REFERENCES scriptures (id)
);
