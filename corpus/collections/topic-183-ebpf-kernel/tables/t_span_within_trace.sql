CREATE TABLE t_span_within_trace (
  id VARCHAR(255),
  span VARCHAR(255),
  part_of VARCHAR(255) NOT NULL,
  scheduled_at TIMESTAMP,
  status VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (part_of) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"span_within_trace"}'
