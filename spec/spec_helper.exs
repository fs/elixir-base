Faker.start
{:ok, _} = Application.ensure_all_started(:elixir_base)

ESpec.configure fn(config) ->
  config.before fn(tags) ->
    {:shared, hello: :world, tags: tags}
  end

  config.finally fn(_shared) ->
    :ok
  end
end
