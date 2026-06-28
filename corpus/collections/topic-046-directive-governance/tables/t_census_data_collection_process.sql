CREATE TABLE t_census_data_collection_process (
  id VARCHAR(255),
  census_data_collection_process VARCHAR(255),
  involves_screening VARCHAR(255) NOT NULL,
  includes_survey VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"census_data_collection_process"}'
