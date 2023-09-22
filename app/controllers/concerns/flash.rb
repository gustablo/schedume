module Flash
    extend ActiveSupport::Concern

    def notice message
        flash[:notice] = message
    end

    def alert message
        flash[:alert] = message
    end
end
