CREATE TABLE t_artifact_max_one_owner (
  id VARCHAR(255),
  artifact VARCHAR(255),
  owner VARCHAR(255),
  mime_type VARCHAR(255),
  tags VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (owner) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"artifact_max_one_owner"}'
