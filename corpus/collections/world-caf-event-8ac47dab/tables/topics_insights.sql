CREATE TABLE topics_insights (
  burglary_prevention_topic_id INTEGER NOT NULL,
  prevention_insight_id INTEGER NOT NULL,
  PRIMARY KEY (burglary_prevention_topic_id, prevention_insight_id),
  FOREIGN KEY (burglary_prevention_topic_id) REFERENCES burglary_prevention_topics (id),
  FOREIGN KEY (prevention_insight_id) REFERENCES prevention_insights (id)
);
