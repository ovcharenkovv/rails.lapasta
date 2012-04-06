ActiveAdmin.register Order do
  menu :priority => 40

  actions :index, :show

  filter :total_price
  filter :created_at

  #scope :all, :default => true
  #scope :in_progress
  #scope :complete

  index do
    column("Order", :sortable => :id) {|order| link_to "##{order.id} ", admin_order_path(order) }
    column("Name", :name)
    column("Phone", :phone)
    column("E-mail", :email)
    column("Address", :address)
    column("Date", :created_at)
    #column("Total") {|order| number_to_currency order.total_price }
    column("Status") {|order| status_tag(order.status) }
  end

  show do
    panel "Products" do
      table_for(order.line_items) do |t|
        t.column("Product") {|item| auto_link item.product }
        t.column("Supplier Price") {|item| item.product.supplier_price }
        t.column("Price") {|item| item.product.price }
        #tr :class => "odd" do
        #  td "Total:", :style => "text-align: right;"
        #  td order.total_price
        #end
      end
    end

    active_admin_comments
  end

  sidebar :customer_information, :only => :show do
    attributes_table_for order do
      row :name
      row :phone
      row :email
      row :address
      row :pay_type
      row :delivery_type
    end
  end

end
