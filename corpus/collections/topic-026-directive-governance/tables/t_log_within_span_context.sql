CREATE TABLE t_log_within_span_context (
  id VARCHAR(255),
  log VARCHAR(255),
  within_span_context VARCHAR(255) NOT NULL,
  license VARCHAR(255),
  size_bytes BIGINT,
  PRIMARY KEY (id),
  FOREIGN KEY (within_span_context) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"log_within_span_context"}'
