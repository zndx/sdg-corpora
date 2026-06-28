CREATE TABLE t_campus_event_participation (
  id VARCHAR(255),
  campus_event VARCHAR(255),
  has_participant VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Occurrent"],"family":"08_derived","is_complex":true,"template_id":"campus_event_participation"}'
