CREATE TABLE t_artifact_either_internal_or_external (
  id VARCHAR(255),
  artifact VARCHAR(255),
  artifact_2 VARCHAR(255),
  artifact_3 VARCHAR(255),
  checksum VARCHAR(255),
  created_date DATE,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"artifact_either_internal_or_external"}'
