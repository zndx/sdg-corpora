CREATE TABLE t_process_with_participant (
  id VARCHAR(255),
  process VARCHAR(255),
  related VARCHAR(255) NOT NULL,
  exit_code INTEGER,
  triggered_by VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (related) REFERENCES t_verification_subclass(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"01_foundation","is_complex":true,"template_id":"process_with_participant"}'
