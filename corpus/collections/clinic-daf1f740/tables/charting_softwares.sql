CREATE TABLE charting_softwares (
  id INTEGER NOT NULL,
  software_id VARCHAR(32),
  software_name VARCHAR(32),
  version VARCHAR(32),
  has_billing_module BOOLEAN,
  has_scheduling_module BOOLEAN,
  is_cloud_based BOOLEAN,
  PRIMARY KEY (id)
);
