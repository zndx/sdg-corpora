CREATE TABLE t_schemaorg_person_roleat (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  role_at VARCHAR(255) NOT NULL,
  identifier VARCHAR(255),
  name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (role_at) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_person_roleat"}'
