#!/bin/sh

cd assets

rm package.json
wget https://raw.githubusercontent.com/jfreeze/phoenix-config-for-tailwind/master/assets/package.json

wget https://raw.githubusercontent.com/jfreeze/phoenix-config-for-tailwind/master/assets/postcss.config.js

rm webpack.config.js
wget https://raw.githubusercontent.com/jfreeze/phoenix-config-for-tailwind/master/assets/webpack.config.js

npm install
npx tailwind init

cd css
rm app.css
wget https://raw.githubusercontent.com/jfreeze/phoenix-config-for-tailwind/master/assets/css/app.css

cd ../../lib
mkdir -p mix/tasks
cd mix/tasks

wget https://raw.githubusercontent.com/jfreeze/phoenix-config-for-tailwind/master/lib/mix/tasks/css_gen_whitelist.ex

wget https://raw.githubusercontent.com/jfreeze/phoenix-config-for-tailwind/master/lib/mix/tasks/node_update_assets.ex

cd ../../..

echo ""
echo "------"
echo ""
echo "Your project is now configured to use TailwindCSS."
echo "You can now update your project by running the following"
echo ""
echo "    mix do deps.get, compile, tailwind.gen.whitelist, node.update, phx.digest"
echo ""
echo "You can also add the following line to the aliases function in the mix.exs file"
echo ""
echo '    "css.update": ["tailwind.gen.whitelist", "node.update", "phx.digest"],'
echo ""
echo "to update your project with"
echo ""
echo "    mix css.update"
echo ""
