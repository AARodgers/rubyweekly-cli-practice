class Newsletter

    attr_accessor :issue_number, :issue_date
    attr_reader :articles

    #whenever you create a new instance of a newsletter, it creates an empty array of articles
    def initialize
        @articles = []
    end

    #this duplicates (.dup) and freezes article instances
    def articles
        @articles.dup.freeze!
    end

    #enforces type
    def add_articles(article)
        raise "invalid article" if !article.is_a?(Article)
    end

    def first_article_url
        self.articles.first.url
    end
end
