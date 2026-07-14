CREATE TABLE inheritances_persons (
  eternal_inheritance_id INTEGER NOT NULL,
  adopted_person_id INTEGER NOT NULL,
  PRIMARY KEY (eternal_inheritance_id, adopted_person_id),
  FOREIGN KEY (eternal_inheritance_id) REFERENCES eternal_inheritances (eternal_inheritance_id),
  FOREIGN KEY (adopted_person_id) REFERENCES adopted_persons (id)
);
