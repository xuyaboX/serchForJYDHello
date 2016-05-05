class Booksuser
  include Mongoid::Document
  belongs_to :book
  belongs_to :usertable
end
