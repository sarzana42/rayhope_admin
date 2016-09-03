class Customer < ActiveRecord::Base
    before_save { self.email = self.email.downcase }
     # 名前は必須入力かつ20文字以内
  validates :name1 , length: { maximum: 20 } , presence: true
  validates :name2 , length: { maximum: 20 } , presence: true
  validates :kana1 , length: { maximum: 20 } , presence: true
  validates :kana2 , length: { maximum: 20 } , presence: true
  # 内容は必須入力かつ2文字以上30文字以下
  validates :zip , length: { minimum: 2, maximum: 30 } , presence: true
  validates :address1 , length: { minimum: 2, maximum: 30 } , presence: true
  validates :address2 , length: { minimum: 2, maximum: 30 } , presence: true
  validates :address3 , length: { minimum: 2, maximum: 30 } , presence: true
  validates :tel1 , length: { minimum: 2, maximum: 30 } , presence: true
  validates :tel2 , length: { minimum: 2, maximum: 30 } , presence: true
  validates :fax , length: { minimum: 2, maximum: 30 } , presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email , length: { minimum: 2, maximum: 30 } , presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
