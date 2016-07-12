ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do


    columns do
      panel "Заказы" do
          table_for Order.all.where(status: ["new", "process"]) do
            column("Статус")   {|order| status_tag(order.status)}
            column("Дата"){|order| link_to order.created_at.to_time, order_admin_order_path(order.id) }
            column("Клиент")   {|order| order.username }
            column("Почта")   {|order| order.email }
            column("Телефон")   {|order| order.phone }
            column("Город")   {|order| order.city }
            column("Отделение новой почты")   {|order| order.nova_poshta }
            column("Сумма")   {|order| number_to_currency(order.total)}

            # column("Total")   {|order| number_to_currency order.total_price                       }
          end
        end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
