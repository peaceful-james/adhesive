defmodule AdhesiveWeb.PageBLive do
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
    <div id="page-b">
      <p>
        This is page B
      </p>
      <.link navigate={~p"/"}>
        Click here to go to page A
      </.link>
    </div>
    """
  end
end
