class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to articles_path(@article)
    end
    end
end
