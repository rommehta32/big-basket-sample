class ItemsController < AdministratorApplicationController

  skip_before_filter :authenticate_administrator!, only: [:index]
  before_action :authenticate_user!, only: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.updated_by = current_user.id
    if @item.save
      redirect_to items_path, notice: 'Successfully item created.'
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(item_params[:id])
    @item.updated_by = current_user.id
    if @item.update(item_params)
      redirect_to items_path, notice: 'Successfully item updated.'
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy! if @item
    flash[:success] = "Successfully item deleted."
    render json: {message: 'Successfully item deleted.'}
  end

  private

  def item_params
    params.require(:item).permit(:id, :name, :quantity, :unit_price)
  end
end
