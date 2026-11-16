if("debian-bookworm" IN_LIST FEATURES)
    set(ZIP_URL "https://github.com")
    set(ZIP_NAME "lib_raisondetre_debian_bookworm-1.0.0.zip")
    set(ZIP_SHA512 "0")
elseif("ubuntu-2404" IN_LIST FEATURES)
    set(ZIP_URL "https://github.com")
    set(ZIP_NAME "lib_raisondetre_ubuntu_2404-1.0.0.zip")
    set(ZIP_SHA512 "0")
else()
    # Default: debian-trixie-slim
    set(ZIP_URL "https://github.com")
    set(ZIP_NAME "lib_raisondetre_debian_trixie-slim-1.0.0.zip")
    set(ZIP_SHA512 "0")
endif()

vcpkg_download_distfile(ARCHIVE
    URLS "${ZIP_URL}"
    FILENAME "${ZIP_NAME}"
    SHA512 "${ZIP_SHA512}"
)

vcpkg_extract_source_archive(
    SOURCE_PATH
    ARCHIVE "${ARCHIVE}"
)

file(INSTALL "${SOURCE_PATH}/dist/include/raisondetre.h" DESTINATION "${CURRENT_PACKAGES_DIR}/include")
file(INSTALL "${SOURCE_PATH}/dist/lib/libraisondetre.a" DESTINATION "${CURRENT_PACKAGES_DIR}/lib")
file(INSTALL "${SOURCE_PATH}/dist/lib/libraisondetre.a" DESTINATION "${CURRENT_PACKAGES_DIR}/debug/lib")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/raisondetreConfig.cmake" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(WRITE "${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright" "Commercial License. See https://github.com for details.\n")
