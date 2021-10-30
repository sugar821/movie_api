module Api
    module V1
        class UsersController < ApplicationController
            def index
                users = User.all
                render json: { data: users }
            end

            def show
                user = User.find(params[:id])
                render json: { data: user }
            end

            def create
                user = User.new(name:user_name, email:email)
                begin
                    user.save!
                    render json: { status: 200, data: user }
                rescue => e
                    render json: { status: 500, data: user.e }
                end
            end

            def destroy
                user = User.find_by_id(params[:id])
                if user.nil?
                    render json: { status: 400, data: 'target id is not exssts' }
                else
                    user.destroy!
                    render json: { status: 200, data: "id:#{params[:id]} is deleted" }
                end
            end

            def user_name
                raise ActionController::BadRequest.new("name is empty") if JSON.parse(params[:param])["name"].nil?
                JSON.parse(params[:param])["name"]
            end

            def email
                raise ActionController::BadRequest.new('email is empty') if JSON.parse(params[:param])["email"].nil?
                JSON.parse(params[:param])["email"]
            end
        end
    end
end
