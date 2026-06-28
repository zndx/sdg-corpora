CREATE TABLE t_span_with_trace_id (
  id VARCHAR(255),
  span VARCHAR(255),
  trace_id VARCHAR(255) NOT NULL,
  end_time TIMESTAMP,
  triggered_by VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (trace_id) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"07_long_tail","is_complex":true,"template_id":"span_with_trace_id"}'
