class RssChannelsController < ApplicationController
  before_action :set_rss_channel, only: [:show, :edit, :update, :destroy]

  # GET /rss_channels
  # GET /rss_channels.json
  def index
    @rss_channels = RssChannel.all
  end

  # GET /rss_channels/1
  # GET /rss_channels/1.json
  def show
  end

  # GET /rss_channels/new
  def new
    @rss_channel = RssChannel.new
  end

  # GET /rss_channels/1/edit
  def edit
  end

  # POST /rss_channels
  # POST /rss_channels.json
  def create
    @rss_channel = RssChannel.new(rss_channel_params)

    respond_to do |format|
      if @rss_channel.save
        format.html { redirect_to @rss_channel, notice: 'Rss channel was successfully created.' }
        format.json { render :show, status: :created, location: @rss_channel }
      else
        format.html { render :new }
        format.json { render json: @rss_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rss_channels/1
  # PATCH/PUT /rss_channels/1.json
  def update
    respond_to do |format|
      if @rss_channel.update(rss_channel_params)
        format.html { redirect_to @rss_channel, notice: 'Rss channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @rss_channel }
      else
        format.html { render :edit }
        format.json { render json: @rss_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rss_channels/1
  # DELETE /rss_channels/1.json
  def destroy
    @rss_channel.destroy
    respond_to do |format|
      format.html { redirect_to rss_channels_url, notice: 'Rss channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rss_channel
      @rss_channel = RssChannel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rss_channel_params
      params.require(:rss_channel).permit(:title, :link, :description, :language, :blogChannel, :copyright, :lastBuildDate, :docs, :generator, :category, :managingEditor, :webMaster)
    end
end
