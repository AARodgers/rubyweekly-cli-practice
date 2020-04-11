- require_all is a gem and you have to put it in the gem file






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
