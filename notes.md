- require_all is a gem and you have to put it in the gem file

- want to be able to have:
n_286 = RubyWeeklyScrapper.new(286).scrape
n_286.articles.first.title => should get back first title of article
Steps:
1. Need to make RubyWeeklyScrapper class
2. class above needs to instantiate the newsletter for that issue number
3. Need to scrape details of that newsletter
4. Need to scrape details about the articles and add them to the instance of the newsletter







- console work:
 pry(main)> a = Article.new
=> #<Article:0x00007f8d372726c8>
[4] pry(main)> a.url =  'https://rubyweekly.com/link/86559/web'
=> "https://rubyweekly.com/link/86559/web"
[5] pry(main)> a.title = "Super Bombinhas: An In-Development Platform Game in Ruby"
=> "Super Bombinhas: An In-Development Platform Game in Ruby"
[6] pry(main)> a.author = "VICTOR DAVID SANTOS"
=> "VICTOR DAVID SANTOS"
[7] pry(main)> n = Newsletter.new
=> #<Newsletter:0x00007f8d36a90950>
[8] pry(main)> n.issue_number = 286
=> 286
[9] pry(main)> n.articles
=> nil
[10] pry(main)> n.articles = []
=> []
[11] pry(main)> n.articles << a
=> [#<Article:0x00007f8d372726c8
  @author="VICTOR DAVID SANTOS",
  @title="Super Bombinhas: An In-Development Platform Game in Ruby",
  @url="https://rubyweekly.com/link/86559/web">]
[12] pry(main)> n.articles.first.url
=> "https://rubyweekly.com/link/86559/web"
[13] pry(main)>


Just an example:
class Array
    # this method redefines the push method << to say that you can only push on articles
    #it enforces type
    def <<(obj)
        raise "Invalid Article" if !obj.is_a(Article)
    end
end

More console exerices:

[1] pry(main)> n = Newsletter.new
=> #<Newsletter:0x00007fef419d8608 @articles=[]>
[2] pry(main)> n.articles
NoMethodError: undefined method `freeze!' for []:Array
Did you mean?  freeze
from /Users/amandarodgers/Flatiron/mod1/playground/rubyweekly-cli/lib/newsletter.rb:13:in `articles'
[3] pry(main)> [].freeze
=> []
[4] pry(main)> reload!
LoadError: cannot load such file -- ./lib
from /Users/amandarodgers/Flatiron/mod1/playground/rubyweekly-cli/Rakefile:4:in `load'
[5] pry(main)> exit
➜  rubyweekly-cli git:(master) ✗ rake console
[1] pry(main)> n = Newsletter.new
=> #<Newsletter:0x00007f97141545e8 @articles=[]>
[2] pry(main)> n.articles
=> []
[3] pry(main)> n.articles << "Hello"
FrozenError: can't modify frozen Array
from (pry):3:in `__pry__'
[4] pry(main)> n.add_articles("hello")
RuntimeError: invalid article
from /Users/amandarodgers/Flatiron/mod1/playground/rubyweekly-cli/lib/newsletter.rb:18:in `add_articles'
[5] pry(main)> n.add_articles("Article.new")
RuntimeError: invalid article
from /Users/amandarodgers/Flatiron/mod1/playground/rubyweekly-cli/lib/newsletter.rb:18:in `add_articles'
[6] pry(main)> reload!
LoadError: cannot load such file -- ./lib
from /Users/amandarodgers/Flatiron/mod1/playground/rubyweekly-cli/Rakefile:4:in `load'
[7] pry(main)> exit
➜  rubyweekly-cli git:(master) ✗ rake console
[1] pry(main)> n = Newletter.new
NameError: uninitialized constant Newletter
Did you mean?  Newsletter
from (pry):1:in `__pry__'
[2] pry(main)> n = Newsletter.new
=> #<Newsletter:0x00007ff5c49e53d8 @articles=[]>
[3] pry(main)> n.add_articles
ArgumentError: wrong number of arguments (given 0, expected 1)
from /Users/amandarodgers/Flatiron/mod1/playground/rubyweekly-cli/lib/newsletter.rb:19:in `add_articles'
[4] pry(main)> exit
➜  rubyweekly-cli git:(master) ✗  rake console
[1] pry(main)> n = Newsletter.new
=> #<Newsletter:0x00007faa41040040 @articles=[]>
[2] pry(main)> n.add_article("String")
InvalidType: must be an article
from /Users/amandarodgers/Flatiron/mod1/playground/rubyweekly-cli/lib/newsletter.rb:21:in `add_article'
[3] pry(main)> n.articles << "Start"
FrozenError: can't modify frozen Array
from (pry):3:in `__pry__'
[4] pry(main)> "String".is_a?(Number)
NameError: uninitialized constant Number
Did you mean?  Numeric
from (pry):4:in `__pry__'
[5] pry(main)>

 rubyweekly-cli git:(master) ✗ rake console
