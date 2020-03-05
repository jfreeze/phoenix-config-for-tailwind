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


# Deployment

Since `purgecss` cannot pick up classes defined in Elixir code, such as `class: "bg-blue-200"`, these classes are added to the `whitelist.js` file via the `gen_whitelist.ex` task. I add the alias below and run the `MIX_ENV=prod mix css.update` to my deploy scripts to ensure that all used classes exist in production.

If you have other complicated class generation (e.g., computed classes or classes stored in variables), you may want to add a whitelist.html.eex file and just add any computed class there.

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


