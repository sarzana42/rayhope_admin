class Pimage < ActiveRecord::Base
    mount_uploader :pimage, PimageUploader
end
