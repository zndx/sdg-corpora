CREATE TABLE physicians_procedures (
  physician_id INTEGER NOT NULL,
  imaging_procedure_id INTEGER NOT NULL,
  PRIMARY KEY (physician_id, imaging_procedure_id),
  FOREIGN KEY (physician_id) REFERENCES physicians (physician_id),
  FOREIGN KEY (imaging_procedure_id) REFERENCES imaging_procedures (id)
);
