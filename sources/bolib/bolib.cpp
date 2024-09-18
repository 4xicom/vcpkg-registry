#include "bolib.h"
#include <fmt/core.h>

std::string greet(const std::string& name) {
    return fmt::format("Hello, bolib {}!", name);
}