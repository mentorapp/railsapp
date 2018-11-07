class RegistrationsController < Devise::RegistrationsController

  def create
    if params[:ageconfirmation] == '1'
      build_resource(sign_up_params)

      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          if params[:mentor] == "1"
            Mentor.create({user_id: resource.id, price: 0, active: true})
          end
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          redirect_to mentors_path
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    else
      redirect_to new_user_registration_path, notice: 'Terms and conditions must be accepted'
    end
  end

  def update
    if params[:mentor] == '1'
      mentor = Mentor.find_by(user_id: current_user.id)
      if mentor.nil? == true
        Mentor.create({user_id: current_user.id, price: 0, active: true})
      end
    end

    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      bypass_sign_in resource, scope: resource_name
      redirect_to users_show_path
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

    # DELETE /resource
  def destroy
    if Booking.find_by(mentee_id: current_user.id).nil?
      mentor = Mentor.find_by(user_id: current_user.id)
      unless mentor.nil?
        mentor.destroy
      end
      resource.destroy
      Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
      set_flash_message! :notice, :destroyed
      yield resource if block_given?
      respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
    else
      redirect_to edit_user_registration_path, notice: 'Error: You can not delete your account because you still have booking sessions to attend to' 
    end
  end
end
