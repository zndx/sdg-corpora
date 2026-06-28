CREATE TABLE t_ebpfevent_at_kernel_hook_xref (
  id VARCHAR(255),
  ebpfevent VARCHAR(255),
  duration_seconds DECIMAL(38,9),
  host_name VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"04_ebpf_kernel","is_complex":true,"template_id":"ebpfevent_at_kernel_hook_xref"}'
