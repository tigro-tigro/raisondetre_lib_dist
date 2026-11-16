add_library(raisondetre::raisondetre STATIC IMPORTED)

set_target_properties(raisondetre::raisondetre PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_LIST_DIR}/../../include"
    IMPORTED_LOCATION "${CMAKE_CURRENT_LIST_DIR}/../../lib/libraisondetre.a"
)
