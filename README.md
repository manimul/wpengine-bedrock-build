# WPEngine Roots / Bedrock build for WordPress
WPEngine doesn't support things like Composer, Gulp, Bower, etc or allows the WordPress to be managed from a subdirectory. This script will go through the normal steps of the build process in a wpengine branch on the repository and make sure all the files needed are included.

# Requirements
* [Bedrock](https://github.com/roots/bedrock)
* [Roots](https://github.com/roots/roots)

# Usage
1. Edit the name of the theme in `wpengine.sh`
2. Ensure you use develop branch for staging, master for production locally
3. Ensure you use staging, production remotes for WPEngine
4. Run `sh wpengine.sh` followed by `staging` or `production`. E.g `sh wpengine.sh staging`

# Todo
* Cache contents of npm install
* Remove output
* Add helpful messages
* Further error checking
