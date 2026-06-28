CREATE TABLE t_artifact_with_role (
  id VARCHAR(255),
  artifact VARCHAR(255),
  role VARCHAR(255) NOT NULL,
  checksum VARCHAR(255),
  size_bytes BIGINT,
  PRIMARY KEY (id),
  FOREIGN KEY (role) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"01_foundation","is_complex":true,"template_id":"artifact_with_role"}'
