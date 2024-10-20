defmodule AdhesiveWeb.StickyLive do
  @moduledoc false
  use AdhesiveWeb, :live_view

  alias Phoenix.LiveView

  @impl LiveView
  def mount(_params, _session, socket) do
    Process.send_after(self(), :inc_count, 1000)

    socket
    |> assign(:count, 0)
    |> assign(:now, NaiveDateTime.utc_now())
    |> then(&{:ok, &1, layout: false})
  end

  @impl LiveView
  def handle_info(:inc_count, socket) do
    Process.send_after(self(), :inc_count, 1000)

    socket
    |> update(:count, &(&1 + 1))
    |> then(&{:noreply, &1})
  end

  @impl LiveView
  def render(assigns) do
    ~H"""
    <div id="my-sticky-lv" class="flex flex-col gap-y-2">
      <p id="sticky-count">
        count is: <%= @count %>
      </p>
      <p id="sticky-now">
        <%= @now %>
      </p>
    </div>
    """
  end
end
