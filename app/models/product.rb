# -*- encoding : utf-8 -*-
class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :supplier

  attr_accessible :title, :category_id, :supplier_id, :published, :price, :supplier_price, :status, :description, :attachments_attributes
  has_many :attachments

  accepts_nested_attributes_for :attachments, :allow_destroy => true

  validates :title, :category_id,:price, :presence => true

  def first_attache_url style
    "/system/attachments/#{self.attachments.first.id}/#{style}_#{self.attachments.first.attachment_file_name}"
  end

  def product_price
    self.price.to_s+' Грн.'
  end

  def self.bestsellers limit
    where(:published => true).limit(limit)
  end

  def self.related limit
    where(:published => true).limit(limit)
  end

  def self.latest limit
    where(:published => true).limit(limit)
  end

  def self.featured limit
    where(:published => true).limit(limit)
  end






end
