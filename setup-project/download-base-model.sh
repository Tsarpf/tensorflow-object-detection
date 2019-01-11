$(cat ../settings | xargs)
wget ${MODEL_DOWNLOAD_PATH}/${MODEL_NAME}.tar.gz -P dist/
tar -xvf dist/${MODEL_NAME}.tar.gz -C dist/

