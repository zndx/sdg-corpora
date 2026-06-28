CREATE TABLE t_gdpr_data_subject_right (
  id VARCHAR(255),
  gdpr VARCHAR(255),
  grants_data_subject_right VARCHAR(255) NOT NULL,
  scope VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (grants_data_subject_right) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"gdpr_data_subject_right"}'
