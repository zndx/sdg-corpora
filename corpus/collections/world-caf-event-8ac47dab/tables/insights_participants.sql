CREATE TABLE insights_participants (
  prevention_insight_id INTEGER NOT NULL,
  field_participant_id INTEGER NOT NULL,
  PRIMARY KEY (prevention_insight_id, field_participant_id),
  FOREIGN KEY (prevention_insight_id) REFERENCES prevention_insights (id),
  FOREIGN KEY (field_participant_id) REFERENCES field_participants (id)
);
