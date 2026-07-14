CREATE TABLE participants_workshops (
  youth_participant_id INTEGER NOT NULL,
  conference_workshop_id INTEGER NOT NULL,
  PRIMARY KEY (youth_participant_id, conference_workshop_id),
  FOREIGN KEY (youth_participant_id) REFERENCES youth_participants (id),
  FOREIGN KEY (conference_workshop_id) REFERENCES conference_workshops (conference_workshop_id)
);
