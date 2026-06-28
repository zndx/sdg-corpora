CREATE TABLE t_outlier_detection_with_baseline (
  id VARCHAR(255),
  outlier VARCHAR(255),
  against VARCHAR(255) NOT NULL,
  host_name VARCHAR(255),
  triggered_by VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (against) REFERENCES t_ebpfevent_observes_syscall_xref(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"outlier_detection_with_baseline"}'
