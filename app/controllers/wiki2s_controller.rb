class Wiki2sController < ApplicationController
  def index
    @wiki2s = Wiki2.all
  end

  def show
    @wiki2 = Wiki2.find(params[:id])
  end

  def new
    @wiki2 = Wiki2.new
  end

  def create
    @wiki2 = @wiki2.new(wiki2_params)
    @wiki2.user = current_user
    
    if @wiki2.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki2
    else
      flash[:error] = "There was an error saving your Wiki. Please try again."
      render :new
    end
  end
  
  def edit
    @wiki2 = Wiki2.find(params[:id])
  end
  
  def update
    @wiki2 = Wiki2.find(params[:id])
    @wiki2.assign_attributes(wiki2_params)
 
    if @wiki2.save
      flash[:notice] = "Wiki was updated successfully."
      redirect_to @wiki2
    else
      flash.now[:alert] = "There was an error saving your Wiki. Please try again."
      render :edit
    end
  end
  
   def destroy
     @wiki2 = Wiki2.find(params[:id])
 
     if @wiki2.destroy
       flash[:notice] = "\"#{@wiki2.title}\" was deleted successfully."
       redirect_to @wiki2
     else
       flash.now[:alert] = "There was an error deleting the wiki."
       render :show
     end
   end
   
   # private method
   private
   
   def wiki2_params
     params.require(:wiki2).permit(:title, :body, :private)
   end
end