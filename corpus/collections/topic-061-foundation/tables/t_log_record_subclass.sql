CREATE TABLE t_log_record_subclass (
  id VARCHAR(255),
  subject VARCHAR(255),
  log_severity VARCHAR(255) NOT NULL,
  created_date DATE,
  identifier VARCHAR(255),
  version INTEGER,
  location VARCHAR(255),
  name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (log_severity) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"log_record_subclass"}'
