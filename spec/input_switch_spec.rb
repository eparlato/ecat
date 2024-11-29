require_relative "../lib/input_switch"

RSpec.describe InputSwitch do
  context "when ARGV is empty" do
    it "returns an array with a TxtStreamInput instance" do
      input_switch = InputSwitch.new([], StringIO.new("Hello World!\nSecond Line\n"))

      input_sources = input_switch.select_input_sources

      expect(input_sources.first).to be_instance_of(TxtStreamInput)
    end
  end

  context "when ARGV has one argument" do
    it "returns an array with a single FileInput instance" do
      input_switch = InputSwitch.new(["asset/test.txt"], StringIO.new("Hello World!\nSecond Line\n"))

      input_sources = input_switch.select_input_sources

      expect(input_sources.first).to be_instance_of(FileInput)
    end
  end
end
