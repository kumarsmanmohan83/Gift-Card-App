class OrdersController < ApplicationController
  #before_action :set_order
  #before_action :authenticate_user!, except: [:index]
  #before_action :correct_user, only: [:new, :create]
    # ----- add these lines here: -----
    def index
        @orders = Order.all
    end
    def adminhistory
      @orders = Order.all
      
    end
    def report
      @orders = Order.all
      @users = User.all
      
    end
    def new
       # @order = Order.new
        @order = current_user.orders.build
    end
    def create
     #   @order = Order.new(order_params)
        @order = current_user.orders.build(order_params)
        num=0
        loop do
          number = SecureRandom.random_number(10000000)
          num = "GF#{number}"
          break num unless Order.where(orderId: num).exists?
        end


        @order.delivery_status="OUT FOR DELIVERY"
        @order.orderId=num
        if @order.save
          flash[:notice] = "Order placed successfully!"
        #  format.json { render :show, status: :created, location: @order }
          puts @order.orderId
          redirect_to users_welcome_path
        else
          # If user fails model validation - probably a bad password or duplicate email:
          flash.now.alert = "Oops, couldn't placed your order , please try again !."
          render :new
        end
    end
    def correct_user
      @order = current_user.orders.find_by(id: params[:id])
      redirect_to users_welcome_path, notice: "Not Authorized " if @order.nil?
    end
    private
    # def set_order
    #   @order = Order.find(id: params[:user_id])
    # end
    def order_params
        # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
        # that can be submitted by a form to the user model #=> require(:user)
        params.require(:order).permit(:orderId, :firstName, :lastName, :giftValue, :mobileNo, :address, :user_id, :delivery_status)
    end

      
    # ----- end of added lines -----
end