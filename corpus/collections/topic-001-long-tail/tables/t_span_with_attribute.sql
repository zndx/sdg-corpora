CREATE TABLE t_span_with_attribute (
  id VARCHAR(255),
  span VARCHAR(255),
  span_attribute VARCHAR(255) NOT NULL,
  exit_code INTEGER,
  log_level VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (span_attribute) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"07_long_tail","is_complex":true,"template_id":"span_with_attribute"}'
