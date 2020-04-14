class RubyWeeklyController

    def initialize
        puts "Welcome to RubyWeekly!!!"

        s = RubyWeeklyScrapper.new(286)
        newsletter = s.scrape
    end

    def call
        @newsletter.articles.each.with_index(1) do |a, i|
            puts "#{i}. #{a.title}"
        end
    end
end
