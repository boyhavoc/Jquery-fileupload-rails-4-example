Rails.application.routes.draw do
  resources "uploads" do
    collection do
      get "with_dropzone_area"
    end
  end
  root 'uploads#index'
end
