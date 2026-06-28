CREATE TABLE t_schemaorg_creativework_date (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  date_published VARCHAR(255) NOT NULL,
  version INTEGER,
  tags VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (date_published) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_creativework_date"}'
