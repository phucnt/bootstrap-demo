### 
author phuc
email phuccntt1990@gmail.com
###
fileJs = [
  'js/**/*.js'
]
fileCss = [
  'css/**/*.css'
]
module.exports = (grunt) ->
  grunt.initConfig 
    pkg:grunt.file.readJSON('package.json')
    'sails-linker': 
      devJs:
        options:
          startTag:'<!--SCRIPTS-->'
          endTag:'<!--SCRIPTS END-->'
          fileTmpl:'<script src="%"></script>'
          appRoot:'app/'
        files:
          # target-script
          'index.html': [fileJs]
      devCss:
        options:
          startTag:'<!--STYLE-->'
          endTag:'<!--STYLE END-->'
          fileTmpl:'<link rel="stylesheet" href="%s">'
          appRoot:'app'
        files:
          # target out put
          'index.html':[fileCss]
  grunt.loadNpmTasks 'grunt-sails-linker'
  grunt.registerTask 'test', ['sails-linker,sass']
  return