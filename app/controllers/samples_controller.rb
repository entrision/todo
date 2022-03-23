class SamplesController < ApplicationController
  def index
    flash.now[:success] = 'You have thirty minutes to move your car.'
    flash.now[:warning] = 'Your car has been impounded,'
    flash.now[:danger] = 'Your car has been crushed into a cube.'
    flash.now[:info] = 'You have thirty minutes to move your cube.'
  end

  def icons
    @names = BootstrapHelpers::Icon.enumerate
  end
end
