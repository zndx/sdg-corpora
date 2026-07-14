CREATE TABLE meetings_directors (
  forum_meeting_id INTEGER NOT NULL,
  director_id INTEGER NOT NULL,
  PRIMARY KEY (forum_meeting_id, director_id),
  FOREIGN KEY (forum_meeting_id) REFERENCES forum_meetings (id),
  FOREIGN KEY (director_id) REFERENCES safety_directors (director_id)
);
