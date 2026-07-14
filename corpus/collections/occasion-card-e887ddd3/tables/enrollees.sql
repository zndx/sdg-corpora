CREATE TABLE enrollees (
  enrollee_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  is_deceased BOOLEAN,
  relationship_to_requester VARCHAR(32),
  perpetual_folder_id INTEGER,
  PRIMARY KEY (enrollee_id),
  FOREIGN KEY (perpetual_folder_id) REFERENCES perpetual_folders (id)
);
