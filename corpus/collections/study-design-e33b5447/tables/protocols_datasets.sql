CREATE TABLE protocols_datasets (
  ethical_protocol_id INTEGER NOT NULL,
  dataset_id INTEGER NOT NULL,
  PRIMARY KEY (ethical_protocol_id, dataset_id),
  FOREIGN KEY (ethical_protocol_id) REFERENCES ethical_protocols (id),
  FOREIGN KEY (dataset_id) REFERENCES datasets (id)
);
