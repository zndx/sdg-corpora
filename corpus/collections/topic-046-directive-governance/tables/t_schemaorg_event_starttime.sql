CREATE TABLE t_schemaorg_event_starttime (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  event_start_time VARCHAR(255) NOT NULL,
  mime_type VARCHAR(255),
  location VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (event_start_time) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_event_starttime"}'
