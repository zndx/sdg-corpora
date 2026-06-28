CREATE TABLE t_schemaorg_review_rating (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  review_rating VARCHAR(255) NOT NULL,
  name VARCHAR(255),
  tags VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (review_rating) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_review_rating"}'
