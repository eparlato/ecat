require_relative "../lib/application"
require_relative "../lib/input_switch"

RSpec.describe Application do
  context "when the input is a file" do
    it "prints file's content to Application's output" do
      input_sources = InputSwitch.new(["asset/test.txt"]).select_input_sources
      output = StringIO.new

      application = Application.new(input_sources, ConsoleOutput.new(output))

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

      application.exec

      expect(output.string.strip).to eq(expected_output.strip)
    end
  end

  context "when the input are multiple files" do
    it "concatenates all files' content and print it to Application's output" do
      input_sources = InputSwitch.new(["asset/test.txt", "asset/test2.txt"]).select_input_sources
      output = StringIO.new

      application = Application.new(input_sources, output)

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

      application.exec

      expect(output.string.strip).to eq(expected_output.strip)
    end
  end

  context "when the input is an IO" do
    it "prints the input to Application's output" do
      input_sources = InputSwitch.new([], StringIO.new("Hello World!\nSecond Line\n")).select_input_sources
      output = StringIO.new

      application = Application.new(input_sources, output)

      application.exec

      expect(output.string.strip).to eq("Hello World!\nSecond Line")
    end
  end
end
