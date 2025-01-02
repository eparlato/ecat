require_relative "../lib/ecat"

RSpec.describe Ecat do
  context "when arguments holds a single file path" do
    it "prints file's content to output" do
      arguments = ["asset/test.txt"]
      output = StringIO.new

      ecat = Ecat.new(arguments:, output:)

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

      ecat.run

      expect(output.string.strip).to eq(expected_output.strip)
    end
  end

  context "when arguments holds multiple files path" do
    it "concatenates all files' content and print it to output" do
      arguments = ["asset/test.txt", "asset/test2.txt"]
      output = StringIO.new

      ecat = Ecat.new(arguments:, output:)

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
        "I Don'T Believe In Failure. It Is Not Failure If You Enjoyed The Process."
        "Do not get elated at any victory, for all such victory is subject to the will of God."
        "Wear gratitude like a cloak and it will feed every corner of your life."
        "If you even dream of beating me you'd better wake up and apologize."
        "I Will Praise Any Man That Will Praise Me."
        "One Of The Greatest Diseases Is To Be Nobody To Anybody."
        "I'm so fast that last night I turned off the light switch in my hotel room and was in bed before the room was dark."
        "People Must Learn To Hate And If They Can Learn To Hate, They Can Be Taught To Love."
        "Everyone has been made for some particular work, and the desire for that work has been put in every heart."
        "The less of the World, the freer you live."
      OUTPUT

      ecat.run

      expect(output.string.strip).to eq(expected_output.strip)
    end
  end

  context "when the input is a stream of text" do
    it "prints the input to output" do
      arguments = []
      input = StringIO.new("Hello World!\nSecond Line\n")
      output = StringIO.new

      ecat = Ecat.new(arguments:, input:, output:)

      ecat.run

      expect(output.string.strip).to eq("Hello World!\nSecond Line")
    end
  end
end
