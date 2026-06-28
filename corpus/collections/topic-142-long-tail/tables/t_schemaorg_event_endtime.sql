CREATE TABLE t_schemaorg_event_endtime (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  event_end_time VARCHAR(255) NOT NULL,
  checksum VARCHAR(255),
  name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (event_end_time) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_event_endtime"}'
