include_guard_x()

# Try and find the system sdk
if (USE_SYSTEM_VULKAN_SDK)
    find_package(vulkan)
endif ()

if (Vulkan_FOUND)
    message("Found system vulkan ${Vulkan_INCLUDE_DIR}")
    add_custom_target(vulkan-loader ALIAS Vulkan::Vulkan)

    # Export the path the moltenvk icd and validation layers
    if (APPLE)
        add_custom_target(moltenvk)
        set_target_properties(moltenvk PROPERTIES VK_ICD_FILENAMES "$ENV{VULKAN_SDK}/etc/vulkan/icd.d/MoltenVK_icd.json")

        add_custom_target(vulkan-validationlayers)
        set_target_properties(vulkan-validationlayers PROPERTIES VK_LAYER_PATH "$ENV{VULKAN_SDK}/etc/vulkan/icd.d/MoltenVK_icd.json")
    endif ()
else ()
    # Build the sdk from source
    include_vendor_pkg(vulkan-headers)
    set(VulkanHeaders_INCLUDE_DIRS ${CMAKE_SOURCE_DIR}/deps/vulkan-headers/include)
    add_subdirectory(${CMAKE_SOURCE_DIR}/deps/vulkan-loader ${CMAKE_BINARY_DIR}/vulkan-loader)
    add_library(vulkan-loader ALIAS vulkan)

    if (APPLE)
        include_vendor_pkg(moltenvk)
        include_vendor_pkg(vulkan-validationlayers)
        add_dependencies(vulkan moltenvk vulkan-validationlayers)
    endif (APPLE)
endif ()