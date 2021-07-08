-- Eliminación de tablas, tipos y extensiones
DROP TABLE IF EXISTS gyms;
DROP TABLE IF EXISTS leaders;
DROP TABLE IF EXISTS trainers;
DROP TABLE IF EXISTS pokemons_elements;
DROP TABLE IF EXISTS pokemons;
DROP TABLE IF EXISTS elements;

DROP TYPE IF EXISTS types;
DROP EXTENSION IF EXISTS "uuid-ossp";

-- Creación de extensiones y tipos
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TYPE types AS ENUM (
  'rock', 'ground', 'water', 'psychic', 'electric',
  'grass', 'poison', 'bug', 'fire', 'normal'
);

-- Creación de tablas
CREATE TABLE IF NOT EXISTS pokemons (
  id smallint PRIMARY KEY NOT NULL,
  name TEXT NOT NULL,
  level smallint NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS elements (
  id uuid PRIMARY KEY NOT NULL DEFAULT uuid_generate_v4(),
  name types NOT NULL
);

CREATE TABLE IF NOT EXISTS pokemons_elements (
  pokemon_id smallint REFERENCES pokemons (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  element_id uuid REFERENCES elements (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT pokemon_element_id PRIMARY KEY (pokemon_id, element_id)
);

-- Inserción de filas para "POKÉMONS"
INSERT INTO pokemons (
  id, name, level
) VALUES (
  74, 'Geodude', 10
);

INSERT INTO pokemons (
  id, name, level
) VALUES (
  95, 'Onix', 12
);

INSERT INTO pokemons (
  id, name, level
) VALUES (
  120, 'Staryu', 18
);

INSERT INTO pokemons (
  id, name, level
) VALUES (
  121, 'Starmie', 21
);

INSERT INTO pokemons (
  id, name, level
) VALUES (
  26, 'Raichu', 28
);

INSERT INTO pokemons (
  id, name, level
) VALUES (
  114, 'Tangela', 30
);

INSERT INTO pokemons (
  id, name, level
) VALUES (
  70, 'Weepinbell', 32
);

INSERT INTO pokemons (
  id, name, level
) VALUES (
  44, 'Gloom', 32
);

INSERT INTO pokemons (
  id, name, level
) VALUES (
  48, 'Venonat', 44
);

INSERT INTO pokemons (
  id, name, level
) VALUES (
  49, 'Venomoth', 50
);

INSERT INTO pokemons (
  id, name, level
) VALUES (
  63, 'Abra', 50
);

INSERT INTO pokemons (
  id, name, level
) VALUES (
  64, 'Kadabra', 50
);

INSERT INTO pokemons (
  id, name, level
) VALUES (
  65, 'Alakazam', 50
);

INSERT INTO pokemons (
  id, name, level
) VALUES (
  38, 'Ninetales', 48
);

INSERT INTO pokemons (
  id, name, level
) VALUES (
  78, 'Rapidash', 50
);

INSERT INTO pokemons (
  id, name, level
) VALUES (
  59, 'Arcanine', 54
);

INSERT INTO pokemons (
  id, name, level
) VALUES (
  51, 'Dugtrio', 50
);

INSERT INTO pokemons (
  id, name, level
) VALUES (
  53, 'Persian', 53
);

INSERT INTO pokemons (
  id, name, level
) VALUES (
  31, 'Nidoqueen', 53
);

INSERT INTO pokemons (
  id, name, level
) VALUES (
  34, 'Nidoking', 55
);

INSERT INTO pokemons (
  id, name, level
) VALUES (
  112, 'Rhydon', 55
);

-- Inserción de filas para "ELEMENTS"
INSERT INTO elements (
  name
) VALUES (
  'rock'::types
);

INSERT INTO elements (
  name
) VALUES (
  'ground'::types
);

INSERT INTO elements (
  name
) VALUES (
  'water'::types
);

INSERT INTO elements (
  name
) VALUES (
  'psychic'::types
);

INSERT INTO elements (
  name
) VALUES (
  'electric'::types
);

INSERT INTO elements (
  name
) VALUES (
  'grass'::types
);

INSERT INTO elements (
  name
) VALUES (
  'poison'::types
);

INSERT INTO elements (
  name
) VALUES (
  'bug'::types
);

INSERT INTO elements (
  name
) VALUES (
  'fire'::types
);

INSERT INTO elements (
  name
) VALUES (
  'normal'::types
);

-- Inserción de filas para "POKEMONS_ELEMENTS"
INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Geodude'),
  (SELECT id FROM elements WHERE name = 'rock')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Geodude'),
  (SELECT id FROM elements WHERE name = 'ground')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Onix'),
  (SELECT id FROM elements WHERE name = 'rock')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Onix'),
  (SELECT id FROM elements WHERE name = 'ground')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Staryu'),
  (SELECT id FROM elements WHERE name = 'water')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Starmie'),
  (SELECT id FROM elements WHERE name = 'water')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Starmie'),
  (SELECT id FROM elements WHERE name = 'psychic')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Raichu'),
  (SELECT id FROM elements WHERE name = 'electric')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Tangela'),
  (SELECT id FROM elements WHERE name = 'grass')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Weepinbell'),
  (SELECT id FROM elements WHERE name = 'grass')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Weepinbell'),
  (SELECT id FROM elements WHERE name = 'poison')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Gloom'),
  (SELECT id FROM elements WHERE name = 'grass')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Gloom'),
  (SELECT id FROM elements WHERE name = 'poison')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Venonat'),
  (SELECT id FROM elements WHERE name = 'bug')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Venonat'),
  (SELECT id FROM elements WHERE name = 'poison')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Venomoth'),
  (SELECT id FROM elements WHERE name = 'bug')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Venomoth'),
  (SELECT id FROM elements WHERE name = 'poison')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Abra'),
  (SELECT id FROM elements WHERE name = 'psychic')
); 

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Kadabra'),
  (SELECT id FROM elements WHERE name = 'psychic')
); 

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Alakazam'),
  (SELECT id FROM elements WHERE name = 'psychic')
); 

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Ninetales'),
  (SELECT id FROM elements WHERE name = 'fire')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Rapidash'),
  (SELECT id FROM elements WHERE name = 'fire')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Arcanine'),
  (SELECT id FROM elements WHERE name = 'fire')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Dugtrio'),
  (SELECT id FROM elements WHERE name = 'ground')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Persian'),
  (SELECT id FROM elements WHERE name = 'normal')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Nidoqueen'),
  (SELECT id FROM elements WHERE name = 'poison')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Nidoqueen'),
  (SELECT id FROM elements WHERE name = 'ground')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Nidoking'),
  (SELECT id FROM elements WHERE name = 'poison')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Nidoking'),
  (SELECT id FROM elements WHERE name = 'ground')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Rhydon'),
  (SELECT id FROM elements WHERE name = 'ground')
);

INSERT INTO pokemons_elements (
  pokemon_id, element_id
) VALUES (
  (SELECT id FROM pokemons WHERE name LIKE 'Rhydon'),
  (SELECT id FROM elements WHERE name = 'rock')
);
