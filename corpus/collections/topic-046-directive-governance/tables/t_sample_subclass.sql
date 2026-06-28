CREATE TABLE t_sample_subclass (
  id VARCHAR(255),
  sample VARCHAR(255),
  collected_from VARCHAR(255) NOT NULL,
  identifier VARCHAR(255),
  location VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (collected_from) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"01_foundation","is_complex":true,"template_id":"sample_subclass"}'
