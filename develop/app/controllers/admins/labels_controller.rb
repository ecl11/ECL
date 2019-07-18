class Admins::LabelsController < ApplicationController

  def new
    @label = Label.new(label_params)
  end

  def create
    @label.save
    redirect_to item_path
  end

  def edit
    @label = label.find(params[:id])
  end

  def update
    @label.update(label_params)
    redirect_to item_path
  end

  private
  def label_params
    params.require(:label).permit(:label_name)
  end
end