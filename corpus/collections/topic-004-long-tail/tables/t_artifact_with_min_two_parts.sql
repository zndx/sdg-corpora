CREATE TABLE t_artifact_with_min_two_parts (
  id VARCHAR(255),
  artifact VARCHAR(255),
  checksum VARCHAR(255),
  version INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"01_foundation","is_complex":true,"template_id":"artifact_with_min_two_parts"}'
