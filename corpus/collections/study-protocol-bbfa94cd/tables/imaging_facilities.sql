CREATE TABLE imaging_facilities (
  imaging_facility_id INTEGER NOT NULL,
  facility_id VARCHAR(35),
  facility_name VARCHAR(32),
  location VARCHAR(32),
  certification_status VARCHAR(32),
  PRIMARY KEY (imaging_facility_id)
);
