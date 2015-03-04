# Roots Bedrock support for WPEngine
WPEngine doesn't support Composer, Gulp or Bower. This bash script will move the `app/` folder back to 'wp-content/'. It will update the root .gitignore (and clear the cache) so all files are ignored, except those in the `wp-content/` folder. It will then remove the .gitignore in the theme so any compiled assets are included. Finally, it will push up the branch to WPEngine (replacing capistrano). This is all completed on a separate WPEngine branch which is created initially and deleted after completion.

# Usage
1. Edit the name of the theme in `wpengine.sh`
2. Ensure you use develop branch for staging, master for production locally
3. Ensure you use staging, production remotes for WPEngine
4. Run `sh wpengine.sh` followed by `staging` or `production`. E.g `sh wpengine.sh staging`

# Todo
* Remove output
* Add helpful messages
* Further error checking
