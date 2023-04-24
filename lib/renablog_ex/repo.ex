defmodule RenablogEx.Repo do
  use Ecto.Repo,
    otp_app: :renablog_ex,
    adapter: Ecto.Adapters.SQLite3
end
