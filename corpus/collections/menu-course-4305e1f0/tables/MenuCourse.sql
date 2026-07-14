CREATE TABLE MenuCourse (
  id INTEGER NOT NULL,
  courseIdentifier VARCHAR(32),
  courseName VARCHAR(32),
  price DECIMAL,
  isVegetarian BOOLEAN,
  isVegan BOOLEAN,
  description VARCHAR(32),
  packageId INTEGER,
  ingredientId VARCHAR(42),
  PRIMARY KEY (id),
  FOREIGN KEY (packageId) REFERENCES DiningPackage (id),
  FOREIGN KEY (ingredientId) REFERENCES FoodIngredient (ingredientId)
);
