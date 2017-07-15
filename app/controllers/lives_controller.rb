class LivesController < ApplicationController
  before_action :set_life, only: [:show, :edit, :update, :destroy]
  before_action :set_cat, only: [:new, :create, :update, :create]


  # GET /lives
  # GET /lives.json
  def index
    @lives = @cat.lives
  end

  # GET /lives/1
  # GET /lives/1.json
  def show
  end

  # GET /lives/new
  def new
    # @life = Life.new
    @life = @cat.lives.new
    # @cat = Cat.find(params[:cat_id])
  end

  # GET /lives/1/edit
  def edit
  end

  # POST /lives
  # POST /lives.json
  def create
    # @cat = Cat.find(params[:cat_id])
    @life = @cat.lives.new(life_params)
    # @life.cat = @cat

    respond_to do |format|
      if @life.save
        format.html { redirect_to @life, notice: 'Life was successfully created.' }
        format.json { render :show, status: :created, location: @life }
      else
        format.html { render :new }
        format.json { render json: @life.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lives/1
  # PATCH/PUT /lives/1.json
  def update
    respond_to do |format|
      if @life.update(life_params)
        format.html { redirect_to @life, notice: 'Life was successfully updated.' }
        format.json { render :show, status: :ok, location: @life }
      else
        format.html { render :edit }
        format.json { render json: @life.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lives/1
  # DELETE /lives/1.json
  def destroy
    @life.destroy
    respond_to do |format|
      format.html { redirect_to lives_url, notice: 'Life was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_life
      @life = Life.find(params[:id])
      # @life = @cat.lives.find(params[:id])
    end
    def set_cat
      @cat = current_user.cats.find(params[:cat_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def life_params
      params.require(:life).permit(:number, :cat_id)
    end
end
