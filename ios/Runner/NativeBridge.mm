// NativeBridge.mm
#import "CppBridge.h"
#import <Foundation/Foundation.h>  // ← нужно для NSTemporaryDirectory()
#include <string>
#include <fstream>
#include <sstream>

extern "C" const char* writeHelloAndReturnContent(int n, const char* basePath) {
    std::string path = std::string(basePath) + "/hello.txt";

    std::ofstream file(path, std::ios::out | std::ios::trunc);
    file << "hello world " << n  << std::endl;
    file.close();

    std::ifstream reader(path);
    std::stringstream buffer;
    buffer << reader.rdbuf();
    reader.close();

    static std::string result;
    result = buffer.str();
    return result.c_str();
}