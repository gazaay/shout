class RssItemsController < ApplicationController
  before_action :set_rss_item, only: [:show, :edit, :update, :destroy]

  # GET /rss_items
  # GET /rss_items.json
  def index
    @rss_items = RssItem.all
  end

  # GET /rss_items/1
  # GET /rss_items/1.json
  def show
  end

  # GET /rss_items/new
  def new
    @rss_item = RssItem.new
  end

  # GET /rss_items/1/edit
  def edit
  end

  # POST /rss_items
  # POST /rss_items.json
  def create
    @rss_item = RssItem.new(rss_item_params)

    respond_to do |format|
      if @rss_item.save
        format.html { redirect_to @rss_item, notice: 'Rss item was successfully created.' }
        format.json { render :show, status: :created, location: @rss_item }
      else
        format.html { render :new }
        format.json { render json: @rss_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rss_items/1
  # PATCH/PUT /rss_items/1.json
  def update
    respond_to do |format|
      if @rss_item.update(rss_item_params)
        format.html { redirect_to @rss_item, notice: 'Rss item was successfully updated.' }
        format.json { render :show, status: :ok, location: @rss_item }
      else
        format.html { render :edit }
        format.json { render json: @rss_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rss_items/1
  # DELETE /rss_items/1.json
  def destroy
    @rss_item.destroy
    respond_to do |format|
      format.html { redirect_to rss_items_url, notice: 'Rss item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rss_item
      @rss_item = RssItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rss_item_params
      params.require(:rss_item).permit(:item, :pubDate, :guid)
    end
end
