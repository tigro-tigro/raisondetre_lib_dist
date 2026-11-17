if("debian-bookworm" IN_LIST FEATURES)
    set(ZIP_URL "https://github.com/tigro-tigro/raisondetre_lib_dist/releases/download/lib_raisondetre_debian_bookworm_latest/lib_raisondetre_debian_trixie-slim-1.0.0.zip")
    set(ZIP_NAME "lib_raisondetre_debian_bookworm-1.0.0.zip")
    set(ZIP_SHA512 "0")
elseif("ubuntu-2404" IN_LIST FEATURES)
    set(ZIP_URL "https://github.com/tigro-tigro/raisondetre_lib_dist/releases/download/lib_raisondetre_ubuntu_2404_latest/lib_raisondetre_debian_trixie-slim-1.0.0.zip")
    set(ZIP_NAME "lib_raisondetre_ubuntu_2404-1.0.0.zip")
    set(ZIP_SHA512 "0")
else()
    # Default: debian-trixie-slim
    set(ZIP_URL "https://github.com/tigro-tigro/raisondetre_lib_dist/releases/download/lib_raisondetre_debian_trixie-slim_latest/lib_raisondetre_debian_trixie-slim-1.0.0.zip")
    set(ZIP_NAME "lib_raisondetre_debian_trixie-slim-1.0.0.zip")
    set(ZIP_SHA512 "0171d8226f254e36d273825a477136a2d2e33018de9d24469aac4deead0ddffea43618eb4e47554d2f85fa73c67bfc5fc38f2f2d6ab2cd44b68d5debf73e4ac9")
endif()

vcpkg_download_distfile(ARCHIVE
    URLS "${ZIP_URL}"
    FILENAME "${ZIP_NAME}"
    SKIP_SHA512
    ##SHA512 "${ZIP_SHA512}"
)

vcpkg_extract_source_archive(
    SOURCE_PATH
    ARCHIVE "${ARCHIVE}"
)


file(INSTALL "${SOURCE_PATH}/include/raisondetre.h" DESTINATION "${CURRENT_PACKAGES_DIR}/include/raisondetre")
file(INSTALL "${SOURCE_PATH}/lib/libraisondetre.a" DESTINATION "${CURRENT_PACKAGES_DIR}/lib")
file(INSTALL "${SOURCE_PATH}/lib/libraisondetre.a" DESTINATION "${CURRENT_PACKAGES_DIR}/debug/lib")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/raisondetreConfig.cmake" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(WRITE "${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright" "Commercial License. See https://github.com for details.\n")
