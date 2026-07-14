CREATE TABLE folders_enrolments (
  perpetual_folder_id INTEGER NOT NULL,
  enrolment_id INTEGER NOT NULL,
  PRIMARY KEY (perpetual_folder_id, enrolment_id),
  FOREIGN KEY (perpetual_folder_id) REFERENCES perpetual_folders (id),
  FOREIGN KEY (enrolment_id) REFERENCES enrolments (enrolment_id)
);
