class OrdersHandler
  def self.get_booked_seats(route_id)
    orders = Order.where({ route: route_id });
    first_class = orders.map { |o| o.first_class_seats_count }.sum
    second_class = orders.map { |o| o.second_class_seats_count }.sum

    [first_class, second_class]
  end

  def self.create_order(params)
    Order.create({
        user_email: params[:user_email],
        route: params[:route_id],
        first_class_seats_count: params[:first_class],
        second_class_seats_count: params[:second_class]
     })
  end
end