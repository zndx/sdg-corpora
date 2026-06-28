CREATE TABLE t_dempster_conflict_mass (
  id VARCHAR(255),
  dempster VARCHAR(255),
  conflict_mass VARCHAR(255) NOT NULL,
  label_text VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (conflict_mass) REFERENCES t_measurement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"dempster_conflict_mass"}'
