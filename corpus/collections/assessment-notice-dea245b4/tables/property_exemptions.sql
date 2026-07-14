CREATE TABLE property_exemptions (
  exemption_id VARCHAR(44) NOT NULL,
  exemption_type VARCHAR(32),
  approval_date DATE,
  status VARCHAR(32),
  property_identifier VARCHAR(32),
  applicable_year INTEGER,
  property_parcel_id INTEGER,
  board_of_assessors_id INTEGER,
  PRIMARY KEY (exemption_id),
  FOREIGN KEY (property_parcel_id) REFERENCES property_parcels (id),
  FOREIGN KEY (board_of_assessors_id) REFERENCES board_of_assessorses (board_of_assessors_id)
);
