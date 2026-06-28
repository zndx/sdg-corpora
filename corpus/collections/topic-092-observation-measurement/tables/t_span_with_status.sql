CREATE TABLE t_span_with_status (
  id VARCHAR(255),
  span VARCHAR(255),
  span_status VARCHAR(255) NOT NULL,
  retry_count INTEGER,
  status VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (span_status) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"07_long_tail","is_complex":true,"template_id":"span_with_status"}'
