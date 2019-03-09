class FoodmenusController < ApplicationController
  before_action :authenticate_user!, only:[:index, :new, :edit, :create, :destroy]

  def index
    @foodmenus = Foodmenu.paginate(page: params[:page])
  end

  def new
    @foodmenu = Foodmenu.new
  end

  def create
    @foodmenu = current_user.foodmenus.build(foodmenu_params)
    if @foodmenu.save
      flash[:success] = "フードメニューの投稿に成功しました"
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def edit
  end


  def destroy
  end

  private

  def foodmenu_params
    params.require(:foodmenu).permit(:title, :description)
  end
end
