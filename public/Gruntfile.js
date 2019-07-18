module.exports = grunt => {
  grunt.initConfig({
    // pug task
    pug: {
      compile: {
        options: {
          data: {
            debug: true
          },
          pretty: true
        },
        files: [{
          src: '**/[^_]*.pug',
          cwd: 'src/pug/',
          dest: 'frontend',
          expand: true,
          ext: '.html'
        }]
      }
    },

    // sass task
    sass: {
      dist: {
        options: {
          style: 'inline',
          sourceMap: true
        },
        files: [{
          src: '[^_]*.scss',
          cwd: 'src/sass/',
          dest: 'frontend/assets/css',
          expand: true,
          ext: '.css'
        }]
      }
    },

    // copy task (copy src/libraries to frontend/libraries)
    copy: {
      public: {
        expand: true,
        cwd: 'src/public',
        src: ['**'],
        dest: 'frontend/assets'
      }
    },

    // image compress task (compress all image src/images to frontend/images)
    imagemin : {
      dynamic: {
          files: [{
              expand: true,
              cwd: 'src/',
              src: ['images/**/*.{png,jpg,gif,svg}'],
              dest: 'frontend/'
          }]
      }
    },

    // CSS task: fallbacks for rem units - vendor prefixes - minify the result
    // postcss: {
    //   options: {
    //     map: false, // inline sourcemaps  
    //     processors: [
    //       require('pixrem')(), // add fallbacks for rem units
    //       require('autoprefixer')({browsers: 'last 2 versions'}), // add vendor prefixes
    //       require('cssnano')() // minify the result
    //     ]
    //   },
    //   dist: {
    //     src: 'frontend/assets/css/*.css'
    //   }
    // },

    // auto refresh view on change in frontend directory
    browserSync: {
      dev: {
        bsFiles: {
            src : [
                '**.*'
            ]
        },
        options: {
            watchTask: true,
            server: './'
        }
      }
    },

    // watch change inside directory to run task
    watch: {
      pug: {
        files: ['src/pug/**/*.pug'],
        tasks: ['pug']
      },
      sass: {
        files: ['src/sass/**/*.scss'],
        tasks: ['sass']
      },
      js: {
        files: ['src/js/**/*.js'],
        tasks: ['babel']
      },
      // postcss: {
      //   files: ['frontend/assets/**/*.css'],
      //   tasks: ['postcss']
      // },
      babel: {
         files: ['src/js/**/*.js'],
         tasks: ['babel']
       },
      copy: {
        files: ['src/public/**'],
        tasks: ['copy']
      },
      imagemin: {
        files: ['src/images/**'],
        tasks: ['imagemin']
      }
    },

    // babel
    babel: {
      options: {
        sourceMap: false,
        minified: true
      },
      dist: {
        files: {
          'frontend/assets/js/main.js': 'src/js/main.js',
          'frontend/assets/js/library.js': 'src/js/library.js',
        }
      }
    }
  });

  // initial
  grunt.loadNpmTasks('grunt-contrib-pug');
  grunt.loadNpmTasks('grunt-sass');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-browser-sync');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-imagemin');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-babel');
  // grunt.loadNpmTasks('grunt-postcss');

  //register default task
  if(process.env.NODE_ENV == 'production')
  {
    // grunt.registerTask('default', ['pug', 'sass', 'postcss:dist', 'copy', 'imagemin', 'cssmin', 'babel'])
    grunt.registerTask('default', ['pug', 'sass', 'copy', 'imagemin', 'cssmin', 'babel'])
  }else 
  {
    // grunt.registerTask('default', ['pug', 'sass', 'postcss:dist', 'copy', 'imagemin', 'browserSync', 'babel', 'watch'])
    grunt.registerTask('default', ['pug', 'sass', 'copy', 'imagemin', 'browserSync', 'babel', 'watch'])
  }
};

