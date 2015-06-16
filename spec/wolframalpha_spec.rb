require "lita-wolframalpha"
require "lita/rspec"

# A compatibility mode is provided for older plugins upgrading from Lita 3. Since this plugin
# was generated with Lita 4, the compatibility mode should be left disabled.
Lita.version_3_compatibility_mode = false

describe Lita::Handlers::Wolframalpha, lita_handler: true do

  before do
    require_relative '../lita_config'
  end

  it { is_expected.to route_command("wolframalpha director of movie pi").to(:wolframalpha) }

  it "director of movie pi" do
    send_message("wolframalpha director of movie pi")
    expect(replies.last).to eq("Darren Aronofsky")
  end

end
