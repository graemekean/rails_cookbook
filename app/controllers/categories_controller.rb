class CategoriesController < ApplicationController

  def home
    @categories = Category.all
  end

def index
  @categories = Category.all

  #@countries.sort!{ |a,b| a.name.downcase <=> b.name.downcase }
  #@country = Country.find(params[:id])
end

def show
  @category = Category.find(params[:id])
  @recipes = Recipe.all
  @recipe = Recipe.find(params[:id])
end

def new
  @category = Category.new
  @categories = Category.all
end

def create
  Category.create(category_params)   #see the team_params from the private method below
  redirect_to(categories_path)
end

def destroy
  category = Category.find(params[:id])  #doesn't need @ since it is not exposed - only being deleted
  category.destroy
  redirect_to(categories_path)
end

def edit
    @category = Category.find(params[:id])

end

def update
  category = Category.find(params[:id]) #again - the data does not need to be exposed - no @
  category.update(category_params) #from the private method below - whitelist check
  redirect_to(categories_path)
end  

private
def category_params
  # allows these params to be accessed by the methods above
  params.require(:category).permit(:name)
end

end