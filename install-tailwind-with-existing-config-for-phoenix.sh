#!/bin/sh

cd assets

rm -f postcss.config.js
wget https://raw.githubusercontent.com/jfreeze/phoenix-config-for-tailwind/master/assets/postcss.config.js

rm -f webpack.config.js
wget https://raw.githubusercontent.com/jfreeze/phoenix-config-for-tailwind/master/assets/webpack.config.js

npm install tailwindcss --save-dev
npm install style-loader --save-dev
npm install postcss-loader --save-dev
npm install postcss-purgecss@1.0.0 postcss@6.0.23 postcss-selector-parser@3.1.1 purgecss@0.21.0 --save-dev
# May need to add --save-exact to the above command if it fails in the future due to package changes"

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

