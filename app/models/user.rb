class User < ApplicationRecord
  validates :username, presence :true, length:{minimu:4,maximun:6}
  validates :password, presence :true, length:{minimu:4,maximun:6}
  validates :email, presence :true
end
