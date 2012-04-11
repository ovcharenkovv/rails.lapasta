# -*- encoding : utf-8 -*-
class Attachment < ActiveRecord::Base
  belongs_to :product

  has_attached_file :attachment,
                    :url  => "/system/attachments/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/system/attachments/:id/:style_:basename.:extension",
	                  :styles => { :thumb=> "70x70#", :catalog=>"180x180#",:on_show  => "402x402#", :large => "1000x1000#" }

  def attachment_url style
    "/system/attachments/#{self.id}/#{style}_#{self.attachment_file_name}"
  end

  def self.photo_not_available
    "/images/not_available.jpg"
  end

end
