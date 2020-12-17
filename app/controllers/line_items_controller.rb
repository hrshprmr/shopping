class LineItemsController < ApplicationController
  before_action :create_order, only: [:create, :index]
  # ss
  def index
    @line_items = @order.line_items
  end
  def create
    @line_item = @order.line_items.new(line_item_params)
    @line_item.user_id = current_user.id
    @line_item.save
      redirect_to products_path
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
#   before_action :set_line_item, only: [:show, :edit, :update, :destroy]
#  before_action :set_product, only: [:create, :destroy]
#   # GET /line_items
#   # GET /line_items.json
#   def index
#     @line_items = LineItem.all
#   end

#   # GET /line_items/1
#   # GET /line_items/1.json
#   def show
#   end

#   # GET /line_items/new
#   def new
#     @line_item = LineItem.new
#   end

#   # GET /line_items/1/edit
#   def edit
#   end

#   # POST /line_items
#   # POST /line_items.json
#   def create
#     # @product = Product.find(params[:product_id])

#     @line_item = @product.line_items.create(line_item_params)

#     respond_to do |format|
#       if @line_item.save
#         format.html { redirect_to product_line_items_path, notice: 'Line item was successfully created.' }
#         format.json { render :show, status: :created, location: @line_item }
#       else
#         format.html { render :new }
#         format.json { render json: @line_item.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /line_items/1
#   # PATCH/PUT /line_items/1.json
#   def update
#     respond_to do |format|
#       if @line_item.update(line_item_params)
#         format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
#         format.json { render :show, status: :ok, location: @line_item }
#       else
#         format.html { render :edit }
#         format.json { render json: @line_item.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /line_items/1
#   # DELETE /line_items/1.json
#   def destroy
#     @line_item.destroy
#     respond_to do |format|
#       format.html { redirect_to product_line_items_path, notice: 'Line item was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

#   private
#   def set_product
#     @product = Product.find(params[:product_id])
#   end
#     # Use callbacks to share common setup or constraints between actions.
#     def set_line_item
#       @line_item = LineItem.find(params[:id])
#     end

#     # Only allow a list of trusted parameters through.
#     def line_item_params
#       params.require(:line_item).permit(:product_id, :quantity, :price)
#     end
end
