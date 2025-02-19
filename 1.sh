PATHS_JSON=$(echo "outbound/integration-handlers/something1/do-something-1" | \
  jq -R 'split(" ")' | \
  jq '[
    .[] | {
      dockerfile: .,
      context: (split("/")[0:-1] | join("/")),
      name: (split("/")[2:-1] | join("-")),
    }
  ]' | \
  jq -c .)


  PATHS_JSON=$(echo "outbound/integration-handlers/something1/do-something-1/" | \
    jq -R 'split(" ")' | \
    jq '[
      .[] | {
        dockerfile: .,
        context: split("/")[0:-1] | join("/"),
        name: split("/")[2:-1] | join("-"),
        module: split("/")[2:-1] | join("_")
      }
    ]' | \
    jq -c .)
      # module: echo ${{(split("/")[2:-1] | join("-"))}} | sed -r 's/[/-]+/_/g')
                #