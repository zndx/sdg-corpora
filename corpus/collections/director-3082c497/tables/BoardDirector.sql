CREATE TABLE BoardDirector (
  boardId INTEGER NOT NULL,
  directorId INTEGER NOT NULL,
  PRIMARY KEY (boardId, directorId),
  FOREIGN KEY (boardId) REFERENCES Board (boardId),
  FOREIGN KEY (directorId) REFERENCES Director (id)
);
