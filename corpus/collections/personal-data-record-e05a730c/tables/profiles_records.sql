CREATE TABLE profiles_records (
  customer_profile_id INTEGER NOT NULL,
  personal_data_record_id INTEGER NOT NULL,
  PRIMARY KEY (customer_profile_id, personal_data_record_id),
  FOREIGN KEY (customer_profile_id) REFERENCES customer_profiles (id),
  FOREIGN KEY (personal_data_record_id) REFERENCES personal_data_records (id)
);
