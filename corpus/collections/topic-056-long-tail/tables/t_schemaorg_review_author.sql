CREATE TABLE t_schemaorg_review_author (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  review_author VARCHAR(255) NOT NULL,
  identifier VARCHAR(255),
  license VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (review_author) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_review_author"}'
