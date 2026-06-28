CREATE TABLE t_dataset_snapshot_subclass (
  id VARCHAR(255),
  dataset VARCHAR(255),
  snapshot_of VARCHAR(255) NOT NULL,
  checksum VARCHAR(255),
  license VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (snapshot_of) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"dataset_snapshot_subclass"}'
