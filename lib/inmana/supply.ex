defmodule Inmana.Supply do
  use Ecto.Schema
  import Ecto.Changeset

  alias Inmana.Restaurant

  @primary_key {:uuid, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:description, :expiration_date, :responsible, :restaurant_uuid]

  @derive {Jason.Encoder, only: @required_params ++ [:uuid]}

  schema "supplies" do
    field :description, :string
    field :expiration_date, :date
    field :responsible, :string

    belongs_to :restaurant, Restaurant, references: :uuid, foreign_key: :restaurant_uuid

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 3)
    |> unique_constraint(:responsible, min: 3)
  end
end
