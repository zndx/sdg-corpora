CREATE TABLE t_schemaorg_event_location (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  event_location VARCHAR(255) NOT NULL,
  created_date DATE,
  identifier VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (event_location) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_event_location"}'
