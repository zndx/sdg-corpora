CREATE TABLE t_ebpf_event_basic (
  id VARCHAR(255),
  ebpf VARCHAR(255),
  exit_code INTEGER,
  host_name VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":false,"template_id":"ebpf_event_basic"}'
