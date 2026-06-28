CREATE TABLE t_perf_event_subclass (
  id VARCHAR(255),
  perf VARCHAR(255),
  perf_event_config VARCHAR(255) NOT NULL,
  version INTEGER,
  location VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (perf_event_config) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"perf_event_subclass"}'
