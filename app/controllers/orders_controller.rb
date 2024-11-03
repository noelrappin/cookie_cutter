class OrdersController < ApplicationController
  def new

  end

  def create
    @order = CheckoutAction.new(
      buyer: Person.find(order_params[:buyer_id]),
      recipient: Person.find(order_params[:buyer_id]),
      line_items: line_items
    ).checkout

    if @order.save
      redirect_to @order, notice: "Person was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private def order_params = params[:order]

  private def line_items
    items_hash = order_params["items"]
    items_hash.keys.map do |item_id_string|
      amount = items_hash[item_id_string].to_i
      LineItem.new(item_id: item_id_string.to_i, quantity: amount)
    end.select { _1.quantity > 0 }
  end
end
