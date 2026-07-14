CREATE TABLE authorities_standards (
  approving_authority_id INTEGER NOT NULL,
  approval_standard_id INTEGER NOT NULL,
  PRIMARY KEY (approving_authority_id, approval_standard_id),
  FOREIGN KEY (approving_authority_id) REFERENCES approving_authorities (approving_authority_id),
  FOREIGN KEY (approval_standard_id) REFERENCES approval_standards (approval_standard_id)
);
