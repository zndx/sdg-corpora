CREATE TABLE building_reports (
  id INTEGER NOT NULL,
  report_id VARCHAR(32),
  report_date DATE,
  prepared_by VARCHAR(32),
  regulation_cited VARCHAR(32),
  finding VARCHAR(32),
  recommendation VARCHAR(32),
  zoning_case_id INTEGER,
  board_staff_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (zoning_case_id) REFERENCES zoning_cases (id),
  FOREIGN KEY (board_staff_id) REFERENCES board_staffs (board_staff_id)
);
