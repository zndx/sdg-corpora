CREATE TABLE housing_units (
  id INTEGER NOT NULL,
  unit_id VARCHAR(44),
  address VARCHAR(32),
  bedrooms INTEGER,
  monthly_rent DECIMAL,
  occupancy_status VARCHAR(32),
  member_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (member_id) REFERENCES household_members (member_id)
);
