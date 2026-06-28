CREATE TABLE t_census_reporting_event (
  id VARCHAR(255),
  census_reporting_event VARCHAR(255),
  occurs_during_period VARCHAR(255),
  tracks_sector VARCHAR(255),
  published_on_date VARCHAR(255) NOT NULL,
  encoding VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"08_derived","is_complex":true,"template_id":"census_reporting_event"}'
