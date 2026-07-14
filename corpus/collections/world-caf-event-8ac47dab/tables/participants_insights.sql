CREATE TABLE participants_insights (
  field_participant_id INTEGER NOT NULL,
  prevention_insight_id INTEGER NOT NULL,
  PRIMARY KEY (field_participant_id, prevention_insight_id),
  FOREIGN KEY (field_participant_id) REFERENCES field_participants (id),
  FOREIGN KEY (prevention_insight_id) REFERENCES prevention_insights (id)
);
