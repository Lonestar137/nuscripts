#!/bin/nu

# IF you want new shell to have access to stdin ( {command} | myscript.nu )
#   #!/usr/bin/env -S nu --stdin



const OLLAMA_SERVER = 'http://localhost:11434'

def "main diff" [branch: string] {

  let result = git diff $branch | complete
  if $result.exit_code == 129 {
    print "Not a git repository."
  } else if $result.exit_code == 0 {
    let git_log = $result.stdout
    let prompt = "Peer review the following code changes and give me feedback on any issues you see with these changes.
      \nAlso, if you have a better implementation of any part please suggest it.  Provide examples if possible.  I will provide you the git diff between two branches: \n" + $git_log

    print "Sending Prompt: \n" + $prompt
    print "umm..."

    let response = http post -t application/json $"($OLLAMA_SERVER)/api/generate" { model: "codellama:latest",  prompt: $prompt }
    let response_table = $response | lines | each { $in | from json }
    let formatted_response = $response_table | get response | str join ""

    print $formatted_response

  } else {
    print "Some unknown error occured."
  }
}

def main [] {
  print "Available subcommands: diff"
}
