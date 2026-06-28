CREATE TABLE t_schemaorg_creativework_publisher (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  publisher VARCHAR(255) NOT NULL,
  size_bytes BIGINT,
  location VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (publisher) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_creativework_publisher"}'
