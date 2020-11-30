class Api::Me::Show < ApiAction
  get "/api/me" do
    json UserSerializer.new(current_user).render_with_wrapper
  end
end
