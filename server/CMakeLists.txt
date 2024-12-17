# 指定项目名称
project(Server)

# 添加可执行文件
add_executable(server tls12_server.c)

# 包含 GmSSL 头文件
target_include_directories(server PRIVATE ${GMSSL_INCLUDE})

# 链接 GmSSL 库
target_link_libraries(server PRIVATE ${GMSSL_LIB})
