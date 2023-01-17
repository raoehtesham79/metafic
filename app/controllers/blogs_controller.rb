class BlogsController < ActionController::Base
    TOKEN ='1234'
    protect_from_forgery with: :null_session
    before_action :authenticate
    def authenticate
        authenticate_or_request_with_http_token do |token, _options|
            ActiveSupport::SecurityUtils.secure_compare(token, TOKEN)
        end
    end
    def showBlog
        data = Blog.all
        render json: {"data":data}
    end
    def addBlog
        data = Blog.new({
            "blog_title"=>params[:blog_title],
            "blog_descp"=>params[:blog_descp]
        })
        data.save
        render json: {"message":"success"}
    end
    def deleteBlog
        data = Blog.find(params[:id])
        if data.present?
            data.destroy
        else 
            render json: {"message":"failed"}
        end
    end
    def updateBlog
        data = Blog.find(params[:id])
        if data.present?
            data.update({
                "blog_title"=>params[:blog_title],
                "blog_descp"=>params[:blog_descp]
            })
        else 
            render json: {"message":"failed"}
        end
    end
end
