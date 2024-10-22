defmodule AdhesiveWeb.PageALive do
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
    <div id="page-a">
      <p>
        This is page A
      </p>
      <.link navigate={~p"/page-b"}>
        Click here to go to page B
      </.link>
      <.link navigate={~p"/page-c"}>
        Click here to go to page C
      </.link>
    </div>
    """
  end
end
