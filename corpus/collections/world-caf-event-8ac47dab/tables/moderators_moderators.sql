CREATE TABLE moderators_moderators (
  field_moderator_id INTEGER NOT NULL,
  collaborates_with_field_moderator_id INTEGER NOT NULL,
  PRIMARY KEY (field_moderator_id, collaborates_with_field_moderator_id),
  FOREIGN KEY (field_moderator_id) REFERENCES field_moderators (id),
  FOREIGN KEY (collaborates_with_field_moderator_id) REFERENCES field_moderators (id)
);
