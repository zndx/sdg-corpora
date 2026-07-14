CREATE TABLE board_of_assessorses (
  board_of_assessors_id INTEGER NOT NULL,
  board_id VARCHAR(35),
  jurisdiction VARCHAR(32),
  meeting_date DATE,
  status VARCHAR(32),
  assessment_notice_id INTEGER,
  exemption_id VARCHAR(44),
  created_at TIMESTAMP,
  PRIMARY KEY (board_of_assessors_id),
  FOREIGN KEY (assessment_notice_id) REFERENCES assessment_notices (id),
  FOREIGN KEY (exemption_id) REFERENCES property_exemptions (exemption_id)
);
