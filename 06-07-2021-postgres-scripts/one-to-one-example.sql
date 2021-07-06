-- Eliminación de tablas, tipos y extensiones
DROP TABLE IF EXISTS gyms;
DROP TABLE IF EXISTS leaders;
DROP TABLE IF EXISTS pokemons_elements;
DROP TABLE IF EXISTS elements;
DROP TABLE IF EXISTS pokemons;
DROP TABLE IF EXISTS trainers;

DROP TYPE IF EXISTS types;
DROP EXTENSION IF EXISTS "uuid-ossp";

-- Creación de extensiones y tipos
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TYPE types AS ENUM (
  'rock', 'ground', 'water', 'psychic', 'electric',
  'grass', 'poison', 'bug', 'fire', 'normal'
);

-- Creación de tablas
CREATE TABLE IF NOT EXISTS leaders (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  badge TEXT NOT NULL,
  description TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS gyms (
  id SERIAL PRIMARY KEY,
  type types[] NOT NULL,
  city TEXT NOT NULL,
  leader_id uuid REFERENCES leaders
    ON UPDATE CASCADE
    ON DELETE SET NULL
);

-- Inserción de filas para "LEADERS"
INSERT INTO leaders (
  name, badge, description
) VALUES (
  'Brock', 'Boulder Badge', 'Rock type Pokémon'
);

INSERT INTO leaders (
  name, badge, description
) VALUES (
  'Misty', 'Cascade Badge', 'Water type Pokémon'
);

INSERT INTO leaders (
  name, badge, description
) VALUES (
  'Lt. Surge', 'Thunder Badge', 'Electric type Pokémon'
);

INSERT INTO leaders (
  name, badge, description
) VALUES (
  'Erika', 'Rainbow Badge', 'Grass type Pokémon'
);

INSERT INTO leaders (
  name, badge, description
) VALUES (
  'Koga', 'Soul Badge', 'Poison type Pokémon'
);

INSERT INTO leaders (
  name, badge, description
) VALUES (
  'Sabrina', 'Marsh Badge', 'Psychic type Pokémon'
);

INSERT INTO leaders (
  name, badge, description
) VALUES (
  'Blaine', 'Volcano Badge', 'Fire type Pokémon'
);

INSERT INTO leaders (
  name, badge, description
) VALUES (
  'Giovanni', 'Earth Badge', 'Ground type Pokémon'
);

-- Inserción de filas para "GYMS"
INSERT INTO gyms (
  type, city, leader_id
) VALUES (
  ARRAY['rock', 'ground']::types[], 'Pewter City', (
    SELECT id FROM leaders WHERE name LIKE 'Brock'
  )
);

INSERT INTO gyms (
  type, city, leader_id
) VALUES (
  ARRAY['water', 'psychic']::types[], 'Cerulean City', (
    SELECT id FROM leaders WHERE name LIKE 'Misty'
  )
);

INSERT INTO gyms (
  type, city, leader_id
) VALUES (
  ARRAY['electric']::types[], 'Vermilion City', (
    SELECT id FROM leaders WHERE name LIKE 'Lt. Surge'
  )
);

INSERT INTO gyms (
  type, city, leader_id
) VALUES (
  ARRAY['grass', 'poison']::types[], 'Celadon City', (
    SELECT id FROM leaders WHERE name LIKE 'Erika'
  )
);

INSERT INTO gyms (
  type, city, leader_id
) VALUES (
  ARRAY['bug', 'poison']::types[], 'Fuchsia City', (
    SELECT id FROM leaders WHERE name LIKE 'Koga'
  )
);

INSERT INTO gyms (
  type, city, leader_id
) VALUES (
  ARRAY['psychic']::types[], 'Saffron City', (
    SELECT id FROM leaders WHERE name LIKE 'Sabrina'
  )
);

INSERT INTO gyms (
  type, city, leader_id
) VALUES (
  ARRAY['fire']::types[], 'Cinnabar City', (
    SELECT id FROM leaders WHERE name LIKE 'Blaine'
  )
);

INSERT INTO gyms (
  type, city, leader_id
) VALUES (
  ARRAY['ground', 'normal', 'poison', 'ground', 'rock']::types[], 'Viridian City', (
    SELECT id FROM leaders WHERE name LIKE 'Giovanni'
  )
);

