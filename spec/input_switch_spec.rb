RSpec.describe InputSwitch do
  context "when ARGV is empty" do
    it "returns a TxtStreamInput instance" do
      inputSwitch = InputSwitch.new([], StringIO.new("Hello World!\nSecond Line\n"))

      expect(inputSwitch.input_stream).to be_instance_of(TxtStreamInput)
    end
  end

  context "when ARGV is not empty" do
    it "returns a FileInput instance" do
      inputSwitch = InputSwitch.new(["asset/test.txt"], StringIO.new("Hello World!\nSecond Line\n"))

      expect(inputSwitch.input_stream).to be_instance_of(FileInput)
    end
  end
end