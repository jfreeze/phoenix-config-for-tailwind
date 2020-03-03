# Quick Install

The following script installs `npm` config files, `app.css` and adds mix tasks to help manage tailwind generation.

To install tailwindcss on a new Phoenix project with Webpack, run the script below.

WARNING: This script will overwrite `package.json`, `postcss.config.js`, `webpack.config.js`, and `app.css`.

```
mix deps.get && wget -O - https://raw.githubusercontent.com/jfreeze/phoenix-config-for-tailwind/master/install-tailwind-basic-file-install.sh | bash
```

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
You won't need to run tailwind for every change in dev mode, so for speed reasons, you can limit watchers to your custom css files.

You can make that change to `dev.exs`

