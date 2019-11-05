class EventsController < ApplicationController
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
  end

  def create  
  end

  def show
    @event = Event.find(params[:id])
  end
end
