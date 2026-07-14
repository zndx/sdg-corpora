CREATE TABLE HotlineIncident (
  hotlineId INTEGER NOT NULL,
  incidentId INTEGER NOT NULL,
  PRIMARY KEY (hotlineId, incidentId),
  FOREIGN KEY (hotlineId) REFERENCES Hotline (id),
  FOREIGN KEY (incidentId) REFERENCES Incident (id)
);
