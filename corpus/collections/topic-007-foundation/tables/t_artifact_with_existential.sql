CREATE TABLE t_artifact_with_existential (
  id VARCHAR(255),
  artifact VARCHAR(255),
  related VARCHAR(255) NOT NULL,
  checksum VARCHAR(255),
  version INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (related) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"01_foundation","is_complex":true,"template_id":"artifact_with_existential"}'
