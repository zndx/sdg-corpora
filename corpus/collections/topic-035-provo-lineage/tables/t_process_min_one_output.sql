CREATE TABLE t_process_min_one_output (
  id VARCHAR(255),
  process VARCHAR(255),
  output VARCHAR(255) NOT NULL,
  end_time TIMESTAMP,
  triggered_by VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (output) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"07_long_tail","is_complex":true,"template_id":"process_min_one_output"}'
