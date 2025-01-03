require_relative "../lib/line_number_output"

RSpec.describe "LineNumberOutput#print" do
  it "prints the output to the console with line numbers" do
    output_io = StringIO.new
    output = LineNumberOutput.new(output_io)

    input_stream =
      "Hello, World!\n" \
      "\"Hello, World! (with quotes)\"\n"

    output.print(input_stream)

    expected_output = <<~OUTPUT
      1  Hello, World!
      2  "Hello, World! (with quotes)"
    OUTPUT

    expect(output_io.string).to eq(expected_output)
  end
end
