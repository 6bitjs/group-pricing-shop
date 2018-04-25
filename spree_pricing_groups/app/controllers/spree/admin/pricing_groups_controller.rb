module Spree
  module Admin
    class PricingGroupsController < ResourceController

      before_action :find_pricing_group, only: [:edit, :update, :destroy]
      
      def index
        @pricing_groups = Spree::PricingGroup.all
        session[:return_to] = request.url
        respond_with(@procing_groups)
      end

      def new
        @pricing_group = PricingGroup.new
        session[:return_to] = request.url
        respond_with(@procing_groups)
      end

      def create
        @pricing_group = Spree::PricingGroup.new(pricing_group_params)
        if @pricing_group.save
          flash[:notice] = "Created successfully."
          redirect_to admin_pricing_groups_path
        else
          flash[:error] = @pricing_group.errors.full_messages.first
          render :new
        end
      end

      def edit
      end

      def update
        if @pricing_group.update_attributes(pricing_group_params)
          flash[:notice] = "Updated successfully."
          redirect_to admin_pricing_groups_path
        else
          flash[:error] = @pricing_group.errors.full_messages.first
          render :edit
        end
      end

      def destroy
        if @pricing_group.destroy
          flash[:notice] = "Destroyed successfully."
        else
          flash[:error] = @pricing_group.errors.full_messages.first
        end
        redirect_to admin_pricing_groups_path
      end

      private
        def pricing_group_params
          params.require(:pricing_group).permit(:name, :identifier)
        end

        def find_pricing_group
          @pricing_group = Spree::PricingGroup.find(params[:id])
        end

    end
  end
end