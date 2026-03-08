defmodule LoomkinWeb.Live.WorkspaceLiveApprovalTest do
  use LoomkinWeb.ConnCase, async: true

  describe "approve_card_agent event" do
    test "routes approval response to blocking tool task via Registry" do
      # Simulates the workspace handle_event("approve_card_agent", ...) sending
      # {:approval_response, :approved, nil} to the agent's registry entry so
      # RequestApproval.run/2 can unblock.
      # Will fail until Plan 03 implements the handler.
      flunk("not implemented")
    end
  end

  describe "deny_card_agent event" do
    test "routes denial with reason to tool task via Registry" do
      # Simulates the workspace handle_event("deny_card_agent", ...) sending
      # {:approval_response, :denied, reason} to the agent's registry entry.
      # Will fail until Plan 03 implements the handler.
      flunk("not implemented")
    end
  end

  describe "leader approval banner" do
    test "leader_approval_pending assign is set when ApprovalRequested signal arrives for lead agent" do
      # When an agent with role :lead emits an ApprovalRequested signal,
      # workspace_live sets leader_approval_pending assign with gate details.
      # Will fail until Plan 03 implements the handle_info clause.
      flunk("not implemented")
    end

    test "leader_approval_pending assign is cleared when ApprovalResolved signal arrives" do
      # When an ApprovalResolved signal arrives (approved, denied, or timed out),
      # workspace_live clears the leader_approval_pending assign.
      # Will fail until Plan 03 implements the handle_info clause.
      flunk("not implemented")
    end
  end
end
