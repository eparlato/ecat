require "application"

RSpec.describe Application do
  it("works") do
    expect(Application.new().works?).to eq(true)
  end

  context "when exec is called with a file path" do
    it "prints file's content to Application's output" do
      output = StringIO.new
      application = Application.new(output)

      expected_output = <<~OUTPUT
        "Your heart is the size of an ocean. Go find yourself in its hidden depths."
        "The Bay of Bengal is hit frequently by cyclones. The months of November and May, in particular, are dangerous in this regard."
        "Thinking is the capital, Enterprise is the way, Hard Work is the solution."
        "If You Can'T Make It Good, At Least Make It Look Good."
        "Heart be brave. If you cannot be brave, just go. Love's glory is not a small thing."
        "It is bad for a young man to sin; but it is worse for an old man to sin."
        "If You Are Out To Describe The Truth, Leave Elegance To The Tailor."
        "O man you are busy working for the world, and the world is busy trying to turn you out."
        "While children are struggling to be unique, the world around them is trying all means to make them look like everybody else."
        "These Capitalists Generally Act Harmoniously And In Concert, To Fleece The People."
      OUTPUT
      
      application.exec("asset/test.txt")

      expect(output.string.strip).to eq(expected_output.strip) 
    end
  end
    
end