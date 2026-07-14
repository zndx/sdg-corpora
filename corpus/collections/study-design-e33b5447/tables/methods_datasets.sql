CREATE TABLE methods_datasets (
  research_method_id INTEGER NOT NULL,
  dataset_id INTEGER NOT NULL,
  PRIMARY KEY (research_method_id, dataset_id),
  FOREIGN KEY (research_method_id) REFERENCES research_methods (id),
  FOREIGN KEY (dataset_id) REFERENCES datasets (id)
);