[1] pry(main)> s = RubyWeeklyScrapper.new(286)
=> #<RubyWeeklyScrapper:0x00007fbca8ad84e8
 @doc=
  #(Document:0x3fde545801ac {
    name = "document",
    children = [
      #(DTD:0x3fde54588d98 { name = "html" }),
      #(Element:0x3fde5458dac8 {
        name = "html",
        attributes = [ #(Attr:0x3fde5458cf4c { name = "lang", value = "en" })],
        children = [
          #(Text "\n"),
          #(Element:0x3fde54598270 {
            name = "head",
            children = [
              #(Text "\n  "),
[2] pry(main)> s.scrape_articles

From: /Users/amandarodgers/Flatiron/mod1/playground/rubyweekly-cli/lib/rubyweekly_scrapper.rb:27 RubyWeeklyScrapper#scrape_articles:

    20: def scrape_articles
    21:     # is going to break the convention of only knowing about newsletters and let it create articles
    22:     @doc.search("td[align='left'] table.gowide")[2..-1].each do |article_table|
    23:         #instantiate the article
    24:         #scrape the data
    25:         #add the article to the newsletter
    26:         a = Article.new
 => 27:         binding.pry
    28:     end
    29: end

[1] pry(#<RubyWeeklyScrapper>)> article_table.text
=> "\n\nRuby News\n\nSupport Plans for Ruby 2.0.0 and Ruby 2.1\n\nCore team support for Ruby 2.0.0 ended this week with no bug and security fixes forthcoming. Ruby 2.1’s maintenance phase will end with 2.1.9 in March. Everyone is recommended to upgrade to 2.2 or 2.3 soon.\n\n\n"
[2] pry(#<RubyWeeklyScrapper>)>

SCRAPING:
[1] pry(#<RubyWeeklyScrapper>)> article_table.text
=> "\n\nRuby News\n\nSupport Plans for Ruby 2.0.0 and Ruby 2.1\n\nCore team support for Ruby 2.0.0 ended this week with no bug and security fixes forthcoming. Ruby 2.1’s maintenance phase will end with 2.1.9 in March. Everyone is recommended to upgrade to 2.2 or 2.3 soon.\n\n\n"
[2] pry(#<RubyWeeklyScrapper>)> article_table.search("div:first").text
=> "\nRuby News\n"
[3] pry(#<RubyWeeklyScrapper>)> article_table.search("a:first").text
=> "Support Plans for Ruby 2.0.0 and Ruby 2.1"
[4] pry(#<RubyWeeklyScrapper>)> article_table.search("a:first").attr("href")
=> #(Attr:0x3fde5446b0b4 { name = "href", value = "https://rubyweekly.com/link/27501/web" })
[5] pry(#<RubyWeeklyScrapper>)>
[5] pry(#<RubyWeeklyScrapper>)> article_table.search("div:last").text
=> "\nCore team support for Ruby 2.0.0 ended this week with no bug and security fixes forthcoming. Ruby 2.1’s maintenance phase will end with 2.1.9 in March. Everyone is recommended to upgrade to 2.2 or 2.3 soon.\n"
[6] pry(#<RubyWeeklyScrapper>)>

[1] pry(#<RubyWeeklyScrapper>)> !!!
➜  rubyweekly-cli git:(master) ✗ rake console
[1] pry(main)> s = RubyWeeklyScrapper.new(286)
=> #<RubyWeeklyScrapper:0x00007fd20036adb0
 @doc=
  #(Document:0x3fe9000f8e34 {
    name = "document",
    children = [
      #(DTD:0x3fe900c2ba18 { name = "html" }),
      #(Element:0x3fe900c33588 {
        name = "html",
        attributes = [ #(Attr:0x3fe900c38524 { name = "lang", value = "en" })],
        children = [
          #(Text "\n"),
          #(Element:0x3fe900109248 {
            name = "head",
            children = [
              #(Text "\n  "),
[2] pry(main)> n = s.scrape
=> #<Newsletter:0x00007fd20036ad88
 @articles=
  [#<Article:0x00007fd200413af0 @author="Ruby News", @title="Support Plans for Ruby 2.0.0 and Ruby 2.1", @url="https://rubyweekly.com/link/27501/web">,
   #<Article:0x00007fd200410fd0 @author="Richard Schneeman", @title="Speeding up Sprockets", @url="https://rubyweekly.com/link/27502/web">,
   #<Article:0x00007fd20041b930 @author="RailsConf", @title="RailsConf 2016 - May 4-6, Kansas Cityprogram", @url="https://rubyweekly.com/link/27503/web">,
   #<Article:0x00007fd200419298
    @author="AppSignal  Sponsored",
    @title="Ruby Magic. A new email series that lets you in on Ruby's secrets.",
    @url="https://rubyweekly.com/link/27505/web">,
   #<Article:0x00007fd200423a90 @author="Alexander Dymo", @title="Is 2.3 Faster? The Performance of Immutable String Literals", @url="https://rubyweekly.com/link/27506/web">,
   #<Article:0x00007fd2004224b0 @author="Starr Horne", @title="Building A Simple Websockets Server From Scratch in Ruby", @url="https://rubyweekly.com/link/27507/web">,
   #<Article:0x00007fd200420548 @author="Jacob Rothstein", @title="A Brief Tour of Nokogiri DecoratorsLoofah", @url="https://rubyweekly.com/link/27508/web">,
   #<Article:0x00007fd20042ac28 @author="Andrei Horak", @title="WhoUsesThisGem: Which Top Projects Use Which Gems", @url="https://rubyweekly.com/link/27510/web">,
   #<Article:0x00007fd200429260 @author="Elle Meredith", @title="To Gem, or Not to Gem", @url="https://rubyweekly.com/link/27511/web">],
 @issue_date="Issue 286 — February 25, 2016">
[3] pry(main)> n.articles.first.url
=> "https://rubyweekly.com/link/27501/web"
[4] pry(main)>

 rubyweekly-cli git:(master) ✗ ruby ./bin/rubyweekly
Welcome to RubyWeekly!!!
1. Support Plans for Ruby 2.0.0 and Ruby 2.1
2. Speeding up Sprockets
3. RailsConf 2016 - May 4-6, Kansas Cityprogram
4. Ruby Magic. A new email series that lets you in on Ruby's secrets.
5. Is 2.3 Faster? The Performance of Immutable String Literals
6. Building A Simple Websockets Server From Scratch in Ruby
7. A Brief Tour of Nokogiri DecoratorsLoofah
8. WhoUsesThisGem: Which Top Projects Use Which Gems
9. To Gem, or Not to Gem
