cmake_minimum_required(VERSION 3.10)

# 设置项目名称
project(GMTLSAuth LANGUAGES C)

# 设置 C 标准
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

# 设置 GmSSL 库的路径
# 如果 GmSSL 库和头文件安装在标准路径之外，请手动指定路径
find_library(GMSSL_LIB gmssl REQUIRED PATHS /usr/local/lib)
find_path(GMSSL_INCLUDE ssl.h PATHS /usr/local/include)

# 添加子目录
add_subdirectory(server)
add_subdirectory(client)
