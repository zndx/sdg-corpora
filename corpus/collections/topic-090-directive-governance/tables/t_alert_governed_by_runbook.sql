CREATE TABLE t_alert_governed_by_runbook (
  id VARCHAR(255),
  alert VARCHAR(255),
  priority INTEGER,
  encoding VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"alert_governed_by_runbook"}'
