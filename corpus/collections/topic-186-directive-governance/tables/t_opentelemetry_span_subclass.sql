CREATE TABLE t_opentelemetry_span_subclass (
  id VARCHAR(255),
  opentelemetry VARCHAR(255),
  span_context VARCHAR(255) NOT NULL,
  exit_code INTEGER,
  status VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (span_context) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"07_long_tail","is_complex":true,"template_id":"opentelemetry_span_subclass"}'
