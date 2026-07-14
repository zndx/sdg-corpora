CREATE TABLE groups_publications (
  group_id VARCHAR(32) NOT NULL,
  publication_id INTEGER NOT NULL,
  PRIMARY KEY (group_id, publication_id),
  FOREIGN KEY (group_id) REFERENCES media_groups (group_id),
  FOREIGN KEY (publication_id) REFERENCES publications (publication_id)
);
