CREATE TABLE contexts_interventions (
  decision_context_id INTEGER NOT NULL,
  intervention_id INTEGER NOT NULL,
  PRIMARY KEY (decision_context_id, intervention_id),
  FOREIGN KEY (decision_context_id) REFERENCES decision_contexts (decision_context_id),
  FOREIGN KEY (intervention_id) REFERENCES interventions (id)
);
