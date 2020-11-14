class Docker::DB < LuckyCli::Task
  summary "Run a PostgreSQL Docker image"

  def help_message
    <<-TEXT
      #{summary}

      Suitable for connecting to during development etc.
      Does not run in daemon mode. Prints the logs to STDOUT.
    TEXT
  end

  def call
    system <<-CMD
      docker run \
        --name postgres \
        --rm \
        -e POSTGRES_PASSWORD=postgres \
        -p 5432:5432 \
        postgres
    CMD
  end
end
