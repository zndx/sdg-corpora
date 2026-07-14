CREATE TABLE property_parcels (
  id INTEGER NOT NULL,
  parcel_id INTEGER,
  address VARCHAR(32),
  land_use VARCHAR(32),
  area DECIMAL,
  zoning_district VARCHAR(32),
  owner_name VARCHAR(32),
  assessment_notice_id INTEGER,
  exemption_id VARCHAR(44),
  appeal_waiver_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (assessment_notice_id) REFERENCES assessment_notices (id),
  FOREIGN KEY (exemption_id) REFERENCES property_exemptions (exemption_id),
  FOREIGN KEY (appeal_waiver_id) REFERENCES appeal_waivers (appeal_waiver_id)
);
