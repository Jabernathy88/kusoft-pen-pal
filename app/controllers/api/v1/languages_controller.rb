module Api::V1
	class LanguagesController < ApplicationController
	  before_action :set_language, only: [:show, :update, :destroy]
	
	  # GET /languages
	  def index
			@languages = Language.order(id: :desc)
	
			render json: @languages
	  end
	
	  # GET /languages/1
	  def show
			render json: @language.as_json(include: [:proficiencies]) # serialized response
	  end
	
	  # POST /languages
	  def create
			@language = Language.new(language_params)
	
			if @language.save
				render json: @language, status: :created
			else
				render json: @language.errors, status: :unprocessable_entity
			end
	  end
	
	  # PATCH/PUT /languages/1
	  def update
			if @language.update(language_params)
				render json: @language
			else
				render json: @language.errors, status: :unprocessable_entity
			end
	  end
	
	  # DELETE /languages/1
	  def destroy
			@language.destroy
			if @language.destroy
				head :no_content, status: :ok
			else
				render json: @language.errors, status: :unprocessable_entity
			end      
	  end
	
	  private
		# Use callbacks to share common setup or constraints between actions.
		def set_language
		  @language = Language.find(params[:id])
		end
	
		# Only allow a trusted parameter "white list" through.
		def language_params
		  params.require(:language).permit(:name)
		end
	end
end  