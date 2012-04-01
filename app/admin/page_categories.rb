ActiveAdmin.register PageCategory do
  menu :parent => "CMS"

  filter :name
  filter :description


  form :partial => "admin/page_categories/form"

  index do
    column :name
    column :published
    column :description
    default_actions
  end
end
