CREATE TABLE t_schemaorg_review_target (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  reviews_item VARCHAR(255) NOT NULL,
  mime_type VARCHAR(255),
  version INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (reviews_item) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_review_target"}'
