CREATE TABLE assessment_notices (
  id INTEGER NOT NULL,
  notice_id VARCHAR(44),
  issue_date DATE,
  property_type VARCHAR(32),
  notice_type VARCHAR(32),
  status VARCHAR(32),
  property_identifier VARCHAR(32),
  property_parcel_id INTEGER,
  board_of_assessors_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (property_parcel_id) REFERENCES property_parcels (id),
  FOREIGN KEY (board_of_assessors_id) REFERENCES board_of_assessorses (board_of_assessors_id)
);
