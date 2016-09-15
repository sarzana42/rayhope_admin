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
                    
  def self.to_csv
    CSV.generate do |csv|
      # column_namesはカラム名を配列で返す
      # 例: ["id", "name", "price", "released_on", ...]
      csv << column_names
      all.each do |product|
        # attributes はカラム名と値のハッシュを返す
        # 例: {"id"=>1, "name"=>"レコーダー", "price"=>3000, ... }
        # valudes_at はハッシュから引数で指定したキーに対応する値を取り出し、配列にして返す
        # 下の行は最終的に column_namesで指定したvalue値の配列を返す
        csv << product.attributes.values_at(*column_names)
      end
    end                    

　def self.csv_column_names
    ["ID", "名前1", "名前2", "かな1", "かな2", "郵便番号", "都道府県", "住所", "以降", "TEL1", "TEL2", "FAX", "メール"]
  end

  def csv_column_values
    [id, name1, name2, kana1, kana2, zip, address1, address2, address3, tel1, tel2, fax, email,]
  end

end
