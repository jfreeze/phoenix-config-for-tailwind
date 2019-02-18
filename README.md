# phoenix-config-for-tailwind


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