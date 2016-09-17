class Customer < ActiveRecord::Base
    require 'csv'
    require 'kconv'
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
        

def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << csv_column_names
      all.each do |product|
        csv << product.csv_column_values
      end
    end
end

    def self.csv_column_names
     str_sjis = ["ID", "名前1".tosjis, "名前2".tosjis, "かな1".tosjis, "かな2".tosjis, "郵便番号".tosjis, "都道府県".tosjis, "住所".tosjis, "以降".tosjis, "TEL1", "TEL2", "FAX", "メール".tosjis ]
    end
    
    def csv_column_values
        [id, name1, name2, kana1, kana2, zip, address1, address2, address3, tel1, tel2, fax, email,]
    end
    
    # ファイルインポート
    def self.import(file)
        spreadsheet = open_spreadsheet(file)
        header = spreadsheet.row(1)
    
        (2..spreadsheet.last_row).each do |i|
          # {カラム名 => 値, ...} のハッシュを作成する
          row = Hash[[header, spreadsheet.row(i)].transpose]
    
          # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
          customer = find_by(id: row["id"]) || new
              # CSVからデータを取得し、設定する
              customer.attributes = row.to_hash.slice(*updatable_attributes)
              # 保存する
              customer.save!
          end
    end

      def self.open_spreadsheet(file)
        case File.extname(file.original_filename)
        when '.csv'  then Roo::Csv.new(file.path,    nil, :ignore)
        when '.xls'  then Roo::Excel.new(file.path,  nil, :ignore)
        when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
        when '.ods'  then Roo::OpenOffice.new(file.path, nil, :ignore)
        else raise "Unknown file type: #{file.original_filename}"
        end
      end

   # 更新を許可するカラムを定義
   def self.updatable_attributes
       ["ID", "name1", "name2", "kana1", "kana2", "zip", "address1", "address2", "address3", "tel1", "tel2", "fax", "email" ]
   end

end
