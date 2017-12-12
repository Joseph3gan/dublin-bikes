class CartController < ApplicationController
  before_action :authenticate_user!
  def add
    #code to get ID of product
    id = params[:id]
    
    #if there was already a cart created use that cart
    #otherwise create new blank cart
    if session[:cart] then
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end
    #if product already exists in cart increment the value for that product
    #otherwise set v to 1
    if cart[id] then
      cart[id] = cart[id] +1
    else
      cart[id] = 1
    end
    
    redirect_to :action => :index
  
  end
    
    def clearCart
      session[:cart] = nil
      redirect_to :action => :index
    end
    #if there is a cart pass it to be displayed.
  def index
    if session[:cart] then
      @cart = session[:cart]
    else
      @cart = {}
    end
  end
  
  def remove
    id = params[:id]
    cart = session[:cart]
    cart.delete id
    redirect_to :action => :index
  end
  
  def createOrder
    @user = User.find(current_user.id)
    @order = @user.orders.build(:order_date=> DateTime.now, :status => 'Pending')
    @order.save
    
    @cart = session[:cart] ||{}#get content of cart
    @cart.each do | id, quantity |
    bike= Bike.find_by_id(id)
    @orderitem = @order.orderitems.build(:bike_id => bike.id, :title => bike.title, :description => bike.description, :qantity => quantity, :price => bike.price, :duration => bike.duration)
   
    @orderitem.save
  end

   @orders = Order.last
   
   @orderitems = Orderitem.where(order_id: Order.last)
    
   session[:cart] = nil

  end
end