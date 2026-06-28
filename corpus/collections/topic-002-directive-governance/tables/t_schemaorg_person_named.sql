CREATE TABLE t_schemaorg_person_named (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  full_name VARCHAR(255) NOT NULL,
  uri VARCHAR(255),
  location VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (full_name) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_person_named"}'
