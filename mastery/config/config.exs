import Config

config :mastery_persistence,
  ecto_repos: [MasteryPersistence.Repo]

config :logger, level: :info

config :mastery_persistence, Oban,
  repo: MasteryPersistence.Repo,
  plugins: [Oban.Plugins.Pruner],
  queues: [default: 10]
  
import_config "#{config_env()}.exs"
