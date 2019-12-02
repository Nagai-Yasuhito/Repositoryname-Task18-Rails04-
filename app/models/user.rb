class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  
  VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9]+\Z/
#パスワードの文字数制限を追加する
  validates :password, length: { minimum:8 , maximum: 32 }
  
#パスワードをアルファベット、数字の混合のみ可能にしてください
  validates :password, format: { with: VALID_PASSWORD_REGEX}
  
#メールアドレスの正規表現を追加してください
  VALID_EMAIL_REGEX = /\A\S+@\S+\.\S+\Z/
  validates :email, format: {with: VALID_EMAIL_REGEX}
  
#名前の長さに制限を追加する
  validates :name, length: { maximum: 15}

  has_secure_password
  
end
