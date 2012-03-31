ActiveAdmin.register PageCategory do
  filter :name
  filter :description


  form :partial => "admin/page_categories/form"

  index do
    column :published
    column :name
    column :description
    default_actions
  end
end
