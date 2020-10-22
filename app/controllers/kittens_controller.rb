class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:notice] = "Kitten successfully created"
      redirect_to kitten_path(@kitten)
    else
      flash[:alert] = "Kitten not created"
      render 'new'
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update
      flash[:notice] = "Kitten successfully updated"
      redirect_to kitten_path(@kitten)
    else
      render 'edit'
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:notice] = "Kitten successfully updated"
    redirect_to root_path
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
