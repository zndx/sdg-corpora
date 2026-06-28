CREATE TABLE t_outlier_detection_uses_explainer (
  id VARCHAR(255),
  outlier VARCHAR(255),
  uses VARCHAR(255) NOT NULL,
  exit_code INTEGER,
  log_level VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (uses) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"outlier_detection_uses_explainer"}'
