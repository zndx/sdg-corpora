CREATE TABLE office_service_requests (
  id INTEGER NOT NULL,
  request_id INTEGER,
  submission_date TIMESTAMP,
  service_type VARCHAR(32),
  page_count INTEGER,
  is_copyrighted BOOLEAN,
  estimated_completion_time VARCHAR(32),
  is_emergency BOOLEAN,
  administrative_staff_member_id INTEGER,
  processed_by_administrative_staff_member_id INTEGER,
  form_id VARCHAR(39),
  PRIMARY KEY (id),
  FOREIGN KEY (administrative_staff_member_id) REFERENCES administrative_staff_members (id),
  FOREIGN KEY (processed_by_administrative_staff_member_id) REFERENCES administrative_staff_members (id),
  FOREIGN KEY (form_id) REFERENCES request_forms (form_id)
);
