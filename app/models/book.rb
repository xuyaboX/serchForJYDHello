class Book
  include Mongoid::Document
  field :bookname, type: String
  field :bookkey, type: String
  field :bookmiaosu, type: String
  validates :bookname, presence: true,uniqueness: true
  has_many :booksuser
end
