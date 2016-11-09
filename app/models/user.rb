class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                    
  has_many :notes
  has_many :markinfos
  
  # def set_image(file)
  #   file = params[:user][:image]
  #       if !file.nil?
  #         file_name = file.original_filename
  #         File.open("public/user_images/#{file_name}", 'wb'){|f| f.write(file.read)}
  #         self.image = file_name
  #       end
  # end
  
    has_secure_password
end
