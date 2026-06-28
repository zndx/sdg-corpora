CREATE TABLE t_qualifications_framework (
  id VARCHAR(255),
  qualifications VARCHAR(255),
  articulates VARCHAR(255) NOT NULL,
  specifies VARCHAR(255) NOT NULL,
  encoding VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"08_derived","is_complex":true,"template_id":"qualifications_framework"}'
