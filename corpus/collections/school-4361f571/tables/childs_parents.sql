CREATE TABLE childs_parents (
  child_id INTEGER NOT NULL,
  parent_id INTEGER NOT NULL,
  PRIMARY KEY (child_id, parent_id),
  FOREIGN KEY (child_id) REFERENCES childs (id),
  FOREIGN KEY (parent_id) REFERENCES parents (id)
);
