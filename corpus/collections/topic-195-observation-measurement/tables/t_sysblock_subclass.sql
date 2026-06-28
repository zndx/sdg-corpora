CREATE TABLE t_sysblock_subclass (
  id VARCHAR(255),
  sysblock VARCHAR(255),
  has_part VARCHAR(255) NOT NULL,
  identifier VARCHAR(255),
  size_bytes BIGINT,
  PRIMARY KEY (id),
  FOREIGN KEY (has_part) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"01_foundation","is_complex":true,"template_id":"sysblock_subclass"}'
