class Event::KaraokesController < ApplicationController
  # GET /event/karaokes
  # GET /event/karaokes.json
  def index
    @event_karaokes = Event::Karaoke.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_karaokes }
    end
  end

  # GET /event/karaokes/1
  # GET /event/karaokes/1.json
  def show
    @event_karaoke = Event::Karaoke.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_karaoke }
    end
  end

  # GET /event/karaokes/new
  # GET /event/karaokes/new.json
  def new
    @event_karaoke = Event::Karaoke.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_karaoke }
    end
  end

  # GET /event/karaokes/1/edit
  def edit
    @event_karaoke = Event::Karaoke.find(params[:id])
  end

  # POST /event/karaokes
  # POST /event/karaokes.json
  def create
    @event_karaoke = Event::Karaoke.new(params[:event_karaoke])

    respond_to do |format|
      if @event_karaoke.save
        format.html { redirect_to @event_karaoke, notice: 'Karaoke was successfully created.' }
        format.json { render json: @event_karaoke, status: :created, location: @event_karaoke }
      else
        format.html { render action: "new" }
        format.json { render json: @event_karaoke.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event/karaokes/1
  # PUT /event/karaokes/1.json
  def update
    @event_karaoke = Event::Karaoke.find(params[:id])

    respond_to do |format|
      if @event_karaoke.update_attributes(params[:event_karaoke])
        format.html { redirect_to @event_karaoke, notice: 'Karaoke was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_karaoke.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event/karaokes/1
  # DELETE /event/karaokes/1.json
  def destroy
    @event_karaoke = Event::Karaoke.find(params[:id])
    @event_karaoke.destroy

    respond_to do |format|
      format.html { redirect_to event_karaokes_url }
      format.json { head :no_content }
    end
  end
end
