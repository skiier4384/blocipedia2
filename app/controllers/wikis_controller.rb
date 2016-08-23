class WikisController < ApplicationController
  
  #before_action :require_sign_in, except: [:index, :show]
  
  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    
    if @wiki.private && current_user.standard?
      flash[:alert] = "You must be a premium user to view this Wiki."
      redirect_to new_user_session_path
    end
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
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
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    @wiki.assign_attributes(wiki_params)
    
 
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
