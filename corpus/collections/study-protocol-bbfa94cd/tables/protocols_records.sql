CREATE TABLE protocols_records (
  study_protocol_id INTEGER NOT NULL,
  reimbursement_record_id INTEGER NOT NULL,
  PRIMARY KEY (study_protocol_id, reimbursement_record_id),
  FOREIGN KEY (study_protocol_id) REFERENCES study_protocols (study_protocol_id),
  FOREIGN KEY (reimbursement_record_id) REFERENCES reimbursement_records (id)
);
