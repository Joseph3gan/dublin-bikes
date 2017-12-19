class StaticPagesController < ApplicationController
  def home
  end

  def about
  end
  def paid
    flash[:notice] = 'Successful Transaction'
    @order = Order.last
    @order.update_attribute(:status , "Paid by: #{current_user.username_string}")
  end
end