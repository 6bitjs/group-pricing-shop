module Spree
  module Admin
    class VariantPricesController < ResourceController

      before_action :find_product_and_variant
      before_action :fetch_pricing_groups, only: [:new, :create, :edit, :update]
      
      def index
        @variant_prices = @variant.product_prices
        respond_with(@variant_prices)
      end

      def new
        @variant_price = @variant.product_prices.new
        respond_with(@product_price)
      end

      def create
        @variant_price = @variant.product_prices.new(variant_prices_params)
        if @variant_price.save
          flash[:notice] = "Created successfully."
          redirect_to admin_product_variant_variant_prices_path(@product, @variant)
        else
          flash[:error] = @variant_price.errors.full_messages.first
          render :new
        end
      end

      def edit
        @variant_price = @variant.product_prices.find(params[:id])
      end

      def update
        @variant_price = @variant.product_prices.find(params[:id])
        if @variant_price.update_attributes(variant_prices_params)
          flash[:notice] = "Updated successfully."
          redirect_to admin_product_variant_variant_prices_path(@product, @variant)
        else
          flash[:error] = @variant_price.errors.full_messages.first
          render :edit
        end
      end

      def destroy
        @variant_price = @variant.product_prices.find(params[:id])
        if @variant_price.destroy
          flash[:notice] = "Destroyed successfully."
        else
          flash[:error] = @variant_price.errors.full_messages.first
        end
        redirect_to admin_product_variant_variant_prices_path(@product, @variant)
      end

      private
        def variant_prices_params
          params.require(:product_price).permit(:pricing_group_id, :price)
        end

        def find_product_and_variant
          @product = Spree::Product.find_by_slug(params[:product_id])
          @variant = @product.variants.find(params[:variant_id])
        end

        def fetch_pricing_groups
          @pricing_groups = PricingGroup.all
        end

        def model_class
          @model_class ||= Spree::ProductPrice
        end

    end
  end
end