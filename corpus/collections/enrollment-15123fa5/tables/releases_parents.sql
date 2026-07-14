CREATE TABLE releases_parents (
  media_release_id INTEGER NOT NULL,
  parent_id INTEGER NOT NULL,
  PRIMARY KEY (media_release_id, parent_id),
  FOREIGN KEY (media_release_id) REFERENCES media_releases (id),
  FOREIGN KEY (parent_id) REFERENCES parents (id)
);
