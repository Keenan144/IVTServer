class UnitsController < ApplicationController
  before_action :set_unit, only: [:show, :edit, :update, :destroy, :ajax_flagger]


  # GET /units
  # GET /units.json
  def index
    @units = []
    uniq_units = Unit.uniq.pluck(:unit_number)
    uniq_units.each do |base|
    units = Unit.where(unit_number: base)
    @units << units.order(:created_at).last

   end
  end

  def all
    @units = Unit.order(:updated_at).reverse
    @xlsUnits = Unit.all
    respond_to do |format|
      format.html
      format.xml { render :xml => @xlsUnits}
      format.xls { send_data @xlsUnits.to_xls, :filename => 'units.xls' }
    end
  end

  def search
    number = params[:search]
    @units = []
    if number != nil
      Unit.all.each do |unit|
      time = Time.parse(unit.updated_at.to_s).in_time_zone("Central Time (US & Canada)")
        if unit.unit_number[number.upcase]
          @units << unit 
        end
      end
    end

  end

  def ajax_flagger
    if @unit.flagged == true
      @unit.update(flagged: false)
    else
      @unit.update(flagged: true)
    end
    redirect_to @unit
  end

  def flagged 
    @units = Unit.where(flagged: true)
    respond_to do |format|
      format.html
      format.xml { render :xml => @units }
      format.xls { send_data @units.to_xls, :filename => 'flagged_units.xls' }
    end
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
        @unit.update(address: parse_address(@unit.address))
        parse_coordinates(@unit)
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
