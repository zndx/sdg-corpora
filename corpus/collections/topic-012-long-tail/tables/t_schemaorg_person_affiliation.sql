CREATE TABLE t_schemaorg_person_affiliation (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  affiliation VARCHAR(255) NOT NULL,
  license VARCHAR(255),
  uri VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (affiliation) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_person_affiliation"}'
