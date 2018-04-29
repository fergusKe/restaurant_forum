class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
    @categories = Category.all
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new
  end
  
  # GET restaurants/feeds
  # 會去 render app/views/restuarants/feeds.html.erb
  def feeds
    @recent_restaurants = Restaurant.all.order(created_at: :desc).limit(10)
    @recent_comments = Comment.all.order(created_at: :desc).limit(10)
  end
  
  def dashboard
    @restaurant = Restaurant.find(params[:id])
  end
  
  # POST /restaurants/:id/favorite
  def favorite
    @restaurant = Restaurant.find(params[:id])
    @restaurant.favorites.create!(user: current_user)
    @restaurant.count_favorites
    redirect_back(fallback_location: root_path)
  end
  
  # POST /restaurants/:id/unfavorite
  def unfavorite
    @restaurant = Restaurant.find(params[:id])
    
    favorite = Favorite.where(restaurant: @restaurant, user: current_user)
    favorite.destroy_all
    @restaurant.count_favorites
    redirect_back(fallback_location: root_path)
  end
end
