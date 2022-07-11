class Folder < ApplicationRecord
  acts_as_nested_set
  has_many_attached :files
  has_many :links
end
