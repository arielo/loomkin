defmodule Loomkin.Tools.RequestApprovalTest do
  use ExUnit.Case, async: true

  alias Loomkin.Tools.RequestApproval

  describe "module existence" do
    test "Loomkin.Tools.RequestApproval module exists" do
      # Will fail with UndefinedFunctionError until Plan 02 creates the module
      assert Code.ensure_loaded?(RequestApproval)
    end
  end

  describe "run/2 approval response" do
    test "returns {:ok, %{status: :approved}} when response sent before timeout" do
      # Will fail until RequestApproval.run/2 is implemented
      flunk("not implemented")
    end

    test "returns {:ok, %{status: :denied, reason: :timeout}} after timeout_ms elapses" do
      # Use a very short timeout (50ms) to keep the test fast
      # Will fail until RequestApproval.run/2 is implemented
      flunk("not implemented")
    end
  end

  describe "registry lifecycle" do
    test "registry unregistered after approval response received" do
      # Confirms no registry leak after a resolved approval gate
      # Will fail until RequestApproval.run/2 is implemented
      flunk("not implemented")
    end
  end
end
