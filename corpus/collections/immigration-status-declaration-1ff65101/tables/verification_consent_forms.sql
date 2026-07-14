CREATE TABLE verification_consent_forms (
  id INTEGER NOT NULL,
  consent_id VARCHAR(44),
  signed_date DATE,
  is_signed BOOLEAN,
  verification_method VARCHAR(32),
  immigration_status_declaration_id INTEGER,
  member_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (immigration_status_declaration_id) REFERENCES immigration_status_declarations (id),
  FOREIGN KEY (member_id) REFERENCES household_members (member_id)
);
