class User < ApplicationRecord
  validates :username,
            presence: true, uniqueness:{case_sensetive: false},
            length:{minimum:4,maximum:6}
  validates :password, presence: true, length:{minimum:4,maximum:6}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness:{case_sensetive: false},
            format: {with: VALID_EMAIL_REGEX}
end
