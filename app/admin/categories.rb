ActiveAdmin.register Category do
  menu :priority => 20

  filter :name

  form :partial => "admin/categories/form"

  index do
    column :name
    column :published
    column :position
    default_actions
  end
end
