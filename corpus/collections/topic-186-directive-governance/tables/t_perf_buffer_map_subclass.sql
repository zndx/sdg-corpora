CREATE TABLE t_perf_buffer_map_subclass (
  id VARCHAR(255),
  perf VARCHAR(255),
  perf_buffer_config VARCHAR(255) NOT NULL,
  created_date DATE,
  identifier VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (perf_buffer_config) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"perf_buffer_map_subclass"}'
