CREATE TABLE development_agencies (
  id INTEGER NOT NULL,
  agency_code VARCHAR(32),
  agency_name VARCHAR(37),
  country_of_origin VARCHAR(32),
  funding_program VARCHAR(32),
  established_year INTEGER,
  research_desk_id INTEGER,
  funds_research_desk_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (research_desk_id) REFERENCES research_desks (research_desk_id),
  FOREIGN KEY (funds_research_desk_id) REFERENCES research_desks (research_desk_id)
);
