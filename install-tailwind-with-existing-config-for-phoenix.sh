#!/bin/sh

# WARNING: This overwrites app.css

cd assets

rm -f postcss.config.js
wget https://raw.githubusercontent.com/jfreeze/phoenix-config-for-tailwind/master/assets/postcss.config.js

rm -f webpack.config.js
wget https://raw.githubusercontent.com/jfreeze/phoenix-config-for-tailwind/master/assets/webpack.config.js

npm install tailwindcss --save-dev
npm install style-loader --save-dev
npm install postcss-loader --save-dev
npm install postcss-purgecss postcss postcss-selector-parser purgecss --save-dev
# Backup, may need to add --save-exact if it fails in the future due to package changes
# npm install postcss-purgecss@1.0.0 postcss@7.0.18 postcss-selector-parser@6.0.2 purgecss@1.4.0 --save-dev

npx tailwind init

cd css
rm -f app.css
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
