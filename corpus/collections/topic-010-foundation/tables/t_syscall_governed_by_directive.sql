CREATE TABLE t_syscall_governed_by_directive (
  id VARCHAR(255),
  syscall VARCHAR(255),
  mandatory BOOLEAN,
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"syscall_governed_by_directive"}'
