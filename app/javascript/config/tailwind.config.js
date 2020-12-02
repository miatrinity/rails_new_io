module.exports = {
  purge: [
    './app/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/javascript/**/*.vue'
    // Add any other JS files here (i.e. .jsx, .ts, etc...)
  ],
  plugins: [   
    require('@tailwindcss/forms'),
  ],    
  variants: {
    margin: ['responsive', 'first'],
  },
}