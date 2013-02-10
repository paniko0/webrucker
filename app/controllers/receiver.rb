# -*- coding: utf-8 -*-
Webrucker.controllers :receiver do

  enable :sessions

  get :index do
    "Vai Corinthians"
  end

  get :index, :with => :login do
    @users = User.find_by(login: params[:login])
    if @users
      protected! @users
      render 'receiver/list'
    else
      render 'receiver/index'
    end
  end

  post :index, :with => :login do
    user = User.find_or_initialize_by(login: params[:login])
    user.push(:response, :json => request.body.read.force_encoding('UTF-8'), :received_date => Time.now, :header => request_headers)
    user.save!
  end

  post :new, :with => :login do
    user = User.find_or_initialize_by(login: params[:login])
    user.push(:response, :json => request.body.read.force_encoding('UTF-8'), :received_date => Time.now, :header => request_headers)
    user.save!
  end
end
