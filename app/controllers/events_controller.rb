class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @all_events = []
    Event.all.each do |e|
      @all_events << e
    end
    puts "#" * 60
    puts @all_events
    puts "#" * 60
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(title: params[:event_title],location: params[:event_location], start_date: params[:event_start_date], duration: params[:event_duration], price: params[:event_price], description: params[:event_description]) 
    @at = Attendance.new(user: current_user, event: @event)
    if @event.save && @at.save # essaie de sauvegarder en base @gossip
      redirect_to event_path(@event.id)
    else
      render 'events/new', to: 'events#new'
    end 
  end

  def show
    @event = Event.find(params[:id])
  end
end
