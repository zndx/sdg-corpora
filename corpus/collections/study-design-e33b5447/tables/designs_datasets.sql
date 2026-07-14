CREATE TABLE designs_datasets (
  study_design_id INTEGER NOT NULL,
  dataset_id INTEGER NOT NULL,
  PRIMARY KEY (study_design_id, dataset_id),
  FOREIGN KEY (study_design_id) REFERENCES study_designs (id),
  FOREIGN KEY (dataset_id) REFERENCES datasets (id)
);
