ActiveAdmin.register Product do
  menu :priority => 30
  form :partial => "admin/products/form"

  index do
    column :published
    column :title
    column :price
    column :supplier_price
    column :description
    default_actions
  end

  show do |product|
    attributes_table do
      row :title
      row :attachments do
        product.attachments.first
      end
    end
    active_admin_comments

  end

  #index :as => :grid, :columns => 4 do |product|
  #  product.attachments.first.url
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
