module Api
    module V1
        class MoviesController < ApplicationController
            def index
                movies = Movie.all
                render json: { data: movies }
            end

            def show
                movie = Movie.find(params[:id])
                render json: { data: movie }
            end

            def create
                movie = Movie.new(title:title)
                begin
                    movie.save!
                    render json: { status: '200', data: movie }
                rescue => e
                    render json: { status: '500', data: movie.e }
                end
            end

            def destroy
                movie = Movie.find_by_id(params[:id])
                if movie.nil?
                    render json: { status: 400, data: 'target id is not exssts' }
                else
                    movie.destroy!
                    render json: { status: 200, data: "id:#{params[:id]} is deleted" }
                end
            end

            def title
                raise ActionController::BadRequest.new("title is empty") if JSON.parse(params[:param])["title"].nil?
                JSON.parse(params[:param])["title"]
            end
        end
    end
end
