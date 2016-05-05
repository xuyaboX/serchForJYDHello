require '~/.rvm/rubies/ruby-2.3.1/lib/ruby/2.3.0/rubygems.rb'
require '~/.rvm/gems/ruby-2.3.1/gems/rsolr-1.1.1/lib/rsolr.rb'
class BookController < ApplicationController
  def index
    @booklists=Book.all
  end

  def addbooks
    @book = Book.new(books_params)
    respond_to do |format|
      if @book.save
        # Direct connection
        solr = RSolr.connect :url => 'http://localhost:8080/solr/books_core'
        documents = [{:id=>@book.__id__, :bookname=>@book.bookname, :bookkey=>@book.bookkey, :bookmiaosu=>@book.bookmiaosu}]
        solr.add documents
        format.html { redirect_to book_index_path, notice: '图书保存成功.' }
      else
        format.html { redirect_to book_index_path, notice: '图书保存失败.' }
      end
    end
  end


  def gotoSelect
    @book=Book.new
  end

  def selectsolr
    @book = Book.new(books_name)
    @keyworld=@book.bookname
    solr = RSolr.connect :url => 'http://localhost:8080/solr/books_core'
    response = solr.get 'select', :params => {:q=>"bookname:#{@book.bookname} bookkey:#{@book.bookname} bookmiaosu:#{@book.bookname}", :start=>0,  :rows=>10}
    @books = response["response"]["docs"]
    puts response["response"]["docs"]
  end

  def books_params
    params.require(:book).permit(:bookname, :bookkey,:bookmiaosu)
  end
  def books_name
    params.require(:book).permit(:bookname)
  end
end
