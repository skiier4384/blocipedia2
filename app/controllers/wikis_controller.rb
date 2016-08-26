class WikisController < ApplicationController
  
  #before_action :require_sign_in, except: [:index, :show]
  
  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki

  end

  def new
    @wiki = Wiki.new
    authorize @wiki
    
    @other_users = User.all - [current_user]
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
    authorize @wiki
    
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving your Wiki. Please try again."
      render :new
    end
  end
  
  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    
    @other_users = User.all - [current_user]
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)
    authorize @wiki
    
 
    if @wiki.save
      flash[:notice] = "Wiki was updated successfully."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving your Wiki. Please try again."
      render :edit
    end
  end
  
   def destroy
     @wiki = Wiki.find(params[:id])
     authorize @wiki
 
     if @wiki.destroy
       flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
       redirect_to @wiki
     else
       flash.now[:alert] = "There was an error deleting the wiki."
       render :show
     end
   end
   
   # private method
   private
   
   def wiki_params
     params.require(:wiki).permit(:title, :body, :private)
   end
end
