CREATE TABLE t_ebpf_program_governed_by_directive (
  id VARCHAR(255),
  ebpf VARCHAR(255),
  effective_date DATE,
  mandatory BOOLEAN,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"ebpf_program_governed_by_directive"}'
