CREATE TABLE softwares_documentations (
  charting_software_id INTEGER NOT NULL,
  clinical_documentation_id INTEGER NOT NULL,
  PRIMARY KEY (charting_software_id, clinical_documentation_id),
  FOREIGN KEY (charting_software_id) REFERENCES charting_softwares (id),
  FOREIGN KEY (clinical_documentation_id) REFERENCES clinical_documentations (clinical_documentation_id)
);
