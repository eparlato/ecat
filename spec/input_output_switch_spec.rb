require_relative "../lib/input_output_switch"

RSpec.describe InputOutputSwitch do
  context "#exec" do
    context "when there are no arguments" do
      let(:arguments) { [] }

      context "and input is text" do
        let(:input_stream) { StringIO.new("Hello World!\nSecond Line\n") }

        it "input_sources has a TxtStreamSource instance" do
          input_output_switch = InputOutputSwitch.new(arguments, input_stream)

          input_output_switch.exec

          expect(input_output_switch.input_sources.first).to be_instance_of(TxtStreamSource)
        end

        it "output is a ConsoleOutput instance" do
          input_output_switch = InputOutputSwitch.new(arguments, StringIO.new(""))

          input_output_switch.exec

          expect(input_output_switch.output).to be_instance_of(ConsoleOutput)
        end
      end

      context "and input_stream is empty" do
        let(:input) { StringIO.new("") }
        let(:input_output_switch) { InputOutputSwitch.new(arguments, input) }

        it "input_sources is empty" do
          input_output_switch.exec

          expect(input_output_switch.input_sources).to eq([])
        end

        it "output is a ConsoleOutput instance" do
          input_output_switch.exec

          expect(input_output_switch.output).to be_instance_of(ConsoleOutput)
        end
      end
    end

    context "when there's only one argument" do
      context "and the single argument is -n" do
        let(:arguments) { ["-n"] }

        context "and input holds a StringIO instance" do
          let(:input_stream) { StringIO.new("Hello World!\nSecond Line\n") }

          it "input_sources has a TxtStreamSource instance" do
            input_output_switch = InputOutputSwitch.new(arguments, input_stream)

            input_output_switch.exec

            expect(input_output_switch.input_sources.first).to be_instance_of(TxtStreamSource)
          end
        end

        context "and input_stream is empty" do
          let(:input_stream) { StringIO.new("") }
          let(:input_output_switch) { InputOutputSwitch.new(arguments, input_stream) }

          it "input_sources is empty" do
            input_output_switch.exec

            expect(input_output_switch.input_sources).to eq([])
          end
        end

        it "output is a LineNumberOutput instance" do
          input_output_switch = InputOutputSwitch.new(arguments, StringIO.new(""))

          input_output_switch.exec

          expect(input_output_switch.output).to be_instance_of(LineNumberOutput)
        end
      end

      context "and the single argument is a file path" do
        let(:arguments) { ["asset/test.txt"] }

        context "and input_stream holds a StringIO instance" do
          let(:input_stream) { StringIO.new("Hello World!\nSecond Line\n") }

          it "input_sources has a FileSource instance" do
            input_output_switch = InputOutputSwitch.new(arguments, input_stream)

            input_output_switch.exec

            expect(input_output_switch.input_sources.first).to be_instance_of(FileSource)
          end
        end

        context "and input_stream is empty" do
          let(:input) { StringIO.new("") }

          it "input_sources has a FileSource instance" do
            input_output_switch = InputOutputSwitch.new(arguments, input)

            input_output_switch.exec

            expect(input_output_switch.input_sources.first).to be_instance_of(FileSource)
          end
        end

        it "output is a ConsoleOutput instance" do
          input_output_switch = InputOutputSwitch.new(arguments, StringIO.new(""))

          input_output_switch.exec

          expect(input_output_switch.output).to be_instance_of(ConsoleOutput)
        end
      end

      context "and the single argument is -b" do
        let(:arguments) { ["-b"] }

        context "and input_stream holds a StringIO instance" do
          let(:input_stream) { StringIO.new("Hello World!\n\nSecond Line\n") }

          it "input_sources has a TxtStreamSource instance" do
            input_output_switch = InputOutputSwitch.new(arguments, input_stream)

            input_output_switch.exec

            expect(input_output_switch.input_sources.first).to be_instance_of(TxtStreamSource)
          end
        end

        context "and input_stream is empty" do
          let(:input_stream) { StringIO.new("") }
          let(:input_output_switch) { InputOutputSwitch.new(arguments, input_stream) }

          it "input_sources is empty" do
            input_output_switch.exec

            expect(input_output_switch.input_sources).to eq([])
          end
        end

        it "output is a NotBlankLineNumberOutput instance" do
          input_output_switch = InputOutputSwitch.new(arguments, StringIO.new(""))

          input_output_switch.exec

          expect(input_output_switch.output).to be_instance_of(NotBlankLineNumberOutput)
        end
      end
    end

    context "when there are multiple arguments with empty input_stream" do
      let(:input_stream) { StringIO.new("") }

      context "and none of them is -n" do
        let(:arguments) { ["asset/test.txt", "asset/test2.txt"] }

        it "input_sources has multiple FileSource instances" do
          input_output_switch = InputOutputSwitch.new(arguments, input_stream)

          input_output_switch.exec

          expect(input_output_switch.input_sources.size).to eq(2)
          expect(input_output_switch.input_sources.first).to be_instance_of(FileSource)
          expect(input_output_switch.input_sources.last).to be_instance_of(FileSource)
        end

        it "output is a ConsoleOutput instance" do
          input_output_switch = InputOutputSwitch.new(arguments, input_stream)

          input_output_switch.exec

          expect(input_output_switch.output).to be_instance_of(ConsoleOutput)
        end
      end

      context "and one of them is -n" do
        let(:arguments) { ["asset/test.txt", "-n", "asset/test2.txt"] }

        it "input_sources has multiple FileSource instances" do
          input_output_switch = InputOutputSwitch.new(arguments, input_stream)

          input_output_switch.exec

          expect(input_output_switch.input_sources.size).to eq(2)
          expect(input_output_switch.input_sources.first).to be_instance_of(FileSource)
          expect(input_output_switch.input_sources.last).to be_instance_of(FileSource)
        end

        it "output is a LineNumberOutput instance" do
          input_output_switch = InputOutputSwitch.new(arguments, input_stream)

          input_output_switch.exec

          expect(input_output_switch.output).to be_instance_of(LineNumberOutput)
        end
      end

      context "and one of them is -b" do
        let(:arguments) { ["asset/test.txt", "-b", "asset/test2.txt"] }

        it "input_sources has multiple FileSource instances" do
          input_output_switch = InputOutputSwitch.new(arguments, input_stream)

          input_output_switch.exec

          expect(input_output_switch.input_sources.size).to eq(2)
          expect(input_output_switch.input_sources.first).to be_instance_of(FileSource)
          expect(input_output_switch.input_sources.last).to be_instance_of(FileSource)
        end

        it "output is a NotBlankLineNumberOutput instance" do
          input_output_switch = InputOutputSwitch.new(arguments, input_stream)

          input_output_switch.exec

          expect(input_output_switch.output).to be_instance_of(NotBlankLineNumberOutput)
        end

        context "and there's also another param which is -n" do
          let(:arguments) { ["-n", "-b", "asset/test2.txt"] }

          it "input_sources has multiple FileSource instances" do
            input_output_switch = InputOutputSwitch.new(arguments, input_stream)

            input_output_switch.exec

            expect(input_output_switch.input_sources.size).to eq(1)
            expect(input_output_switch.input_sources.first).to be_instance_of(FileSource)
          end

          it "output is a NotBlankLineNumberOutput instance" do
            input_output_switch = InputOutputSwitch.new(arguments, input_stream)

            input_output_switch.exec

            expect(input_output_switch.output).to be_instance_of(NotBlankLineNumberOutput)
          end
        end
      end
    end
  end
end
