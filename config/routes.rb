Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/blogs", to: "blogs#showBlog"
  post "/blogs/addblog", to: "blogs#addBlog"
  put "/blogs/updateblog", to: "blogs#updateBlog"
  delete "/blogs/deleteblog", to: "blogs#deleteBlog"
end
