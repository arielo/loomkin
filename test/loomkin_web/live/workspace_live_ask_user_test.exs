defmodule LoomkinWeb.Live.WorkspaceLiveAskUserTest do
  use ExUnit.Case, async: true

  @moduletag :skip

  # alias LoomkinWeb.WorkspaceLive - will be used when tests are implemented
  # import Phoenix.LiveViewTest - will be used when tests are implemented

  describe "ask_user card rendering" do
    @tag :skip
    test "ask_user card: renders with cyan accent when agent has pending_questions" do
      assert false, "not implemented"
    end

    @tag :skip
    test "ask_user card: shows sequential question list when multiple questions are batched" do
      assert false, "not implemented"
    end

    @tag :skip
    test "ask_user card: each question has its own answer buttons with correct question-id" do
      assert false, "not implemented"
    end
  end

  describe "let_team_decide event" do
    @tag :skip
    test "let_team_decide: triggers collective decision and removes card" do
      assert false, "not implemented"
    end

    @tag :skip
    test "let_team_decide: resolves all pending questions in batch simultaneously" do
      assert false, "not implemented"
    end
  end

  describe "status dot and label" do
    @tag :skip
    test "status dot: shows bg-cyan-500 animate-pulse when status is :ask_user_pending" do
      assert false, "not implemented"
    end

    @tag :skip
    test "status label: shows 'Waiting for you' when status is :ask_user_pending" do
      assert false, "not implemented"
    end
  end
end
