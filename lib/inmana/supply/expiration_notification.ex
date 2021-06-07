defmodule Inmana.Supply.ExpirationNotification do
  alias Inmana.Mailer
  alias Inmana.Supply.{ExpirationEmail, GetByExpiration}

  def send do
    GetByExpiration.call()
    |> Task.async_stream(fn {to_email, supplies} -> send_email(to_email, supplies) end)
    |> Stream.run()
  end

  defp send_email(to_email, supplies) do
    to_email
    |> ExpirationEmail.create(supplies)
    |> Mailer.deliver_later!()
  end
end
