use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :nash_ex, NashEx.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :nash_ex, NashEx.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "postgres",
  password: "postgres",
  database: "nash_ex_test",
  size: 1,
  max_overflow: false
