class InvalidType < StandardError; end

class Newsletter
    attr_accessor :issue_number, :issue_date
    # attr_reader :articles

    #whenever you create a new instance of a newsletter, it creates an empty array of articles
    def initialize
        @articles = []
    end

    #this duplicates (.dup) and freezes article instances. freeze doesn't allow you to change the object in anyway(not even add something to an array). you can't add or edit data to itre
    def articles
        @articles.dup.freeze
    end

    #enforces type, allows you to control the interface so that others won't change or break your data
    def add_article(article)
        if !article.is_a?(Article) && !article.title.empty?
        # adds another condition so that article title attribute is not empty
            raise InvalidType, "must be an Article"
        else
            @articles << article
        end
    end

    def first_article_url
        self.articles.first.url
    end
end
