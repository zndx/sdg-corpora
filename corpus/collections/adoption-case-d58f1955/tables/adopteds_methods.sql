CREATE TABLE adopteds_methods (
  adult_to_be_adopted_social_security_number VARCHAR(32) NOT NULL,
  contact_method_id INTEGER NOT NULL,
  PRIMARY KEY (adult_to_be_adopted_social_security_number, contact_method_id),
  FOREIGN KEY (adult_to_be_adopted_social_security_number) REFERENCES adult_to_be_adopteds (social_security_number),
  FOREIGN KEY (contact_method_id) REFERENCES contact_methods (contact_method_id)
);
