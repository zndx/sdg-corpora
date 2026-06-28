CREATE TABLE t_ganglion_cyst_imaging_finding (
  id VARCHAR(255),
  ganglion_cyst_imaging_finding VARCHAR(255),
  visualizes VARCHAR(255) NOT NULL,
  encoding VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"08_derived","is_complex":false,"template_id":"ganglion_cyst_imaging_finding"}'
