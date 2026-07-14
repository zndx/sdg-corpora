CREATE TABLE jurisdictions_owners (
  jurisdiction_id INTEGER NOT NULL,
  business_owner_id INTEGER NOT NULL,
  PRIMARY KEY (jurisdiction_id, business_owner_id),
  FOREIGN KEY (jurisdiction_id) REFERENCES jurisdictions (id),
  FOREIGN KEY (business_owner_id) REFERENCES business_owners (business_owner_id)
);
