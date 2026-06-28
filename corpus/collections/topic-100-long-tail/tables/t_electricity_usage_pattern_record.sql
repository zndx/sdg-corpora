CREATE TABLE t_electricity_usage_pattern_record (
  id VARCHAR(255),
  usage_pattern_record VARCHAR(255),
  records_service_category VARCHAR(255) NOT NULL,
  corresponds_to_tariff VARCHAR(255) NOT NULL,
  encoding VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"08_derived","is_complex":true,"template_id":"electricity_usage_pattern_record"}'
