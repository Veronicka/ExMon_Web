defmodule ExMon.Trainer.Pokemon.Create do
  alias ExMon.PokeApi.Client
  alias ExMon.Pokemon
  alias ExMon.Trainer.Pokemon, as: TrainerPokemon
  alias ExMon.Repo
  alias ExMon.Trainer

  def call(%{"name" => name} = params) do
    name
    |> Client.get_pokemon()
    |> handle_response(params)
  end

  defp handle_response({:ok, body}, params) do
    body
    |> Pokemon.build()
    |> create_pokemon(params)
  end

  defp handle_response({:error, _reason} = error, _params), do: error

  defp create_pokemon(%Pokemon{name: name, weight: weight, types: types}, %{
         "nickname" => nickname,
         "trainer_id" => trainer_id
       }) do
    params = %{
      name: name,
      weight: weight,
      types: types,
      nickname: nickname,
      trainer_id: trainer_id
    }

    case Repo.get(Trainer, trainer_id) do
      nil -> {:error, "Trainer not found!"}
      _trainer -> add_pokemon(params)
    end
  end

  defp add_pokemon(params) do
    params
    |> TrainerPokemon.build()
    |> handle_build()
  end

  defp handle_build({:ok, pokemon}), do: Repo.insert(pokemon)
  defp handle_build({:error, _changeset} = error), do: error
end
