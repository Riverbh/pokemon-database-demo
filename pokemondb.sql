create table pokemon_species(
	id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  gen INT NOT NULL,
  primary_color VARCHAR NOT NULL
);

CREATE TABLE pokemon_individuals(
	id SERIAL PRIMARY KEY,
  pokemon_species_id INT NOT NULL REFERENCES pokemon_species(id),
  temperment VARCHAR NOT NULL,
  nickname VARCHAR,
  level INT NOT NULL,
  is_shiny boolean NOT NULL
);

CREATE TABLE trainers(
	id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  age INT NOT NULL,
  badges_acquired INT NOT NULL,
  pokemon_individual_id INT NOT NULL REFERENCES pokemon_individuals(id)
);

CREATE TABLE pokemon_moves(
	id SERIAL PRIMARY KEY,
  pokemon_individual_id INT NOT NULL REFERENCES pokemon_individuals(id),
  move_id INT NOT NULL REFERENCES moves(id)
);



CREATE TABLE moves(
	id SERIAL PRIMARY KEY,
  power INT,
  effect VARCHAR,
  type VARCHAR NOT NULL,
  acuracy_percentage INT NOT NULL
);


INSERT INTO pokemon_species (name, primary_color, gen) Values
('Charizard', 'orange', 1),
('Pikachu', 'yellow', 1);

select * from pokemon_species

INSERT INTO pokemon_individuals (pokemon_species_id,
temperment, nickname, level, is_shiny) Values
(2, 'rowdy', 'bonsai', 32, FALSE),
(1, 'sleepy', NULL, 50, FALSE),
(1, 'docile', 'spitter', 98, TRUE);

SELECT * FROM pokemon_individuals

ALTER TABLE moves ADD name VARCHAR NOT NULL UNIQUE;

INSERT INTO moves (type, power, effect, 
acuracy_percentage, name) VALUES
('normal', NULL, 'acuracy reduced', 100, 'sand attack'),
('air', 100, NULL, '100', 'idk');


select * from moves

INSERT INTO pokemon_moves (move_id, pokemon_individual_id)
VALUES
(1, 2),
(1, 1),
(2, 1),
(2, 2);

insert into trainers(name, age, badges_acquired, pokemon_individual_id)
Values ('Ash', 10, 108, 1);

select * from pokemon_moves;
select * from moves;
select * from pokemon_species