const glob = require('glob');
const fs = require('fs');
// Locate lib/<app>_web/ to locate .l?eex files
const files = fs.readdirSync('../lib/');
const appWeb = files.filter((file) => file.endsWith("_web"))[0]
const searchPath = '../lib/' + appWeb + '/**/*eex'

const purgecss = require('@fullhuman/postcss-purgecss')({

  // Specify the paths to all of the template files in your project 
  content: [
    searchPath
  ],

  // Include any special characters you're using in this regular expression
  defaultExtractor: content => content.match(/[\w-/:]+(?<!:)/g) || []
})


const whitelist = require('./whitelist.js');


if (
  process.argv.includes("development") &&
  process.argv.includes("--mode")
) {
  console.log('[postcss] ...dev mode detected, not purging css')
} else if (
  process.argv.includes("production") &&
  process.argv.includes("--mode")
) {
  console.log('[postcss] ...prod mode detected, purging css')
} else {
  console.log("[postcss] ...no mode detected", { process_argv: process.argv })
}

const tailwindcss = require('tailwindcss');

module.exports = {
  plugins: [
    tailwindcss('./tailwind.config.js'),
    require('autoprefixer'),
    ...(process.argv.includes("production") && process.argv.includes("--mode"))
      ? [purgecss]
      : []
  ]
}
