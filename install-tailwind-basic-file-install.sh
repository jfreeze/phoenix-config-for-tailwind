#!/bin/sh

# WARNING: This script overwrites app.css, package.json, postcss.config.js, and webpack.config.js

cd assets

rm -f postcss.config.js
wget https://raw.githubusercontent.com/jfreeze/phoenix-config-for-tailwind/master/assets/postcss.config.js

rm -f webpack.config.js
wget https://raw.githubusercontent.com/jfreeze/phoenix-config-for-tailwind/master/assets/webpack.config.js

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
echo "Your project is now ready to install npm packages and init TailwindCSS. Run the following:"
echo ""
echo "    cd assets"
echo "    npm i" 
echo "    npx tailwind init"
echo ""
echo "A suggested alias: add to the aliases function in the mix.exs file"
echo ""
echo '    "css.update": ["tailwind.gen.whitelist", "node.update", "phx.digest"],'
echo ""

