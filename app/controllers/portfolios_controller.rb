class PortfoliosController < ApplicationController
  layout 'portfolio'
  def index
    @portfolio_items = Portfolio.all
    @page_title = "Portfolios"
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end
  

  def new
    @portfolio_item = Portfolio.new
  end


  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  def edit
    @portfolio_item = Portfolio.find(params[:id])
    @page_title = "Edit"
  end
  
  def update
    @portfolio_item = Portfolio.find(params[:id])
    
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
    
  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    #perform the lookup
    @portfolio_item = Portfolio.find(params[:id])
    
    #destroy/delete the record
    @portfolio_item.destroy
    
    #Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
  end
  
  
  private
  
  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name]
                                      )
  end
end

end