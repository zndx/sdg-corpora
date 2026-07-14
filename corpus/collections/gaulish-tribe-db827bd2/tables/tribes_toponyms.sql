CREATE TABLE tribes_toponyms (
  gaulish_tribe_id INTEGER NOT NULL,
  toponym_id INTEGER NOT NULL,
  PRIMARY KEY (gaulish_tribe_id, toponym_id),
  FOREIGN KEY (gaulish_tribe_id) REFERENCES gaulish_tribes (id),
  FOREIGN KEY (toponym_id) REFERENCES toponyms (id)
);
