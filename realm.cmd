: realm wrapper script for realm on mingw

set XDG_DATA_HOME=%CD%\user_data\share
set XDG_CACHE_HOME=%CD%\user_data\cache
set XDG_CONFIG_HOME=%CD%\user_data\config


mkdir %XDG_DATA_HOME% > NUL
mkdir %XDG_CACHE_HOME% > NUL
mkdir %XDG_CONFIG_HOME% > NUL

bash %CD%\bin\realm %*
