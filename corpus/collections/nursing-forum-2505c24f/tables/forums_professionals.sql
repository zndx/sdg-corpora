CREATE TABLE forums_professionals (
  nursing_forum_id INTEGER NOT NULL,
  nursing_professional_id INTEGER NOT NULL,
  PRIMARY KEY (nursing_forum_id, nursing_professional_id),
  FOREIGN KEY (nursing_forum_id) REFERENCES nursing_forums (nursing_forum_id),
  FOREIGN KEY (nursing_professional_id) REFERENCES nursing_professionals (id)
);
