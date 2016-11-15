Code.require_file("spec/support/supervisor_spec.exs")

defmodule ElixirBase.SupervisorSpec do
  use ESpec

  before described_module: described_module, strategy: :one_for_one
  it_behaves_like SupervisorSharedSpec
end
