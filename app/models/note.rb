class Note < ActiveRecord::Base
    validates :title, presence: true
    validates :content, presence: true
    validates :name, presence: true
    
    belongs_to :user
end
