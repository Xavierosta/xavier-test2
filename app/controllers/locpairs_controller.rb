class LocpairsController < ApplicationController
	def show
		@locpair = Locpair.find(params[:id])
	end

	def new
	end

	def create
#		render plain: params[:locpair].inspect
		@locpair = Locpair.new(locpair_params)

		@locpair.save
		redirect_to @locpair
	end

	private
		def locpair_params
			params.require(:locpair).permit(:location1, :location2)
		end
end
