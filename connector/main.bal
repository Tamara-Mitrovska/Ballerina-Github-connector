import ballerina/config;
import ballerina/http;
import ballerina/io;
import wso2/github4;

github4:GitHubConfiguration gitHubConfig = {
    accessToken: "4744310b172c5f7a43a50ccf7e1c351c6447c88c"
};
 
github4:Client githubClient = new(gitHubConfig);

public function main() {
    github4:Repository|error result = githubClient->getRepository("IAP-Exercise-1");
    if (result is github4:Repository) {
        io:println("Repository IAP-Exercise-1: ", result);
    } else {
        io:println("Error occurred on getRepository(): ", result);
    }
}