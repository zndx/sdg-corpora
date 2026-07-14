CREATE TABLE contact_methods (
  contact_method_id INTEGER NOT NULL,
  contact_value VARCHAR(32),
  contact_type VARCHAR(32),
  is_primary BOOLEAN,
  adoption_petitioner_id INTEGER,
  adult_to_be_adopted_social_security_number VARCHAR(32),
  PRIMARY KEY (contact_method_id),
  FOREIGN KEY (adoption_petitioner_id) REFERENCES adoption_petitioners (id),
  FOREIGN KEY (adult_to_be_adopted_social_security_number) REFERENCES adult_to_be_adopteds (social_security_number)
);
