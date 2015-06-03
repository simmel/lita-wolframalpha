require "spec_helper"

describe Lita::Handlers::Wolframalpha, lita_handler: true do

  it { is_expected.to route_command("wolframalpha director of movie pi").to(:wolframalpha) }

end
