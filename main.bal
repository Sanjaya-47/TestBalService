import ballerina/io;
import  ballerina/http;
import ballerina/os;

public function main() {
    io:println("Hello, World!");
}

configurable int port = ?;
configurable int envVarPort = ?;
int pseudoPort = 9099;

string varPort = os:getEnv("port");
string var_envVarPort = os:getEnv("envVarPort");

service /base on new http:Listener(pseudoPort){
    resource function get welcome() returns string{
        return string `pseudoPort ${pseudoPort} varPort ${varPort} var_envVarPort ${var_envVarPort}`;
    }
    }

    
    // service http:Service / on new http:Listener(port){
    //     resource function post greeting() returns string{
    //         //string message = string `Hello ${greeting.to}! ${greeting.content}`;
    //         //string message = string `Hello ${name}! ${content} *** envVars - name ${envVar_name} content ${envVar_content}`;
    //         //return message;
    //         return "Hi";
    //     }
    // }