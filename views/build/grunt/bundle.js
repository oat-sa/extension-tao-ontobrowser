module.exports = function(grunt) { 

    var requirejs   = grunt.config('requirejs') || {};
    var clean       = grunt.config('clean') || {};
    var copy        = grunt.config('copy') || {};

    var root        = grunt.option('root');
    var libs        = grunt.option('mainlibs');
    var ext         = require(root + '/tao/views/build/tasks/helpers/extensions')(grunt, root);
    var out         = 'output';

    /**
     * Remove bundled and bundling files
     */
    clean.ontobrowserbundle = [out];
    
    /**
     * Compile tao files into a bundle 
     */
    requirejs.ontobrowserbundle = {
        options: {
            baseUrl : '../js',
            dir : out,
            mainConfigFile : './config/requirejs.build.js',
            paths : { 'ontoBrowser' : root + '/ontoBrowser/views/js' },
            modules : [{
                name: 'ontoBrowser/controller/routes',
                include : ext.getExtensionsControllers(['ontoBrowser']),
                exclude : ['mathJax', 'mediaElement'].concat(libs)
            }]
        }
    };

    /**
     * copy the bundles to the right place
     */
    copy.ontobrowserbundle = {
        files: [
            { src: [out + '/ontoBrowser/controller/routes.js'],  dest: root + '/ontoBrowser/views/js/controllers.min.js' },
            { src: [out + '/ontoBrowser/controller/routes.js.map'],  dest: root + '/ontoBrowser/views/js/controllers.min.js.map' }
        ]
    };

    grunt.config('clean', clean);
    grunt.config('requirejs', requirejs);
    grunt.config('copy', copy);

    // bundle task
    grunt.registerTask('ontobrowserbundle', ['clean:ontobrowserbundle', 'requirejs:ontobrowserbundle', 'copy:ontobrowserbundle']);
};
