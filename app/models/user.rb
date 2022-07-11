class User < ApplicationRecord
  #has_many_attached :files
  has_secure_password
  belongs_to :folder
  
end
