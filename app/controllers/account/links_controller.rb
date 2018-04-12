class Account::LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_links, only: %i[edit update destroy]
  before_action :fetch_tags, only: [:create]

  def index
    @links = current_links
    @tags = []
    @links.each { |link| @tags << link.tags }
    @tags.flatten!
    @tags.uniq!
  end

  def show
    @tag = params[:id]
    @links = current_links.where(tags: @tag)
  end

  def create
    fetch_tags
    @link = current_links.new(allowed_params)
    @link.update_attributes(tags: @tags.flatten)
    if @link.save
      redirect_to root_path, flash: { success: "The link has been created!" }
    else
      redirect_to account_dashboard_index_path, flash: { error: @link.errors.full_messages.to_sentence }
    end
  end

  def edit; end

  def update
    if @link.update_attributes(allowed_params)
      flash[:success] = "Link was successfully updated!"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @link.destroy
      respond_to_format
    else
      respond_to_format { render :destroy_error }
    end
  end

  private

  def fetch_links
    @link = Link.find(params[:id])
  end

  def fetch_tags
    @tags = Link.tag_list(params[:link][:tags])
  end

  def respond_to_format(&block)
    respond_to { |format| format.js(&block) }
  end

  def allowed_params
    params.require(:link).permit(:name, :description, tags: [])
  end
end
