CREATE TABLE t_crop_parasitism_impact (
  id VARCHAR(255),
  crop_parasitism_impact VARCHAR(255),
  affects_cultivation_system VARCHAR(255),
  parasitises_host VARCHAR(255),
  impacts_target VARCHAR(255) NOT NULL,
  encoding VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"08_derived","is_complex":true,"template_id":"crop_parasitism_impact"}'
