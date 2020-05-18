class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :confirm_login, only: [:create, :edit, :update, :destroy]
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    #redundant with Event scope
    # @previous_events = Event.past
    # @upcoming_events = Event.upcoming
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    #@event = Event.new(event_params)
    @event = User.find(cookies[:id]).events.build(event_params)
    @event.creator = User.find(cookies[:id])
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1def update
  # PATCH/PUT /events/1.json

  def rsvp
    @event = Event.find(params[:event])
    @event.attendees << User.find(cookies[:id])
    #@event.attendees << User.create(name: "eddy", username: "Sponge eddy")
    @event.save
    redirect_to event_path(@event)
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :date, :description, :user_id, :creator_id, :creator)
    end

    def confirm_login
      if cookies[:id].nil?
        flash.notice = "Please Log In Before Creating Event"
        redirect_to root_path
      end
    end
end
