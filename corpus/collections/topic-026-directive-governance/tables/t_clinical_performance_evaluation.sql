CREATE TABLE t_clinical_performance_evaluation (
  id VARCHAR(255),
  clinical_performance_evaluation VARCHAR(255),
  utilizes VARCHAR(255) NOT NULL,
  evaluates VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity","bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"clinical_performance_evaluation"}'
