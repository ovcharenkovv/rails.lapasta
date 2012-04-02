class Attachment < ActiveRecord::Base
  belongs_to :product

  has_attached_file :attachment,
                    :url  => "/system/attachments/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/system/attachments/:id/:style_:basename.:extension",
	                  :styles => { :thumb=> "100x100#", :small  => "300x300>", :large => "600x600>" }
end
