CREATE TABLE t_outlier_detection_produces_claim (
  id VARCHAR(255),
  outlier VARCHAR(255),
  produces VARCHAR(255) NOT NULL,
  log_level VARCHAR(255),
  phase VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (produces) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"outlier_detection_produces_claim"}'
