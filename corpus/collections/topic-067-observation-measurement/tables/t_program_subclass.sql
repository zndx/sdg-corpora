CREATE TABLE t_program_subclass (
  id VARCHAR(255),
  program VARCHAR(255),
  input VARCHAR(255) NOT NULL,
  license VARCHAR(255),
  location VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (input) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"01_foundation","is_complex":true,"template_id":"program_subclass"}'
