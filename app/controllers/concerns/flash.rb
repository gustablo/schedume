module Flash # change this name because is reserverd
    extend ActiveSupport::Concern

    def notice message
        flash[:notice] = message
    end

    def alert message
        flash[:alert] = message
    end
end
