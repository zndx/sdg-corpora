CREATE TABLE t_program_with_entry_exactly_one (
  id VARCHAR(255),
  program VARCHAR(255),
  entry_point VARCHAR(255),
  identifier VARCHAR(255),
  version INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (entry_point) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"01_foundation","is_complex":true,"template_id":"program_with_entry_exactly_one"}'
