CREATE TABLE t_schemaorg_event_organizer (
  id VARCHAR(255),
  schemaorg VARCHAR(255),
  organizer VARCHAR(255) NOT NULL,
  created_date DATE,
  owner VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (organizer) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"schemaorg_event_organizer"}'
