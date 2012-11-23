class PairsController < ApplicationController
  before_filter :load_store

  def load_store
    @store = Store.find(params[:store_id])
  end

  # GET /pairs
  # GET /pairs.json
  def index
    @pairs = @store.pairs

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pairs }
      format.xml { render xml: @pairs }
    end
  end

  # GET /pairs/1
  # GET /pairs/1.json
  def show
    @pair = @store.pairs.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pair }
      format.xml { render xml: @pair }
    end
  end

  # GET /pairs/new
  # GET /pairs/new.json
  def new
    @pair = Pair.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pair }
      format.xml { render xml: @pair }
    end
  end

  # GET /pairs/1/edit
  def edit
    @pair = @store.pairs.find(params[:id])
  end

  # POST /pairs
  # POST /pairs.json
  def create
    @pair = Pair.new(params[:pair])
    @store.pairs << @pair

    respond_to do |format|
      if @store.save
        format.html { redirect_to organization_store_pairs_url(@store.organization, @store), notice: 'Pair was successfully created.' }
        format.json { render json: @pair, status: :created, location: url }
        format.xml { render xml: @pair, status: :created, location: url }
      else
        format.html { render action: "new" }
        format.json { render json: @pair.errors, status: :unprocessable_entity }
        format.xml { render xml: @pair.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pairs/1
  # PUT /pairs/1.json
  def update
    @pair = @store.pairs.find(params[:id])

    respond_to do |format|
      attrs = params[:pair]
      if @pair.update_attributes({:key => attrs[:key], :value => attrs[:value]})
        format.html { redirect_to organization_store_pairs_url(@store.organization, @store), notice: 'Pair was successfully updated.' }
        format.json { head :no_content }
        format.xml { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pair.errors, status: :unprocessable_entity }
        format.xml { render xml: @pair.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pairs/1
  # DELETE /pairs/1.json
  def destroy
    @pair = @store.pairs.find(params[:id])
    @pair.destroy

    respond_to do |format|
      format.html { redirect_to organization_store_pairs_url(@store.organization, @store) }
      format.json { head :no_content }
      format.xml { head :no_content }
    end
  end
end
