class AfterSignupController < ApplicationController
  include Wicked::Wizard
  # steps :profile, :avatar, :finish
  # Asterisk means variable number of arguments
  steps(*User.form_steps)

  def show
    @user = current_user

    case step
    when 'sign_up'
      skip_step if @user.persisted?
    when 'set_personal_info'
      @personal_info = get_personal_info
    when 'welcome'
      @users = User.all
    end

    render_wizard
  end

  def update
    @user = current_user
    case step
    when 'set_name'
      if @user.update(onboarding_params(step))
        render_wizard @user
      else
        render_wizard @user, status: :unprocessable_entity
      end
    when 'set_personal_info'
      if @user.create_personal_info(onboarding_params(step).except(:form_step))
        render_wizard @user
      else
        @personal_info.destroy
        render_wizard @user, status: :unprocessable_entity
      end
    end
  end

  private

  def get_personal_info
    if @user.personal_info.nil?
      PersonalInfo.new
    else
      @user.personal_info
    end
  end

  def finish_wizard_path
    root_path
  end

  def onboarding_params(step = 'sign_up')
    permitted_attributes = case step
                           when 'set_name'
                             required_parameters = :user
                             %i[first_name last_name]
                           when 'set_personal_info'
                             required_parameters = :personal_info
                             %i[gender age country goal]
                           end
    params.require(required_parameters).permit(:id, permitted_attributes).merge(form_step: step)
  end
end
