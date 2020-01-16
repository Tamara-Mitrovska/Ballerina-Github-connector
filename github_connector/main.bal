import ballerina/io;
import ballerina/http;

public function main() {

    http:Client clientEndpoint = new("https://api.github.com");
    http:Response|error response = clientEndpoint->get("/users/Tamara-Mitrovska/repos");
    if (response is http:Response){
        json|error jsonPayLoad = response.getJsonPayload();
        if (jsonPayLoad is json){
            io:println(jsonPayLoad.toJsonString());

        } else {
            io:println("Invalid payload received ", jsonPayLoad.reason());
        }

    } else {
        io:println("Error when calling the backend: ", response.reason() );
    }
 }