defmodule Inmana.Welcomer do
  # Receber um nome e uma idade do usuario
  # e se o usuario chamar banana e tiver a idade 42, ele recebe uma mensagem especial
  # Se o usuario for maior de idade, ele recebe uma mensagem normal
  # se o usuario for menor de idade, retornamos um erro
  # Temos que tratar o nome do usuario para entradas erradas como "BaNaNa", "BaNaNa  \n"

  def welcome(%{"name" => name, "age" => age}) do
    age =
      age
      |> String.to_integer()

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  defp evaluate("banana", 42) do
    {:ok, "you are a special banana"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome #{name}"}
  end

  defp evaluate(name, _age) do
    {:error, "You shall not pass #{name}"}
  end
end
