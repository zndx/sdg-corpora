CREATE TABLE migr_businessesLocal (
  business_id INTEGER NOT NULL,
  local_id INTEGER NOT NULL,
  PRIMARY KEY (business_id, local_id),
  FOREIGN KEY (business_id) REFERENCES migr_businesses (id),
  FOREIGN KEY (local_id) REFERENCES migr_locals (id)
);
