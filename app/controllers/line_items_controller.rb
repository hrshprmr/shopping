class LineItemsController < ApplicationController
  before_action :create_order, only: [:index, :create, :destroy, :edit, :update]

  def index
    @line_items = @order.line_items
  end
  def create
    @line_item = @order.line_items.new(line_item_params)
    @line_item.user_id = current_user.id
    @line_item.save
      redirect_to products_path
  end

  def destroy
    @line_item = @order.line_items.find(params[:id])
    @line_item.destroy
    redirect_to order_line_items_path
  end


  def update
  @line_item = @order.line_items.find(params[:id])
  @line_item.update(line_item_params)
  redirect_to order_line_items_path
end

  private

    def create_order
      @order = current_user.orders.where(status: 0).first
      if @order.present?
        @order = Order.find(params[:order_id])
      else
        @order = Order.create(status: 0)
      end
      @order
    end


    def line_item_params
      params.require(:line_item).permit(:product_id, :quantity)
    end
  end
