CREATE TABLE personal_data_records (
  id INTEGER NOT NULL,
  record_id INTEGER,
  collection_date TIMESTAMP,
  data_category VARCHAR(32),
  is_sensitive BOOLEAN,
  retention_period_months INTEGER,
  disclosure_status VARCHAR(32),
  digital_platform_id INTEGER,
  customer_profile_id INTEGER,
  vendor_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (digital_platform_id) REFERENCES digital_platforms (id),
  FOREIGN KEY (customer_profile_id) REFERENCES customer_profiles (id),
  FOREIGN KEY (vendor_id) REFERENCES third_party_vendors (vendor_id)
);
