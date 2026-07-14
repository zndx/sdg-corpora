CREATE TABLE business_partners (
  id INTEGER NOT NULL,
  partner_name VARCHAR(32),
  partner_type VARCHAR(32),
  data_sharing_agreement_id VARCHAR(32),
  data_controller_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (data_controller_id) REFERENCES data_controllers (id)
);
