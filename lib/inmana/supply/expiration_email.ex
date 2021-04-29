defmodule Inmana.Supply.ExpirationEmail do
  import Bamboo.Email

  alias Inmana.Supply

  def create(email, supplies) do
    new_email(
      to: email,
      from: "inmana@notification.com",
      subject: "Expiring supplies this week",
      html_body: mount_body(supplies)
    )
  end

  defp mount_body(supplies) do
    initial_text = "<strong>------- Supplies about to expire -------</strong>"

    supplies
    |> Enum.reduce(initial_text, fn supply, text -> text <> supply_string(supply) end)
  end

  defp supply_string(%Supply{
         description: description,
         expiration_date: expiration_date,
         responsible: responsible
       }) do
    "<dl><dt>Description:</dt><dd>#{description}</dd><dt>Expiration Date:</dt><dd>#{
      expiration_date
    }</dd><dt>Responsible:</dt><dd>#{responsible}</dd></dl>"
  end
end
