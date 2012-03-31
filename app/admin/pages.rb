ActiveAdmin.register Page do

  filter :page_category
  filter :title

  form :partial => "admin/pages/form"

  index do
    column :published
    column :title
    default_actions
  end
end
