CREATE TABLE t_chemical_exposure_risk_profile (
  id VARCHAR(255),
  chemical_exposure_risk_profile VARCHAR(255),
  assesses_exposure_to VARCHAR(255) NOT NULL,
  estimates_impact_on VARCHAR(255) NOT NULL,
  encoding VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"08_derived","is_complex":true,"template_id":"chemical_exposure_risk_profile"}'
