class Business < ActiveRecord::Base
    has_secure_password
    mount_uploader :bizlogo,  BizlogoUploader

end
