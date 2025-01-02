require_relative "../lib/input_switch"

RSpec.describe InputSwitch do
  context "#exec" do
    context "when there are no arguments" do
      let(:arguments) { [] }

      context "and input holds a StringIO instance" do
        let(:input) { StringIO.new("Hello World!\nSecond Line\n") }
        
        it "input_sources has a TxtStreamSource instance" do
          input_switch = InputSwitch.new(arguments, input)

          input_switch.exec

          expect(input_switch.input_sources.first).to be_instance_of(TxtStreamSource)
        end
      end
    end

    context "when there is one argument" do
      let(:arguments) { ["asset/test.txt"] }

      context "and input holds a StringIO instance" do
        let(:input) { StringIO.new("Hello World!\nSecond Line\n") }

        it "input_sources has a FileSource instance" do
          input_switch = InputSwitch.new(arguments, input)

          input_switch.exec

          expect(input_switch.input_sources.first).to be_instance_of(FileSource)
        end
      end
    end
  end
end
