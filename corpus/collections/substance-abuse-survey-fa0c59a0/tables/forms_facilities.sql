CREATE TABLE forms_facilities (
  substance_abuse_form_id INTEGER NOT NULL,
  treatment_facility_id INTEGER NOT NULL,
  PRIMARY KEY (substance_abuse_form_id, treatment_facility_id),
  FOREIGN KEY (substance_abuse_form_id) REFERENCES substance_abuse_forms (id),
  FOREIGN KEY (treatment_facility_id) REFERENCES treatment_facilities (id)
);
