class WelcomeController < ApplicationController
    def index
        render json: { 
            name: 'Yellow Pages',
            version: '1.0'
        }
    end
end
