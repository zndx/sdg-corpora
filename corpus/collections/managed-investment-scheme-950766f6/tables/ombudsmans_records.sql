CREATE TABLE ombudsmans_records (
  external_ombudsman_id INTEGER NOT NULL,
  complaint_record_id INTEGER NOT NULL,
  PRIMARY KEY (external_ombudsman_id, complaint_record_id),
  FOREIGN KEY (external_ombudsman_id) REFERENCES external_ombudsmans (external_ombudsman_id),
  FOREIGN KEY (complaint_record_id) REFERENCES complaint_records (id)
);
