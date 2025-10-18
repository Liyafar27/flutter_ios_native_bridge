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
    
    // ШАГ 4: библиотека записывает строку в файл (перезаписывает)
    std::ofstream file(path, std::ios::out | std::ios::trunc);
    file << "hello world " << n << std::endl;
    file.close();
    
    // ШАГ 5: читаем ОБНОВЛЁННОЕ содержимое ФАЙЛА
    std::ifstream reader(path);
    std::stringstream buffer;
    buffer << reader.rdbuf();
    reader.close();
    
    // Возвращаем именно то, что прочитали из файла
    static std::string result;
    result = buffer.str();
    return result.c_str();
}
