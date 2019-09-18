# phoenix-config-for-tailwind

Starter files for configuring Phoenix for use with TailwindCSS.

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
      "css.update": ["tailwind.gen.whitelist", "node.update", "phx.digest"],
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

# Updating Package.json 

If you want to add the node packages explicitly instead of updating `package.json`, run the following:

```
  cd assets
  npm install tailwindcss --save-dev
  npm install style-loader --save-dev
  npm install postcss-purgecss@1.0.0 --save-dev
  npm install postcss-loader --save-dev
```

# CLI Install

To install tailwindcss on a new Phoenix project with Webpack, run the script below.

This script will load the latest libraries from npm, so there is a chance that it may fail.

You can view a failsafe install command that is commented out in the script, which loads known good npm modules.

WARNING: This script will overwrite `postcss.config.js`, `webpack.config.js`, and `app.css`.

```
mix deps.get && wget -O - https://raw.githubusercontent.com/jfreeze/phoenix-config-for-tailwind/master/install-tailwind-with-existing-config-for-phoenix.sh | bash
```


The script below is for the older tailwindcss 0.7.4.

```
mix deps.get && wget -O - https://raw.githubusercontent.com/jfreeze/phoenix-config-for-tailwind/master/install-tailwind-config-for-phoenix.sh | bash

```
