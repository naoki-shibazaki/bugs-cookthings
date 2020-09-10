class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
      end
    
      def new
        @recipe = Recipe.new
        @recipe.food_stuffs.build
      end
    
      def show
        @recipe = Recipe.includes(:food_stuffs).find(params[:id])
      end
    
      def create
        @recipe = Recipe.create(recipe_param)
        if @recipe.save
          flash[:success] = "登録しました"
          @recipes = Recipe.all
          redirect_to recipes_path
        else
          flash.now[:danger] = "なにかちがう"
          render :new
        end
      end
    
      def edit
        @recipe = Recipe.includes(:food_stuffs).find(params[:id])
      end
    
      def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        redirect_to recipes_path, notice:"削除しました"
      end
    
      def update
        @recipe = Recipe.find(params[:id])
        if @recipe.update(recipe_param)
          redirect_to recipes_path, notice: "編集しました"
        else
          render 'edit'
        end
      end
    
      private
    
      def recipe_param
        params.require(:recipe).permit(
            :cook_at, 
            :recipe_name,
            :category,
            food_stuffs_attributes:[
                :food_stuff,
                :amount,
                :mass
            ]
        )
      end
end
