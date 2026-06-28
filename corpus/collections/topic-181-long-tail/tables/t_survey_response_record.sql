CREATE TABLE t_survey_response_record (
  id VARCHAR(255),
  survey_response_record VARCHAR(255),
  captures_profile_attribute VARCHAR(255) NOT NULL,
  encoding VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"08_derived","is_complex":false,"template_id":"survey_response_record"}'
