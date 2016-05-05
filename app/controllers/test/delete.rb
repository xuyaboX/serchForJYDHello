require '~/.rvm/rubies/ruby-2.3.0/lib/ruby/2.3.0/rubygems.rb'
require '~/.rvm/gems/ruby-2.3.0/gems/rsolr-1.1.1/lib/rsolr.rb'
solr = RSolr.connect :url => 'http://localhost:8080/solr/books_core'
solr.delete_by_id "12346"