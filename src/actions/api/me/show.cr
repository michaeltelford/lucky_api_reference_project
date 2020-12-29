class Api::Me::Show < ApiAction
  get "/api/me" do
    json UserSerializer.for_object(current_user)
  end
end
