CREATE TABLE order_requests (
  id INTEGER NOT NULL,
  request_id INTEGER,
  submission_date TIMESTAMP,
  delivery_method VARCHAR(32),
  total_quantity INTEGER,
  perpetual_folder_id INTEGER,
  enrollee_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (perpetual_folder_id) REFERENCES perpetual_folders (id),
  FOREIGN KEY (enrollee_id) REFERENCES enrollees (enrollee_id)
);
