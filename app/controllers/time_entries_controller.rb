class TimeEntriesController < ApplicationController
  before_action :set_time_entry, only: [:show, :edit, :update, :destroy]
  after_action :remove_alert

  # GET /time_entries
  # GET /time_entries.json
  def index
    @years = TimeEntry.where(user_id: current_user.id).select(:date).order(date: :desc).group_by { |te| te.date.year }.keys
    @months = TimeEntry.where(user_id: current_user.id).select(:date).order(date: :desc).group_by { |te| te.date.month }.keys

    @time_entries = TimeEntry.where(user_id: current_user.id).order(date: :asc)

    if params[:year]
      @time_entries = @time_entries.in_year(params[:year])
    end
    if params[:month]
      @time_entries = @time_entries.in_month(params[:month])
    end
  end

  # GET /time_entries/1
  # GET /time_entries/1.json
  def show
  end

  # GET /time_entries/new
  def new
    @time_entry = TimeEntry.new
    set_default_times()
  end

  # GET /time_entries/1/edit
  def edit
  end

  # POST /time_entries
  # POST /time_entries.json
  def create
    @time_entry = current_user.time_entries.new(time_entry_params)

    respond_to do |format|
      if @time_entry.save
        format.html { redirect_to @time_entry, notice: 'Time entry was successfully created.' }
        format.json { render :show, status: :created, location: @time_entry }
      else
        format.html { render :new }
        format.json { render json: @time_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_entries/1
  # PATCH/PUT /time_entries/1.json
  def update
    respond_to do |format|
      if @time_entry.update(time_entry_params)
        format.html { redirect_to @time_entry, notice: 'Time entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_entry }
      else
        format.html { render :edit }
        format.json { render json: @time_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_entries/1
  # DELETE /time_entries/1.json
  def destroy
    @time_entry.destroy
    respond_to do |format|
      format.html { redirect_to time_entries_url, notice: 'Time entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_entry
      @time_entry = TimeEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_entry_params
      params.require(:time_entry).permit(:date, :start, :end, :breaks, :total, :year, :month)
    end

    def set_default_times
      now = Time.current
      defaults = {
        start: {hour: 9, minute: 0},
        end: {hour: 17, minute: 45},
        breaks: {hour: 0, minute: 45},
      }

      @time_entry.date = now
      @time_entry.start = helpers.default_to_date(defaults, :start)
      @time_entry.end = TimeEntry.round_time(helpers.default_to_date(defaults, :end))
      @time_entry.breaks = helpers.default_to_date(defaults, :breaks)
      time_diff = @time_entry.end - @time_entry.start
      total_time = time_diff - @time_entry.breaks.to_f
      @time_entry.total = Time.zone.at(total_time)
    end

    def remove_alert
      flash[:alert] = nil
    end
end
