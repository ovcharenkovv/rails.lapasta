class PageCategoriesController < ApplicationController
  # GET /page_categories
  # GET /page_categories.json
  def index
    @page_categories = PageCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @page_categories }
    end
  end

  # GET /page_categories/1
  # GET /page_categories/1.json
  def show
    @page_category = PageCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page_category }
    end
  end

  # GET /page_categories/new
  # GET /page_categories/new.json
  def new
    @page_category = PageCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page_category }
    end
  end

  # GET /page_categories/1/edit
  def edit
    @page_category = PageCategory.find(params[:id])
  end

  # POST /page_categories
  # POST /page_categories.json
  def create
    @page_category = PageCategory.new(params[:page_category])

    respond_to do |format|
      if @page_category.save
        format.html { redirect_to @page_category, notice: 'Page category was successfully created.' }
        format.json { render json: @page_category, status: :created, location: @page_category }
      else
        format.html { render action: "new" }
        format.json { render json: @page_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /page_categories/1
  # PUT /page_categories/1.json
  def update
    @page_category = PageCategory.find(params[:id])

    respond_to do |format|
      if @page_category.update_attributes(params[:page_category])
        format.html { redirect_to @page_category, notice: 'Page category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_categories/1
  # DELETE /page_categories/1.json
  def destroy
    @page_category = PageCategory.find(params[:id])
    @page_category.destroy

    respond_to do |format|
      format.html { redirect_to page_categories_url }
      format.json { head :no_content }
    end
  end
end
