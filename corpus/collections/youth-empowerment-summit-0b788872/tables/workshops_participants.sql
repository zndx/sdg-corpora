CREATE TABLE workshops_participants (
  conference_workshop_id INTEGER NOT NULL,
  youth_participant_id INTEGER NOT NULL,
  PRIMARY KEY (conference_workshop_id, youth_participant_id),
  FOREIGN KEY (conference_workshop_id) REFERENCES conference_workshops (conference_workshop_id),
  FOREIGN KEY (youth_participant_id) REFERENCES youth_participants (id)
);
