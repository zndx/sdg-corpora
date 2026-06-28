CREATE TABLE t_schemaorg_person_email (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  email VARCHAR(255) NOT NULL,
  created_date DATE,
  tags VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (email) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_person_email"}'
