# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :traverse,
  ecto_repos: [Traverse.Repo]

config :ueberauth, Ueberauth,
  providers: [
    auth0: {Ueberauth.Strategy.Auth0, []}
  ]

config :ueberauth, Ueberauth.Strategy.Auth0.OAuth,
  domain: "traverse.eu.auth0.com",
  client_id: "j0xS79WBJDncadoBklVxVrzFA8pc481F",
  client_secret: "r08hmtaMPEBxk85rJse1Sp_QxeFMroF9QC198oWAVOgJK2A_8PcygP5DShWJ_Ks-"

# Configures the endpoint
config :traverse, Traverse.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wOWR4YY1CZ+jSOwgrtMu9N9iX4tdEqULEZMrFCE4KdkkjMP8ahhI7Pw4xBH8sQe/",
  render_errors: [view: Traverse.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Traverse.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
