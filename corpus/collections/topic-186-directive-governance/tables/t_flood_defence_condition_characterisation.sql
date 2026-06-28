CREATE TABLE t_flood_defence_condition_characterisation (
  id VARCHAR(255),
  flood_defence_condition_characterisation VARCHAR(255),
  involves_earth_observation_data VARCHAR(255) NOT NULL,
  employs_validation_process VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"flood_defence_condition_characterisation"}'
