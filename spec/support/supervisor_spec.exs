defmodule SupervisorSharedSpec do
  use ESpec, shared: true

  subject do: shared.described_module.init(init_value)

  describe ".init" do
    context "on OK value" do
      let :init_value, do: :ok

      it do: is_expected |> to(be_ok_result)

      it "returns specification" do
        {:ok, {spec, _}} = subject
        expect(spec) |> to(eq {shared.strategy, 3, 5})
      end
    end
  end
end
