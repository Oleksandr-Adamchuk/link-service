class Account::LinksController < ApplicationController
  before_action :authenticate_user!

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
    @tags = Link.tag_list(params[:link][:tags])
    @link = current_links.new(allowed_params)
    @link.update_attributes(tags: @tags.flatten)
    if @link.save
      redirect_to root_path, flash: { success: "The link has been created!" }
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(allowed_params)
      flash[:success] = "Link was successfully updated!"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @link = Link.find(params[:id])
    if @link.destroy
      respond_to_format
    else
      respond_to_format { render :destroy_error }
    end
  end

  private

  def respond_to_format(&block)
    respond_to { |format| format.js(&block) }
  end

  def allowed_params
    params.require(:link).permit(:name, :description, tags: [])
  end
end
