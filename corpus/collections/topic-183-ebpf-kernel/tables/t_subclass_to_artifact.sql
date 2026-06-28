CREATE TABLE t_subclass_to_artifact (
  id VARCHAR(255),
  artifact VARCHAR(255),
  checksum VARCHAR(255),
  license VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"01_foundation","is_complex":false,"template_id":"subclass_to_artifact"}'
