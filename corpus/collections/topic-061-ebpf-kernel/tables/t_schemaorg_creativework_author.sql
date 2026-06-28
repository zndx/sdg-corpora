CREATE TABLE t_schemaorg_creativework_author (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  author VARCHAR(255) NOT NULL,
  created_date DATE,
  license VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (author) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_creativework_author"}'
