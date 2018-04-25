module Spree
  module Admin
    class ProductPricesController < ResourceController

      before_action :find_product
      before_action :fetch_pricing_groups, only: [:new, :create, :edit, :update]
      
      def index
        @product_prices = @product.product_prices
        respond_with(@product_prices)
      end

      def new
        @product_price = @product.product_prices.new
        respond_with(@product_price)
      end

      def create
        @product_price = @product.product_prices.new(product_prices_params)
        if @product_price.save
          flash[:notice] = "Created successfully."
          redirect_to admin_product_product_prices_path(@product)
        else
          flash[:error] = @product_price.errors.full_messages.first
          render :new
        end
      end

      def edit
        @product_price = @product.product_prices.find(params[:id])
      end

      def update
        @product_price = @product.product_prices.find(params[:id])
        if @product_price.update_attributes(product_prices_params)
          flash[:notice] = "Updated successfully."
          redirect_to admin_product_product_prices_path(@product)
        else
          flash[:error] = @product_price.errors.full_messages.first
          render :edit
        end
      end

      def destroy
        @product_price = @product.product_prices.find(params[:id])
        if @product_price.destroy
          flash[:notice] = "Destroyed successfully."
        else
          flash[:error] = @product_price.errors.full_messages.first
        end
        redirect_to admin_product_product_prices_path(@product)
      end

      private
        def product_prices_params
          params.require(:product_price).permit(:pricing_group_id, :price)
        end

        def find_product
          @product = Spree::Product.find_by_slug(params[:product_id])
        end

        def fetch_pricing_groups
          @pricing_groups = PricingGroup.all
        end

    end
  end
end