defmodule Inmana do
  alias Inmana.Restaurants.Create, as: RestaurantsCreate
  alias Inmana.Supply.Create, as: SupplyCreate
  alias Inmana.Supply.Get, as: SupplyGet

  defdelegate create_restaurant(params), to: RestaurantsCreate, as: :call

  defdelegate create_supply(params), to: SupplyCreate, as: :call
  defdelegate get_supply(params), to: SupplyGet, as: :call
end
