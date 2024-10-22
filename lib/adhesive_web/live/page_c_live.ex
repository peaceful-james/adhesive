defmodule AdhesiveWeb.PageCLive do
  @moduledoc false
  use AdhesiveWeb, :live_view

  alias Phoenix.LiveView

  @impl LiveView
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl LiveView
  def render(assigns) do
    ~H"""
    <div id="page-c">
      <p>
        This is page C
      </p>
      <.link navigate={~p"/"}>
        Click here to go to page A
      </.link>
      <.link navigate={~p"/page-b"}>
        Click here to go to page B
      </.link>
    </div>
    """
  end
end
