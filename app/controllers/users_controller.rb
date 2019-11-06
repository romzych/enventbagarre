class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @event_id_array = []
    current_user.events.each do |event|
      @event_id_array << event.id
    end
  end
end
