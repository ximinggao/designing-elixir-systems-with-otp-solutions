import Config

config :mastery_persistence, MasteryPersistence.Repo,
  database: "mastery_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  username: "postgres",
  password: "postgres"

config :mastery_persistence, Oban, testing: :inline
