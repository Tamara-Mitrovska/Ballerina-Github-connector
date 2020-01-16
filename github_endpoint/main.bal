import ballerina/http;
import ballerina/io;
// import ballerina/test;

public type GithubConfiguration record {
    string username;
    };

public type Client client object {

    public string username;
    public http:Client basicClient;

    public function __init(GithubConfiguration githubConfig) {
        // self.init(githubConfig);
        self.basicClient = new("https://api.github.com");
        self.username = githubConfig.username;
    }


    public remote function getRepos() returns @tainted json|error {
        string requestPath = "/users/" + self.username + "/repos" ;
        http:Response response = check self.basicClient->get(requestPath);
        io:println(response);
        json payload = check response.getJsonPayload();
        io:println("payload", payload.toString());
        return payload;
    }
};





public function main() {

    GithubConfiguration githubConfig = {
    username:"Tamara-Mitrovska"
};
    Client githubClient = new(githubConfig);
    json|error repos = githubClient->getRepos();
    io:println(repos.toString());
}