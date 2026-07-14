CREATE TABLE petitioners_methods (
  adoption_petitioner_id INTEGER NOT NULL,
  contact_method_id INTEGER NOT NULL,
  PRIMARY KEY (adoption_petitioner_id, contact_method_id),
  FOREIGN KEY (adoption_petitioner_id) REFERENCES adoption_petitioners (id),
  FOREIGN KEY (contact_method_id) REFERENCES contact_methods (contact_method_id)
);
