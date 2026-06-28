CREATE TABLE t_farmland_acquisition_process (
  id VARCHAR(255),
  farmland_acquisition_process VARCHAR(255),
  targets_investor VARCHAR(255) NOT NULL,
  acquires_land VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"farmland_acquisition_process"}'
