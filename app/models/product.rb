# -*- encoding : utf-8 -*-
class Product < ActiveRecord::Base
  #default_scope :order => 'title'


  belongs_to :category
  belongs_to :supplier
  has_many :attachments
  has_many :line_items
  #has_many :orders, :through => :line_items


  attr_accessible :title, :category_id, :supplier_id, :published, :price, :supplier_price, :status, :description, :attachments_attributes

  accepts_nested_attributes_for :attachments, :allow_destroy => true
  validates :title, :category_id,:price, :presence => true

  before_destroy :ensure_not_referenced_by_any_line_item

  def first_attache_url style
    "/system/attachments/#{self.attachments.first.id}/#{style}_#{self.attachments.first.attachment_file_name}"
  end

  def product_price
    self.price.to_s+' Грн.'
  end

  def self.bestsellers limit
    includes(:category).includes(:attachments).where(:published => true).limit(limit)
  end

  def self.related (limit,category_id,except)
    includes(:category).includes(:attachments).where( :category_id=>category_id,:published => true ).where(["id NOT IN (?)", except]).limit(limit).order("RAND()")
  end

  def self.latest limit
    includes(:category).includes(:attachments).where(:published => true).limit(limit)
  end

  def self.featured limit
    includes(:category).includes(:attachments).where(:published => true).limit(limit)
  end

  private
  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end

end
