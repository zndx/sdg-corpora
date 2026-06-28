CREATE TABLE t_ebpfevent_via_program_xref (
  id VARCHAR(255),
  ebpfevent VARCHAR(255),
  log_level VARCHAR(255),
  phase VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"ebpfevent_via_program_xref"}'
