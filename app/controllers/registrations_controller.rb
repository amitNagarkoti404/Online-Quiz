class RegistrationsController < Devise::RegistrationsController
    def Sign_up_params
        params.require(:college).permit(:email,:password,:password_confirmation,:College_name)
    end
end
