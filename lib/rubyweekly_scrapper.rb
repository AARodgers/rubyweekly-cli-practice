class RubyWeeklyScrapper
    attr_accessor :newsletter, :doc

    def initialize(issue_number)
        @newsletter = Newsletter.new
        # @newletter.issue_number = issue_number
        @doc = Nokogiri::HTML(open("http://rubyweekly.com/issues/#{issue_number}"))
    end

    def scrape
        scrape_details
        scrape_articles
        @newsletter # this instance will have articles and details in it
    end

    def scrape_details
        #will populate @newletter with more data from rubyweekly site
        @newsletter.issue_date = @doc.search("table.gowide.lonmo").text.strip.gsub("Issue #{@issue_number} — ", "").strip
    end

    def scrape_articles
        # is going to break the convention of only knowing about newsletters and let it create articles
        @doc.search("td[align='left'] table.gowide")[2..-1].each do |article_table|
            #instantiate the article

            a = Article.new
            a.author = article_table.search("div:first").text.strip
            a.title = article_table.search("a:first").text.strip
            a.url = article_table.search("a:first").attr("href").text.strip

            @newsletter.add_article(a)
            #scrape the data
            #add the article to the newsletter
        end
    end

end
