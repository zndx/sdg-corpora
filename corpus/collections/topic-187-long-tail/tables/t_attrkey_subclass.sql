CREATE TABLE t_attrkey_subclass (
  id VARCHAR(255),
  attrkey VARCHAR(255),
  describes_property VARCHAR(255) NOT NULL,
  format VARCHAR(255),
  namespace VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (describes_property) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DesignativeICE"],"family":"01_foundation","is_complex":true,"template_id":"attrkey_subclass"}'
