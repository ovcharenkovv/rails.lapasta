ActiveAdmin.register Page do

  filter :parent_id
  filter :title

  form :partial => "admin/pages/form"

  index do
    column :title
    column :published
    default_actions
  end
end
