vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO 4xicom/vcpkg-registry
    REF 786be50df3abdfa3210dde57c20ee798913b414e
    SHA512 1e7e025d3641413205061cab020d00c46e2cc31aba0d3e88171f892acce9877e686a5e9043e8e038e9dc09a774b039454f75fdc7e870f35d894e76eb38fb0b6e  
    HEAD_REF main
)


vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sources/bolib"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "bolib")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)