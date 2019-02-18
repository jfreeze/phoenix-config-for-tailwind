# phoenix-config-for-tailwind

Starter files for configuring Phoenix for use with Tailwind.js.

You can start by copying the `assets` and `lib/mix/tasks` to your new Phoenix project.

You can also add a mix alias and turn off webpack watchers.

Once the files are copied, update your node packages,
```
  cd assets
  npm install
  npx tailwind init
```

# Updates During Development

If you add custom css components, you will need to manually update them if you turn off watchers. To do this, run `mix css.udpate`.

# Suggested mix alias to add
```  
  defp aliases do
    [
      ...
      "css.update": ["tailwind.gen.whitelist", "node.update"],
      ...
    ]
  end
```

# Watchers
You won't need to run tailwind for every change in dev mode, so for speed reasons, you can turn off watchers.

Make the following change to `dev.exs`
```
  watchers: [
    # node: [
    #   "node_modules/webpack/bin/webpack.js",
    #   "--mode",
    #   "development",
    #   "--watch-stdin",
    #   cd: Path.expand("../assets", __DIR__)
    # ]
  ]
```