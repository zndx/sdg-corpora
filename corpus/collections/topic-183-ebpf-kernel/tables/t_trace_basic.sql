CREATE TABLE t_trace_basic (
  id VARCHAR(255),
  trace VARCHAR(255),
  observed_at VARCHAR(255) NOT NULL,
  duration_seconds DECIMAL(38,9),
  end_time TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (observed_at) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"trace_basic"}'
