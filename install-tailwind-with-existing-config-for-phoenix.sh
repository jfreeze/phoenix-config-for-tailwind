#!/bin/sh

cd assets

rm -i postcss.config.js
wget https://raw.githubusercontent.com/jfreeze/phoenix-config-for-tailwind/master/assets/postcss.config.js

rm -i webpack.config.js
wget https://raw.githubusercontent.com/jfreeze/phoenix-config-for-tailwind/master/assets/webpack.config.js

npm install tailwindcss --save-dev
npm install style-loader --save-dev
npm install postcss-purgecss@1.0.0 --save-dev
npm install postcss-loader --save-dev

npx tailwind init

cd css
rm -i app.css
wget https://raw.githubusercontent.com/jfreeze/phoenix-config-for-tailwind/master/assets/css/app.css

cd ../../lib
mkdir -p mix/tasks
cd mix/tasks

wget https://raw.githubusercontent.com/jfreeze/phoenix-config-for-tailwind/master/lib/mix/tasks/css_gen_whitelist.ex

wget https://raw.githubusercontent.com/jfreeze/phoenix-config-for-tailwind/master/lib/mix/tasks/node_update_assets.ex

cd ../../..

mix do deps.get, compile, tailwind.gen.whitelist, node.update
