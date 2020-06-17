Zend Guard Loader installation instructions
-------------------------------------------

Installing Zend Guard Loader for any PHP-NTS distribution:
==========================================================
1. Extract the Zend Loader package that corresponds to your php version and OS arch (the package also contains opcache binary) 

2. Place the ZendLoader and opcache binaries in your filesystem.

3. Add the following lines to your php.ini file for loading the ZendGuardLoader:
   Linux and Mac OS X:      
   	zend_extension=<full_path_to_ZendGuardLoader.so>
   	zend_extension=<full_path_to_opcache.so>
   
   Windows non-thread safe: 
   	zend_extension=<full_path_to_ZendLoader.dll>
   	zend_extension=<full_path_to_opcache.dll>
   
   * Note: The supplied opcache replaces your current opcache binary in order to allow correct extension loading.
   * Note: Loader line should be first
   
4. Optional: Add an aditional line to your php.ini for enabling ZendGuardLoader
  ; Enables loading encoded scripts. The default value is On
  zend_loader.enable=1
     
5. Optional: following lines can be added your php.ini file for ZendGuardLoader configuration:

   ; Disable license checks (for performance reasons)
     zend_loader.disable_licensing=0
   ; The Obfuscation level supported by Zend Guard Loader. The levels are detailed in the official Zend Guard Documentation. 0 - no obfuscation is enabled
     zend_loader.obfuscation_level_support=3
   ; Path to where licensed Zend products should look for the product license. For more information on how to create a license file, see the Zend Guard User Guide
     zend_loader.license_path= 

6. Restart your Web server.

7. Check that loader and opcache are both loaded ( phpinfo() ) or php -v

8. Run your encoded files
