CREATE TABLE facilities_forms (
  treatment_facility_id INTEGER NOT NULL,
  substance_abuse_form_id INTEGER NOT NULL,
  PRIMARY KEY (treatment_facility_id, substance_abuse_form_id),
  FOREIGN KEY (treatment_facility_id) REFERENCES treatment_facilities (id),
  FOREIGN KEY (substance_abuse_form_id) REFERENCES substance_abuse_forms (id)
);
