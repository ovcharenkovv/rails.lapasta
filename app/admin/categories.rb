# -*- encoding : utf-8 -*-
ActiveAdmin.register Category do
  menu :priority => 20

  controller do
    cache_sweeper :category_sweeper
  end

  filter :name

  form :partial => "admin/categories/form"

  index do
    column :name
    column :published
    column :position
    default_actions
  end
end
