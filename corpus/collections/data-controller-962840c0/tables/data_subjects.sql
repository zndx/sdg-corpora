CREATE TABLE data_subjects (
  id INTEGER NOT NULL,
  subject_identifier VARCHAR(32),
  consent_given BOOLEAN,
  contact_method VARCHAR(32),
  data_controller_id INTEGER,
  data_processor_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (data_controller_id) REFERENCES data_controllers (id),
  FOREIGN KEY (data_processor_id) REFERENCES data_processors (id)
);
