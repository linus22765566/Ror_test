class EventsController < ApplicationController
    
    
    before_action :set_event ,:only => [:show,:edit,:update,:destroy]
    
    
    
    #get/events/index
    #get/events
    def index
        @events=Event.page(params[:page]).per(25)
    end
    
    # GET /events/show/:id
    def show
   
        @page_title = @event.name
    end
    
    # GET /events/edit/:id
    def edit
   
    end
    
    # GET/events/new
    def new 
        @event = Event.new
    end
    
    #post/events/vreate
    def create
        @event = Event.new(event_params)
        if @event.save
            flash[:notice] = "create成功"
            redirect_to :action =>:index
        else
            render :action => :new #new.html.erb
        end
    end
    
    def set_event
        @event = Event.find(params[:id])
    end
    #post/events/update/:id
    def update

        if @event.update(event_params)
            flash[:notice] = "update成功"
            redirect_to :action=>:show,:id =>@event
        else
            render :action => :edit  #new.html.erb
        end
    end
    
    #post/events/destroy/:id
    def destroy
        flash[:alert] = "delete成功"
        @event.destroy
        redirect_to :action=>:index
    end
    
    private
    def event_params
        params.require(:event).permit(:name,:description)
    end
    
    
end

