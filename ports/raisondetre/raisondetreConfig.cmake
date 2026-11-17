add_library(raisondetre::raisondetre STATIC IMPORTED)

find_dependency(Boost REQUIRED COMPONENTS iostreams)
find_dependency(google_cloud_cpp_pubsub REQUIRED)

set_target_properties(raisondetre::raisondetre PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_LIST_DIR}/../../include"
    IMPORTED_LOCATION "${CMAKE_CURRENT_LIST_DIR}/../../lib/libraisondetre.a"
    INTERFACE_LINK_LIBRARIES "Boost::iostreams;google-cloud-cpp::pubsub"
)