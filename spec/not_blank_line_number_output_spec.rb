require_relative "../lib/not_blank_line_number_output"

RSpec.describe "NotBlankLineNumberOutput#print" do
  context "when content has blank lines" do
    let(:content) do
      <<~CONTENT
        "Your heart is the size of an ocean. Go find yourself in its hidden depths."

        "The Bay of Bengal is hit frequently by cyclones. The months of November and May, in particular, are dangerous in this regard."
      CONTENT
    end

    it "prints line number and content of non-blank lines only" do
      output_stream = StringIO.new
      not_blank_line_number_output = NotBlankLineNumberOutput.new(output_stream)

      expected_output = <<~OUTPUT
        1  "Your heart is the size of an ocean. Go find yourself in its hidden depths."
        
        2  "The Bay of Bengal is hit frequently by cyclones. The months of November and May, in particular, are dangerous in this regard."
      OUTPUT

      not_blank_line_number_output.print(content)

      expect(output_stream.string.strip).to eq(expected_output.strip)
    end
  end

  context "when content has no blank lines" do
    let(:content) do
      <<~CONTENT
        "Your heart is the size of an ocean. Go find yourself in its hidden depths."
        "The Bay of Bengal is hit frequently by cyclones. The months of November and May, in particular, are dangerous in this regard."
      CONTENT
    end

    it "prints line number and content" do
      output_stream = StringIO.new
      not_blank_line_number_output = NotBlankLineNumberOutput.new(output_stream)

      expected_output = <<~OUTPUT
        1  "Your heart is the size of an ocean. Go find yourself in its hidden depths."
        2  "The Bay of Bengal is hit frequently by cyclones. The months of November and May, in particular, are dangerous in this regard."
      OUTPUT

      not_blank_line_number_output.print(content)

      expect(output_stream.string.strip).to eq(expected_output.strip)
    end
  end
end
