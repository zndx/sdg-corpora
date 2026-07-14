CREATE TABLE secu_data_storage_systems (
  id INTEGER NOT NULL,
  system_id INTEGER,
  system_name VARCHAR(32),
  storage_capacity_g_b DECIMAL,
  last_backup_date DATE,
  encryption_status BOOLEAN,
  video_surveillance_data_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (video_surveillance_data_id) REFERENCES secu_video_surveillance_datas (id)
);
