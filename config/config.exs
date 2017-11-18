# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :zchat,
  ecto_repos: [Zchat.Repo]

# Configures the endpoint
config :zchat, Zchat.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "E1nskh5NzFJACbZrYQEfLh9nytbJofxh78cxrtZDpK/SxfrYHnYsbNM7Vf/Pt/4N",
  render_errors: [view: Zchat.ErrorView, accepts: ~w(json)],
  pubsub: [name: Zchat.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


config :phoenix, :format_encoders,
       "json-api": Poison

config :plug, :mimes, %{
  "application/vnd.api+json" => ["json-api"]
}

config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "Zchat",
  ttl: {30, :days},
  verify_issuer: true,
  secret_key: System.get_env("GUARDIAN_SECRET") || "W1cNPiQGuymqa6RNoT7olC9q1/hZKlIO6StNdkHr7JxmQE7UdlN++TsIUI4JHtIS",
  serializer: Zchat.GuardianSerializer

config :mime, :types, %{
  "application/vnd.api+json" => ["json-api"]
}
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
