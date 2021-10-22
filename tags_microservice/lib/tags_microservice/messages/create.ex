defmodule TagsMicroservice.Messages.Create do
  alias TagsMicroservice.{Message, Repo}

  def call(params) do
    params
    |> Message.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Message{}} = result), do: result
  defp handle_insert({:error, result}) do: {:error, %{result: result, status: :bad_request}}
end
