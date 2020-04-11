class RubyWeeklyScrapper

    def initialize(issue_number)
        @newsletter = Newsletter.new
        @newletter.issue_number = issue_number
        @doc = Nokogiri::HTML(open("https://rubyweekly.com/issues/#{issue_number}"))
    end

end
