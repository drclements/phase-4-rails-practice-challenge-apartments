class TenantsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_entity_unprocessable_response

    def index 
        render json: Tenant.all
    end

    def show 
        tenant = find_tenant
        render json: tenant
    end

    def create 
        tenant = Tenant.create!(tenant_params)
        render json: tenant, status: :created
    end

    def update 
        tenant = find_tenant
        tenant.update!(tenant_params)
        render json: tenant
    end

    def destroy 
        tenant = find_tenant
        tenant.destroy
        head :no_content
    end

private

    def tenant_params
        params.permit(:age, :name)
    end

    def find_tenant 
        Tenant.find(params[:id])
    end

    def render_entity_unprocessable_response invalid 
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
