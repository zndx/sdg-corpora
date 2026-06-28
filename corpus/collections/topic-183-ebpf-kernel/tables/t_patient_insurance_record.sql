CREATE TABLE t_patient_insurance_record (
  id VARCHAR(255),
  patient_insurance_record VARCHAR(255),
  contains_data_element VARCHAR(255) NOT NULL,
  label_text VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"08_derived","is_complex":true,"template_id":"patient_insurance_record"}'
