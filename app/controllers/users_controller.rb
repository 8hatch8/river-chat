class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @current_user_entries = Entry.where(user_id: current_usr.id)
    @user_entries = Entry.where(user_id: @user.id)

    # 他人のページならば、すでに共通のルームがあるか確認
    unless @user.id == current_user.id
      @current_user_entries.each do |cu_entry|
        @user_entries.each do |u_entry|
          # ルームが存在するならば、ルームidを取得
          ( @exist_room = true, @room_id = cu_entry.room_id, return ) if cu_entry.room_id == u_entry.room_id 
        end
      end

      # 両者が存在するルームが存在しなければ、新たに作成
      ( @room = Room,new, @entry = Entry.new ) unless @exist_room
    end

  end
end