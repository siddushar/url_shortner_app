class LinksController < ApplicationController
    def create
      link = Link.new(link_params)
      if link.save
        if request.xhr?
          render json: { short_url: link.short_url }, status: :created
        else      
          redirect_to shortened_path(link.short_url), success: "Successfully shortned the link: #{link.original_url}"
        end
      else
        render json: link.errors, status: :unprocessable_entity
      end
    end

    def index
      @link = Link.new
    end

    def show
      link = Link.find_by(short_url: params[:shorted_url])
      if link
        redirect_to link.original_url, allow_other_host: true
      else
        render json: { error: 'Link not found' }, status: :not_found
      end
    end
  
    def shortened
      @link = Link.find_by(short_url: params[:short_url])
      @original_url = @link.original_url
      @short_url = request.host_with_port + "/" + @link.short_url
    end
  
    private
  
    def link_params
      params.require(:link).permit(:original_url)
    end
end
  