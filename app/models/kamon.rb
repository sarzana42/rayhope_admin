class Kamon < ActiveRecord::Base
    mount_uploader :kamonpic, KamonpicUploader
    acts_as_taggable
end
