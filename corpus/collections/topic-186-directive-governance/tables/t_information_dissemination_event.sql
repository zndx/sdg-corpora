CREATE TABLE t_information_dissemination_event (
  id VARCHAR(255),
  information_dissemination_event VARCHAR(255),
  utilizes_channel VARCHAR(255) NOT NULL,
  reaches_audience VARCHAR(255) NOT NULL,
  has_participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"information_dissemination_event"}'
