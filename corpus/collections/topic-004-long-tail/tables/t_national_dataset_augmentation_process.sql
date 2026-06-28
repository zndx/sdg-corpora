CREATE TABLE t_national_dataset_augmentation_process (
  id VARCHAR(255),
  national_dataset_augmentation_process VARCHAR(255),
  incorporates_observation_source VARCHAR(255) NOT NULL,
  augments_existing_dataset VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"national_dataset_augmentation_process"}'
