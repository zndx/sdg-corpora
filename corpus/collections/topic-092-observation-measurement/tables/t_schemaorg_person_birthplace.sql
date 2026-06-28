CREATE TABLE t_schemaorg_person_birthplace (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  birthplace VARCHAR(255) NOT NULL,
  size_bytes BIGINT,
  uri VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (birthplace) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_person_birthplace"}'
