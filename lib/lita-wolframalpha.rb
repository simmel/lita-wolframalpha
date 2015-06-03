require "lita"

module Lita
  module Handlers
    class Wolframalpha < Handler
      route(/^w(?:olfram)?a(?:lpha)?\s+(.+)/, :wolframalpha, help: { "(wa|wolframalpha) the query to run" => "Query the WolframAlpha® computational knowledge engine™" })

      def wolframalpha(response)
        answer = response.match_data.captures.join
        response.reply(answer)
      end

    end

    Lita.register_handler(Wolframalpha)
  end
end
