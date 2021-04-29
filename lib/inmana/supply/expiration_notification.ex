defmodule Inmana.Supply.ExpirationNotification do
  alias Inmana.Mailer
  alias Inmana.Supply.{ExpirationEmail, GetByExpiration}

  def send do
    data = GetByExpiration.call()

    data
    |> Enum.each(fn {to_email, supplies} ->
      to_email
      |> ExpirationEmail.create(supplies)
      |> Mailer.deliver_later!()
    end)
  end
end
