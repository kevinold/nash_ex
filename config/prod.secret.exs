use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :nash_ex, NashEx.Endpoint,
  secret_key_base: "rOCHVPY7spj5YxAJg1GqUYY0uy2dvWD8astIyhdhrKhAX+5nYViSAEyi4h+GbQdv"

# Configure your database
config :nash_ex, NashEx.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "postgres",
  password: "postgres",
  database: "nash_ex_prod"
