module.exports = function (grunt) {
    require('jit-grunt')(grunt);
    grunt.loadNpmTasks('grunt-shell');

    grunt.initConfig({


        shell: {
            target: {
                command: 'pdflatex --file-line-error --interaction=nonstopmode /app/document.tex'
            },
            copy: {
              command: 'cp /app/document.pdf /export/'
            }
        },


        watch: {
            ausarbeitung: {
                files: [
                    '/app/Vorlage/**',
                    '/app/document.tex',
                    '/edit/*',
                ],
                tasks: ['shell:target','shell:copy'],
                options: {
                    nospawn: false
                }
            }
        }
    });

    grunt.registerTask('default', ['shell:target','shell:copy', 'watch']);
};
