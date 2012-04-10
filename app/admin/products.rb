# -*- encoding : utf-8 -*-
ActiveAdmin.register Product do
  menu :priority => 30
  form :partial => "admin/products/form"

  controller do
    cache_sweeper :product_sweeper
  end


  index do
    column "Images" do |product|

        link_to (edit_admin_product_path(product)) do
          if !product.attachments.first.nil?
            image_tag(product.first_attache_url(:thumb))
          else
            product.id
          end
        end

    end
    column :published
    column :title
    column :category
    column :price
    column :supplier_price
    #column :description
    #default_actions
  end

  show do |product|
    attributes_table do
      row :id
      row :published
      row :title
      row :price
      row :supplier_price
      row :supplier
      row :category
      row :status
      row :description
      row :featured
    end
    active_admin_comments

  end

  sidebar :pictures,:only => :show, :partial => "sidebar"



  #sidebar :pictures do
  #  product.attachments.each do |att|
  #    att.inspect
  #  end
  #end

  controller do
    def new
      @product = Product.new
      3.times { @product.attachments.build }
    end
    def edit
      @product = Product.find(params[:id])
      3.times { @product.attachments.build }
    end
  end


end
