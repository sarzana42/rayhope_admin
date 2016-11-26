class Perform < ActiveRecord::Base
        mount_uploader :performimage, PerformimageUploader
        acts_as_taggable
end
