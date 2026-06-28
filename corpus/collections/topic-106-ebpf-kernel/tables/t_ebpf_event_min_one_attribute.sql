CREATE TABLE t_ebpf_event_min_one_attribute (
  id VARCHAR(255),
  ebpf VARCHAR(255),
  scheduled_at TIMESTAMP,
  status VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"ebpf_event_min_one_attribute"}'
