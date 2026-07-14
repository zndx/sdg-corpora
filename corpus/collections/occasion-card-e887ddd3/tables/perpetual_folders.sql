CREATE TABLE perpetual_folders (
  id INTEGER NOT NULL,
  folder_name VARCHAR(32),
  cover_color VARCHAR(32),
  suggested_donation DECIMAL,
  has_society_logo BOOLEAN,
  enrollee_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (enrollee_id) REFERENCES enrollees (enrollee_id)
);
