class Docker::Run < LuckyCli::Task
  summary "Run the production Docker image"

  def help_message
    <<-TEXT
      #{summary}

      Expects a 'billing_api' Docker image to exist, so ensure you first run
      'lucky docker.build' successfully.

      Note, some of the ENV vars may need updated depending on your usage.
    TEXT
  end

  def call
    system <<-CMD
      docker run \
        --rm \
        --name billing_api \
        -p 5000:5000 \
        -e LUCKY_ENV=production \
        -e APP_DOMAIN=http://127.0.0.1 \
        -e SECRET_KEY_BASE=3M6VgWfbU1qSNIIqer2bpBqburD3TYNKQctdyRyjL58= \
        -e HOST=0.0.0.0 \
        -e PORT=5000 \
        -e DB_URL=postgresql://localhost/mydb \
        -e SEND_GRID_KEY=unused \
        billing_api
    CMD
  end
end
