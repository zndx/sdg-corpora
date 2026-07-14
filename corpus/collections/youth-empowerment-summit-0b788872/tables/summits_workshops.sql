CREATE TABLE summits_workshops (
  youth_empowerment_summit_id INTEGER NOT NULL,
  conference_workshop_id INTEGER NOT NULL,
  PRIMARY KEY (youth_empowerment_summit_id, conference_workshop_id),
  FOREIGN KEY (youth_empowerment_summit_id) REFERENCES youth_empowerment_summits (youth_empowerment_summit_id),
  FOREIGN KEY (conference_workshop_id) REFERENCES conference_workshops (conference_workshop_id)
);
