CREATE TABLE t_professional_experience (
  id VARCHAR(255),
  professional_experience VARCHAR(255),
  holder VARCHAR(255) NOT NULL,
  organization VARCHAR(255) NOT NULL,
  encoding VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"08_derived","is_complex":true,"template_id":"professional_experience"}'
