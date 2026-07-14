CREATE TABLE partners_subjects (
  business_partner_id INTEGER NOT NULL,
  data_subject_id INTEGER NOT NULL,
  PRIMARY KEY (business_partner_id, data_subject_id),
  FOREIGN KEY (business_partner_id) REFERENCES business_partners (id),
  FOREIGN KEY (data_subject_id) REFERENCES data_subjects (id)
);
