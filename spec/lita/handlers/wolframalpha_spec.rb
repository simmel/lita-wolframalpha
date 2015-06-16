require "spec_helper"

describe Lita::Handlers::Wolframalpha, lita_handler: true do

  before do
    require_relative '../../../lita_config'
  end

  it { is_expected.to route_command("wolframalpha director of movie pi").to(:wolframalpha) }

  it "director of movie pi" do
    send_message("wolframalpha director of movie pi")
    expect(replies.last).to eq("Darren Aronofsky")
  end

end
