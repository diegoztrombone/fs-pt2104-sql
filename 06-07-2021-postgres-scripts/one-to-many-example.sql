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
CREATE TABLE IF NOT EXISTS trainers (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  badge TEXT NOT NULL,
  description TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS pokemons (
  id smallint PRIMARY KEY NOT NULL,
  name TEXT NOT NULL,
  level smallint NOT NULL DEFAULT 1,
  type types[] NOT NULL,
  trainer_id uuid REFERENCES trainers
    ON UPDATE CASCADE
    ON DELETE SET NULL
);

-- Inserción de filas para "TRAINERS"
INSERT INTO trainers (
  name, badge, description
) VALUES (
  'Brock', 'Boulder Badge', 'Rock type Pokémon'
);

INSERT INTO trainers (
  name, badge, description
) VALUES (
  'Misty', 'Cascade Badge', 'Water type Pokémon'
);

INSERT INTO trainers (
  name, badge, description
) VALUES (
  'Lt. Surge', 'Thunder Badge', 'Electric type Pokémon'
);

INSERT INTO trainers (
  name, badge, description
) VALUES (
  'Erika', 'Rainbow Badge', 'Grass type Pokémon'
);

INSERT INTO trainers (
  name, badge, description
) VALUES (
  'Koga', 'Soul Badge', 'Poison type Pokémon'
);

INSERT INTO trainers (
  name, badge, description
) VALUES (
  'Sabrina', 'Marsh Badge', 'Psychic type Pokémon'
);

INSERT INTO trainers (
  name, badge, description
) VALUES (
  'Blaine', 'Volcano Badge', 'Fire type Pokémon'
);

INSERT INTO trainers (
  name, badge, description
) VALUES (
  'Giovanni', 'Earth Badge', 'Ground type Pokémon'
);

-- Inserción de filas para "POKÉMONS"
INSERT INTO pokemons (
  id, name, level, type, trainer_id
) VALUES (
  74, 'Geodude', 10, ARRAY['rock', 'ground']::types[], (
    SELECT id FROM trainers WHERE name LIKE 'Brock'
  )
);

INSERT INTO pokemons (
  id, name, level, type, trainer_id
) VALUES (
  95, 'Onix', 12, ARRAY['rock', 'ground']::types[], (
    SELECT id FROM trainers WHERE name LIKE 'Brock'
  )
);

INSERT INTO pokemons (
  id, name, level, type, trainer_id
) VALUES (
  120, 'Staryu', 18, ARRAY['water']::types[], (
    SELECT id FROM trainers WHERE name LIKE 'Misty'
  )
);

INSERT INTO pokemons (
  id, name, level, type, trainer_id
) VALUES (
  121, 'Starmie', 21, ARRAY['water', 'psychic']::types[], (
    SELECT id FROM trainers WHERE name LIKE 'Misty'
  )
);

INSERT INTO pokemons (
  id, name, level, type, trainer_id
) VALUES (
  26, 'Raichu', 28, ARRAY['electric']::types[], (
    SELECT id FROM trainers WHERE name LIKE 'Lt. Surge'
  )
);

INSERT INTO pokemons (
  id, name, level, type, trainer_id
) VALUES (
  114, 'Tangela', 30, ARRAY['grass']::types[], (
    SELECT id FROM trainers WHERE name LIKE 'Erika'
  )
);

INSERT INTO pokemons (
  id, name, level, type, trainer_id
) VALUES (
  70, 'Weepinbell', 32, ARRAY['grass', 'poison']::types[], (
    SELECT id FROM trainers WHERE name LIKE 'Erika'
  )
);

INSERT INTO pokemons (
  id, name, level, type, trainer_id
) VALUES (
  44, 'Gloom', 32, ARRAY['grass', 'poison']::types[], (
    SELECT id FROM trainers WHERE name LIKE 'Erika'
  )
);

INSERT INTO pokemons (
  id, name, level, type, trainer_id
) VALUES (
  48, 'Venonat', 44, ARRAY['bug', 'poison']::types[], (
    SELECT id FROM trainers WHERE name LIKE 'Koga'
  )
);

INSERT INTO pokemons (
  id, name, level, type, trainer_id
) VALUES (
  49, 'Venomoth', 50, ARRAY['bug', 'poison']::types[], (
    SELECT id FROM trainers WHERE name LIKE 'Koga'
  )
);

INSERT INTO pokemons (
  id, name, level, type, trainer_id
) VALUES (
  63, 'Abra', 50, ARRAY['psychic']::types[], (
    SELECT id FROM trainers WHERE name LIKE 'Sabrina'
  )
);

INSERT INTO pokemons (
  id, name, level, type, trainer_id
) VALUES (
  64, 'Kadabra', 50, ARRAY['psychic']::types[], (
    SELECT id FROM trainers WHERE name LIKE 'Sabrina'
  )
);

INSERT INTO pokemons (
  id, name, level, type, trainer_id
) VALUES (
  38, 'Ninetales', 48, ARRAY['fire']::types[], (
    SELECT id FROM trainers WHERE name LIKE 'Blaine'
  )
);

INSERT INTO pokemons (
  id, name, level, type, trainer_id
) VALUES (
  78, 'Rapidash', 50, ARRAY['fire']::types[], (
    SELECT id FROM trainers WHERE name LIKE 'Blaine'
  )
);

INSERT INTO pokemons (
  id, name, level, type, trainer_id
) VALUES (
  59, 'Arcanine', 54, ARRAY['fire']::types[], (
    SELECT id FROM trainers WHERE name LIKE 'Blaine'
  )
);

INSERT INTO pokemons (
  id, name, level, type, trainer_id
) VALUES (
  51, 'Dugtrio', 50, ARRAY['ground']::types[], (
    SELECT id FROM trainers WHERE name LIKE 'Giovanni'
  )
);

INSERT INTO pokemons (
  id, name, level, type, trainer_id
) VALUES (
  53, 'Persian', 53, ARRAY['normal']::types[], (
    SELECT id FROM trainers WHERE name LIKE 'Giovanni'
  )
);

INSERT INTO pokemons (
  id, name, level, type, trainer_id
) VALUES (
  31, 'Nidoqueen', 53, ARRAY['poison', 'ground']::types[], (
    SELECT id FROM trainers WHERE name LIKE 'Giovanni'
  )
);

INSERT INTO pokemons (
  id, name, level, type, trainer_id
) VALUES (
  34, 'Nidoking', 55, ARRAY['poison', 'ground']::types[], (
    SELECT id FROM trainers WHERE name LIKE 'Giovanni'
  )
);

INSERT INTO pokemons (
  id, name, level, type, trainer_id
) VALUES (
  112, 'Rhydon', 55, ARRAY['ground', 'rock']::types[], (
    SELECT id FROM trainers WHERE name LIKE 'Giovanni'
  )
);