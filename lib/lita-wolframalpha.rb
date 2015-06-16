require "lita"
require "open-uri"
require "cgi"
require "nokogiri"

module Lita
  module Handlers
    class Wolframalpha < Handler
      # An WolframAlpha API key
      config :appid

      route(/^w(?:olfram)?a(?:lpha)?\s+(.+)/, :wolframalpha, help: { "(wa|wolframalpha) the query to run" => "Query the WolframAlpha® computational knowledge engine™" })

      def wolframalpha(response)
        question = response.match_data.captures.join
        query = CGI.escape(question)
        url = "http://api.wolframalpha.com/v2/query?input=#{query}&appid=#{config.appid}"

        answer = nil

        begin
          # FIXME Use the version from the gemspec
          doc = Nokogiri::XML(open(url, "User-Agent" => "lita-wolframalpha/#{"1.0"} for Lita (https://lita.io)"))
          answer = doc.css("pod[@id='Result'] plaintext").first.text
        rescue => e
          log.debug e
          raise e
          answer = "Couldn't get a clear answer, see: http://www.wolframalpha.com/input/?i=#{query}"
        end
        response.reply(answer)
      end

    end

    Lita.register_handler(Wolframalpha)
  end
end
