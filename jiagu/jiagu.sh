#!/bin/bash

BASE=../jiagu/jiagu.jar
NAME=lucky_zdd
PASSWORD=ZQ1993818


SIGN_JIR_DIR=$(cd `dirname $0`; pwd)

KEY_PATH=../keystore.jks #密钥路径
KEY_PASSWORD=123456x #密钥密码
ALIAS=lucky #别名
ALIAS_PASSWORD=123456x #别名密码



APK=$1   #需要加固的apk路径
DEST=$2  #输出加固包路径
VERSION=$3

 echo "------ running! ------"

java -jar ${BASE} -version
java -jar ${BASE} -login ${NAME} ${PASSWORD}
java -jar ${BASE} -importsign ${KEY_PATH} ${KEY_PASSWORD} ${ALIAS} ${ALIAS_PASSWORD}
java -jar ${BASE} -showsign
#java -jar ${BASE}/jiagu.jar -importmulpkg ${BASE}/多渠道模板.txt #根据自身情况使用
java -jar ${BASE} -showmulpkg
java -jar ${BASE} -showconfig
java -jar ${BASE} -jiagu ${APK} ${DEST}


java -jar ${SIGN_JIR_DIR}/lib/apksigner.jar sign  --ks ${KEY_PATH} --ks-key-alias ${ALIAS} --ks-pass pass:${ALIAS_PASSWORD} --key-pass pass:${KEY_PASSWORD} --out ../app/build/outputs/apk/ync-${VERSION}-jiagu-resingned.apk ${DEST}/*jiagu.apk
#解决4.2 签名问题
#jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ${KEY_PATH} -signedjar ../app/build/outputs/apk/ync-${VERSION}-jiagu-resingned.apk ${DEST}/*jiagu.apk sublx_ync

echo "------ finished! ------"
#
#echo "------ clean  apks ..."
#rm -rf ../biuild/apk
#echo "------ clean  apks  finished!"
#
#echo "------ build  running..."
#gradle  clean assembleRelease -b ../build.gradle
#echo "------ build  finished!"


#java -jar ./jiagu.jar -login ${NAME} ${PASSWORD}
#java -jar ./jiagu.jar -importsign ${KEY_PATH} ${KEY_PASSWORD} ${ALIAS} ${ALIAS_PASSWORD}
#java -jar ./jiagu.jar -showsign
## java -jar ./jiagu.jar  -importmulpkg ./渠道列表.txt
#java -jar ./jiagu.jar  -showmulpkg
#java -jar ./jiagu.jar  -showconfig
#
#java -jar jiagu.jar  -jiagu ../app/build/outputs/apk/release/ync-v*.apk ../app/build/
#
#java -jar ./lib/apksigner.jar sign --ks ../sublx_ync_release.jks --ks-key-alias sublx_ync --ks-pass pass:eW5jX3N1Ymx4 --key-pass pass:eW5jX3N1Ymx4 --out ../app/build/outputs/apk/ync-singned.apk ../app/build/ync-v*.apk

#上传蒲公英
#curl -F "file=@../app/build/outputs/apk/ync-${VERSION}-jiagu-resingned.apk" -F "uKey=3537bb5cdb144f91a00e9095a02de3b7" -F "_api_key=d6165cd9bba45bf21dca5f2cd723165f" https://www.pgyer.com/apiv1/app/upload