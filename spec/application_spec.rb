require "application"

RSpec.describe Application do
  it("works") do
    expect(Application.new().works?).to eq(true)
  end
end