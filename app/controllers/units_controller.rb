class UnitsController < ApplicationController
  before_action :set_unit, only: [:show, :edit, :update, :destroy]


  # GET /units
  # GET /units.json
  def index
    @units = Unit.uniq.pluck(:unit_number)
  end

  def all
    @units = Unit.order(:updated_at).all.reverse
  end

  def search
    number = params[:search]
    @units = []
    Unit.all.each do |unit|
    time = Time.parse(unit.updated_at.to_s).in_time_zone("Central Time (US & Canada)")
      if unit.unit_number[number.upcase]
        @units << unit 
      elsif unit.username.downcase[number.downcase]
        @units << unit
      elsif unit.address.downcase[number.downcase]
        @units << unit
      elsif time.strftime("%m/%d/%Y at %I:%M%p CT").to_s.downcase[number.downcase]
        @units << unit
          
      end
    end
  end

  def flagged 
    @units = Unit.where(flagged: true)
  end


  # GET /units/1
  # GET /units/1.json
  def show
  end

  # GET /units/new
  def new
    @unit = Unit.new
  end

  # GET /units/1/edit
  def edit
  end

  # POST /units
  # POST /units.json

  def create

    respond_to do |format|
      if @unit.save
        format.html { redirect_to @unit, notice: 'Unit was successfully created.' }
        format.json { render :show, status: :created, location: @unit }
      else
        format.html { render :new }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /units/1
  # PATCH/PUT /units/1.json
  def update
    respond_to do |format|
      if @unit.update(unit_params)
        format.html { redirect_to @unit, notice: 'Unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @unit }
      else
        format.html { render :edit }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1
  # DELETE /units/1.json
  def destroy
    @unit.destroy
    respond_to do |format|
      format.html { redirect_to units_url, notice: 'Unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_params
      params[:unit].permit(:unit_number, :longitude, :latitude, :address, :username)
    end
end
