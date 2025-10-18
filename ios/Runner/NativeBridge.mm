// NativeBridge.mm
#import "CppBridge.h"
#include <string>
#include <fstream>
#include <sstream>

static std::string getFilePath() {
    return "/tmp/hello.txt";
}

extern "C" const char* writeHelloAndReturnContent(int n) {
    std::string path = "/tmp/hello.txt";
    std::ofstream file(path, std::ios::out | std::ios::trunc);
    file << "hello world " << n << std::endl;
    file.close();
    
    std::ifstream reader(path);
    std::stringstream buffer;
    buffer << reader.rdbuf();
    reader.close();
    
    static std::string result;
    result = buffer.str();
    return result.c_str();
}
