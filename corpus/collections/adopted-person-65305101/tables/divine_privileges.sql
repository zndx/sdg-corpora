CREATE TABLE divine_privileges (
  id INTEGER NOT NULL,
  privilege_id INTEGER,
  privilege_type VARCHAR(32),
  scriptural_reference VARCHAR(32),
  beneficiary_count INTEGER,
  divine_father_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (divine_father_id) REFERENCES divine_fathers (divine_father_id)
);
