cache()
include(biblioteq-source.pro)

CONFIG		+= qt release thread warn_on
LANGUAGE	= C++
QMAKE_CLEAN	+= BiblioteQ
QT              += core gui network printsupport sql svg widgets
TEMPLATE	= app

QMAKE_CXXFLAGS_RELEASE += -Wall \
                          -Wcast-align \
                          -Wcast-qual \
                          -Werror=format-security \
                          -Wextra \
                          -Wfloat-equal \
                          -Wformat=2 \
                          -Woverloaded-virtual \
                          -Wpointer-arith \
                          -Wstack-protector \
                          -Wstrict-overflow=1 \
                          -Wundef \
                          -fPIE \
                          -fstack-protector-all \
                          -fwrapv \
                          -pedantic \
                          -std=c++17
QMAKE_DISTCLEAN += -r temp .qmake.cache .qmake.stash
QMAKE_EXTRA_TARGETS = purge

INCLUDEPATH	+= Android Source temp
LIBS		+=
SOURCES         += Android/sqlite3/sqlite3.c

PROJECTNAME	= BiblioteQ
TARGET		= BiblioteQ

DISTFILES += android/AndroidManifest.xml \
             android/build.gradle \
             android/gradle.properties \
             android/gradle/wrapper/gradle-wrapper.jar \
             android/gradle/wrapper/gradle-wrapper.properties \
             android/gradlew \
             android/gradlew.bat \
             android/res/values/libs.xml

deployment.files = Data/*.csv \
                   Data/*.sqlite \
                   Documentation/*.html \
                   Documentation/Contributed/*.html \
                   biblioteq.conf
deployment.path = /assets

INSTALLS += deployment

contains(ANDROID_TARGET_ARCH, armeabi-v7a) {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
}

android: include(/home/saturn/Android/Sdk/android_openssl/openssl.pri)
