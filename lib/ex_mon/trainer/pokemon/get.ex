defmodule ExMon.Trainer.Pokemon.Get do
  alias ExMon.{Repo, Trainer.Pokemon}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case fetch_Pokemon(uuid) do
      nil -> {:error, "Pokemon not found!"}
      pokemon -> {:ok, Repo.preload(pokemon, :trainer)}
    end
  end

  defp fetch_Pokemon(uuid), do: Repo.get(Pokemon, uuid)
end
