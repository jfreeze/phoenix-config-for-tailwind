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

echo "running mix compile"
mix compile
echo "end running mix compile"

mix tailwind.gen.whitelist
echo "running mix node.update"
mix node.update
echo "end running mix node.update"
