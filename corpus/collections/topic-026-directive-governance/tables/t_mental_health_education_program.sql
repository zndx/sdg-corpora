CREATE TABLE t_mental_health_education_program (
  id VARCHAR(255),
  mental_health_education_program VARCHAR(255),
  delivered_presentation VARCHAR(255) NOT NULL,
  targets_demographic VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"mental_health_education_program"}'
