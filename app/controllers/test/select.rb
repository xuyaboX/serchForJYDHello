 require '~/.rvm/rubies/ruby-2.3.0/lib/ruby/2.3.0/rubygems.rb'
 require '~/.rvm/gems/ruby-2.3.0/gems/rsolr-1.1.1/lib/rsolr.rb'
 solr = RSolr.connect :url => 'http://10.99.99.222:8080/solr/books_core'
 response = solr.get 'select', :params => {:q=>'bookname:人脉abcdefg', :start=>0,  :rows=>10}
 response["response"]["docs"].each{|doc| puts doc["bookname"] }
