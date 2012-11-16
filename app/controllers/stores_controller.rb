class StoresController < ApplicationController
  before_filter :load_org

  def load_org
    @organization = Organization.find(params[:organization_id])
  end
  # GET /stores
  # GET /stores.json
  def index
    @stores = @organization.stores

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stores }
      format.xml { render xml: @stores }
    end
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    @store = @organization.stores.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @store }
      format.xml { render xml: @store }
    end
  end

  # GET /stores/new
  # GET /stores/new.json
  def new
    @store = Store.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @store }
      format.xml { render xml: @store }
    end
  end

  # GET /stores/1/edit
  def edit
    @store = @organization.stores.find(params[:id])
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(params[:store])
    @organization.stores << @store

    respond_to do |format|
      if @organization.save
        format.html { redirect_to organization_stores_path(@organization), notice: 'Store was successfully created.' }
        format.json { render json: @store, status: :created, location: url }
        format.xml { render xml: @store, status: :created, location: url }
      else
        format.html { render action: "new" }
        format.json { render json: @store.errors, status: :unprocessable_entity }
        format.xml { render xml: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stores/1
  # PUT /stores/1.json
  def update
    @store = @organization.stores.find(params[:id])

    respond_to do |format|
      attrs = params[:store]
      if @store.update_attributes(:name => attrs[:name])
        format.html { redirect_to organization_stores_path(@organization), notice: 'Store was successfully updated.' }
        format.json { head :no_content }
        format.xml { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @store.errors, status: :unprocessable_entity }
        format.xml { render xml: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store = @organization.stores.find(params[:id])
    @store.destroy

    respond_to do |format|
      format.html { redirect_to organization_stores_url(@organization) }
      format.json { head :no_content }
      format.xml { head :no_content }
    end
  end
end
