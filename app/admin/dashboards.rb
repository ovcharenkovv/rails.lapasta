# -*- encoding : utf-8 -*-
ActiveAdmin::Dashboards.build do

  section "Orders", :priority => 1 do
    table_for Order.all do
      column("Order", :sortable => :id) {|order| link_to "##{order.id} ", admin_order_path(order) }
      column("Name", :name)
      column("Phone", :phone)
      column("E-mail", :email)
      column("Address", :address)
      column("Date", :created_at)
    end
  end


  section "NewRelic server status", :priority => 2 do

    div do
      text_node %{<iframe src="https://rpm.newrelic.com/public/charts/4avwiQ0VeDH" width="500" height="150" scrolling="no" frameborder="no"></iframe>}.html_safe
    end

    div do
      br
      text_node %{<iframe src="https://rpm.newrelic.com/public/charts/5zDXL5S3hmz" width="500" height="150" scrolling="no" frameborder="no"></iframe>}.html_safe
    end

    div do
      br
      text_node %{<iframe src="https://rpm.newrelic.com/public/charts/47xts25hEfq" width="500" height="200" scrolling="no" frameborder="no"></iframe>}.html_safe
    end

    div do
      br
      text_node %{<iframe src="https://rpm.newrelic.com/public/charts/eX6jbIoyaph" width="500" height="200" scrolling="no" frameborder="no"></iframe>}.html_safe
    end


  end


  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.

  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end

  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end

  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.

  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }

end
