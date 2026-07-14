CREATE TABLE professional_activities (
  activity_id VARCHAR(34) NOT NULL,
  activity_type VARCHAR(32),
  start_date DATE,
  end_date DATE,
  authorship_role VARCHAR(32),
  accreditation_status VARCHAR(32),
  is_part_of_regular_duties BOOLEAN,
  credits_awarded INTEGER,
  certified_professional_id INTEGER,
  document_id VARCHAR(44),
  course_id INTEGER,
  PRIMARY KEY (activity_id),
  FOREIGN KEY (certified_professional_id) REFERENCES certified_professionals (certified_professional_id),
  FOREIGN KEY (document_id) REFERENCES professional_documents (document_id),
  FOREIGN KEY (course_id) REFERENCES courses (id)
);
