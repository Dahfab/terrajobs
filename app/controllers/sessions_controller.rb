class SessionsController < ApplicationController

    def new
        render layout: "layouts/pages" 
    end

    def create 
        user = login(params[:email], params[:password])
        if user
            redirect_back_or_to rails_admin_path
            flash[:notice] = "Erfolgreich eingeloggt"
        else
            flash[:notice] = "E-Mail oder Passwort falsch"
            redirect_to backend_path
        end
    end

    def destroy 
        logout
        redirect_to root_path
        flash[:notice] = "Erfolgreich ausgeloggt"
    end
    
end