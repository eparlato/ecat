require_relative "../lib/console_output"

RSpec.describe ConsoleOutput do
  it "prints the output to the console" do
    output_io = StringIO.new
    output = ConsoleOutput.new(output_io)

    output.print("Hello, World!")

    expect(output_io.string.split).to eq("Hello, World!".split)
  end
end
