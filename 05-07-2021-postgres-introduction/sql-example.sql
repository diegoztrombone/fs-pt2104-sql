CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  birthdate DATE NOT NULL,
  dni TEXT NOT NULL UNIQUE
);

INSERT INTO users (
  username, birthdate, dni
) VALUES (
  'Molpe', '1989-11-15', '123123'
) ON CONFLICT DO NOTHING;

INSERT INTO users (
  username, birthdate, dni
) VALUES (
  'Lucía', '1982-09-12', '123434'
) ON CONFLICT DO NOTHING;

INSERT INTO users (
  username, birthdate, dni
) VALUES (
  'María', '1993-04-10', '987987'
) ON CONFLICT DO NOTHING;

INSERT INTO users (
  username, birthdate, dni
) VALUES (
  'Antonio', '2000-08-04', '747837'
) ON CONFLICT DO NOTHING;
