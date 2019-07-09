# Vulkan playground

## Building on linux
Linux builds link to the system provided Vulkan loader
- Install prerequisites: `sudo apt install vulkan-validationlayers vulkan-tools libvulkan-dev`
- Run cmake and build: `mkdir build && cd build && cmake .. && make all`

## Building on Mac
Mac builds link to the provided MoltenVK static lib
- Run cmake and build: `mkdir build && cd build && cmake .. && make all`
