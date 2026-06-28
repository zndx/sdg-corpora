CREATE TABLE t_dataset_revision_of (
  id VARCHAR(255),
  dataset VARCHAR(255),
  was_revision_of VARCHAR(255) NOT NULL,
  mime_type VARCHAR(255),
  owner VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"05_provo_lineage","is_complex":true,"template_id":"dataset_revision_of"}'
