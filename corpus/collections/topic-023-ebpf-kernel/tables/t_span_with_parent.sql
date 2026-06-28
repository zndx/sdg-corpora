CREATE TABLE t_span_with_parent (
  id VARCHAR(255),
  span VARCHAR(255),
  parent_span VARCHAR(255) NOT NULL,
  log_level VARCHAR(255),
  scheduled_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (parent_span) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"07_long_tail","is_complex":true,"template_id":"span_with_parent"}'
