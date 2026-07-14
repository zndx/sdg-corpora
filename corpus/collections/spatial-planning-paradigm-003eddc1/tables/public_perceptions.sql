CREATE TABLE public_perceptions (
  public_perception_id INTEGER NOT NULL,
  perception_id VARCHAR(32),
  methodology VARCHAR(32),
  subject VARCHAR(32),
  sentiment_score DECIMAL,
  survey_date TIMESTAMP,
  natural_feature_id INTEGER,
  spatial_planning_zone_id INTEGER,
  PRIMARY KEY (public_perception_id),
  FOREIGN KEY (natural_feature_id) REFERENCES natural_features (id),
  FOREIGN KEY (spatial_planning_zone_id) REFERENCES spatial_planning_zones (spatial_planning_zone_id)
);
