class Usertable
  include Mongoid::Document
  field :name, type: String
  field :pwd, type: String
  validates :name, presence: true, uniqueness: true, length: {maximum: 20, too_long: "最大长度为%{count}个字符"}
  has_many :booksuser
end
