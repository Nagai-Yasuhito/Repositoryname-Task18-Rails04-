class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i
#パスワードの文字数制限を追加する
  
#パスワードをアルファベット、数字の混合のみ可能にしてください
  validates :password, format: { with: VALID_PASSWORD_REGEX}
  
#メールアドレスの正規表現を追加してください
  VALID_EMAIL_REGEX = /\A\S+@\S+\.\S+\Z/
  validates :email, format: {with: VALID_EMAIL_REGEX}
  
#名前の長さに制限を追加する
  validates :name, length: { maximum: 15}

  has_secure_password
  
end
