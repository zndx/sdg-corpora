CREATE TABLE agreements_participants (
  group_agreement_id INTEGER NOT NULL,
  participant_id INTEGER NOT NULL,
  PRIMARY KEY (group_agreement_id, participant_id),
  FOREIGN KEY (group_agreement_id) REFERENCES group_agreements (group_agreement_id),
  FOREIGN KEY (participant_id) REFERENCES participants (participant_id)
);
