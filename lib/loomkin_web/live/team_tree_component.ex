defmodule LoomkinWeb.TeamTreeComponent do
  use LoomkinWeb, :live_component

  def mount(socket) do
    {:ok, assign(socket, open: false)}
  end

  def update(assigns, socket) do
    {:ok, assign(socket, assigns)}
  end

  def handle_event("toggle_tree", _params, socket) do
    {:noreply, assign(socket, open: !socket.assigns.open)}
  end

  def handle_event("close_tree", _params, socket) do
    {:noreply, assign(socket, open: false)}
  end

  def handle_event("select_team", %{"team-id" => team_id}, socket) do
    send(self(), {:switch_team, team_id})
    {:noreply, assign(socket, open: false)}
  end

  def render(assigns) do
    ~H"""
    <div id={@id} class="relative">
      <button
        :if={@team_tree != %{}}
        type="button"
        phx-click="toggle_tree"
        phx-target={@myself}
        class="flex items-center gap-1.5 px-2 py-1 rounded-md text-xs font-medium bg-surface-2 border border-subtle text-secondary hover:text-primary hover:bg-surface-3 transition-colors"
      >
        <span>Teams</span>
        <svg
          class={["w-3 h-3 transition-transform", @open && "rotate-180"]}
          viewBox="0 0 12 12"
          fill="none"
          stroke="currentColor"
          stroke-width="1.5"
        >
          <path d="M2 4l4 4 4-4" />
        </svg>
      </button>
      <div
        :if={@open}
        class="absolute top-full left-0 mt-1.5 w-52 rounded-xl overflow-hidden z-[9999] bg-surface-2 border border-default shadow-lg"
        phx-click-away="close_tree"
        phx-target={@myself}
      >
        <%!-- Root team row (depth 0) --%>
        <.team_row
          team_id={@root_team_id}
          depth={0}
          active_team_id={@active_team_id}
          agent_counts={@agent_counts}
          team_names={@team_names}
          myself={@myself}
        />
        <%!-- Child rows (depth 1) --%>
        <%= for child_id <- Map.get(@team_tree, @root_team_id, []) do %>
          <.team_row
            team_id={child_id}
            depth={1}
            active_team_id={@active_team_id}
            agent_counts={@agent_counts}
            team_names={@team_names}
            myself={@myself}
          />
          <%!-- Grandchild rows (depth 2, max depth per Manager) --%>
          <%= for grandchild_id <- Map.get(@team_tree, child_id, []) do %>
            <.team_row
              team_id={grandchild_id}
              depth={2}
              active_team_id={@active_team_id}
              agent_counts={@agent_counts}
              team_names={@team_names}
              myself={@myself}
            />
          <% end %>
        <% end %>
      </div>
    </div>
    """
  end

  defp team_row(assigns) do
    ~H"""
    <button
      type="button"
      phx-click="select_team"
      phx-value-team-id={@team_id}
      phx-target={@myself}
      class={[
        "w-full flex items-center justify-between px-3 py-2 text-xs hover:bg-surface-3 transition-colors text-left",
        @team_id == @active_team_id && "bg-surface-3 font-medium text-primary",
        @team_id != @active_team_id && "text-secondary"
      ]}
      style={"padding-left: #{12 + @depth * 12}px"}
    >
      <span class="truncate">{Map.get(@team_names, @team_id, short_id(@team_id))}</span>
      <span class="ml-2 text-tertiary tabular-nums">{Map.get(@agent_counts, @team_id, 0)}</span>
    </button>
    """
  end

  defp short_id(id) when is_binary(id), do: String.slice(id, 0, 8)
  defp short_id(_), do: "unknown"
end
