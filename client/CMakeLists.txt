# 指定项目名称
project(Client)

# 添加可执行文件
add_executable(client tls12_client.c)

# 包含 GmSSL 头文件
target_include_directories(client PRIVATE ${GMSSL_INCLUDE})

# 链接 GmSSL 库
target_link_libraries(client PRIVATE ${GMSSL_LIB})
