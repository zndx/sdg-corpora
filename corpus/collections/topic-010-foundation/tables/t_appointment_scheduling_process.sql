CREATE TABLE t_appointment_scheduling_process (
  id VARCHAR(255),
  appointment_scheduling_process VARCHAR(255),
  operator VARCHAR(255) NOT NULL,
  targets_artifact VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"appointment_scheduling_process"}'
