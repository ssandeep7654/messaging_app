class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: %i[ show edit update destroy ]

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @messages = @chatroom.messages.order(created_at: :asc)
  end

  def new
    @chatroom = Chatroom.new
  end

  def edit
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)

    respond_to do |format|
      if @chatroom.save
        format.html { redirect_to chatroom_url(@chatroom), notice: "Chatroom was successfully created." }
        format.json { render :show, status: :created, location: @chatroom }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chatroom.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @chatroom.update(chatroom_params)
        format.html { redirect_to chatroom_url(@chatroom), notice: "Chatroom was successfully updated." }
        format.json { render :show, status: :ok, location: @chatroom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chatroom.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chatroom.destroy

    respond_to do |format|
      format.html { redirect_to chatrooms_url, notice: "Chatroom was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_chatroom
      @chatroom = Chatroom.find(params[:id])
    end

    def chatroom_params
      params.require(:chatroom).permit(:name)
    end
end
