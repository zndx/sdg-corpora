CREATE TABLE travel_requests (
  travel_request_id INTEGER NOT NULL,
  request_id INTEGER,
  submission_date DATE,
  meeting_name VARCHAR(32),
  requires_absence_authorization BOOLEAN,
  requires_university_car BOOLEAN,
  is_submitted_early BOOLEAN,
  person_id INTEGER,
  office_staff_role_id INTEGER,
  voucher_id INTEGER,
  PRIMARY KEY (travel_request_id),
  FOREIGN KEY (person_id) REFERENCES persons (id),
  FOREIGN KEY (office_staff_role_id) REFERENCES office_staff_roles (office_staff_role_id),
  FOREIGN KEY (voucher_id) REFERENCES travel_vouchers (voucher_id)
);
